Received: from mgw-ext04.nokia.com ([131.228.20.96])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1F1jH9-0005QV-If
	for linux-mtd@lists.infradead.org; Wed, 25 Jan 2006 06:57:26 -0500
Date: Wed, 25 Jan 2006 13:57:21 +0200
From: Jarkko Lavinen <jarkko.lavinen@nokia.com>
To: Kyungmin Park <kyungmin.park@samsung.com>
Message-ID: <20060125115721.GA31115@angel.research.nokia.com>
References: <0ITM009NXY6NSL@mmp2.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0ITM009NXY6NSL@mmp2.samsung.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Mount failed after clean mount & umount test
Reply-To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Kyungmin

Your problem might be the same OOB free region problem I met a month=20
ago.

(Before EBH) JFFS2 tried to write 8-byte cleanmarker node into the first fr=
ee region
at OOB. If you had less than 8 byes, you could cut the length into 4 bytes.=
 Then
cleanmarker contained just JFFS2 magic and nodetype.

OneNAND has free byte regions of 2 and 3 bytes.  One cannot fit the
magic and nodetype together into either of them alone.

Currently the 3 byte regions seem also unusable since writing into them=20
has a side effect of changing spare area HW ECC bytes from 0xFF to somethin=
g=20
else. As a result jffs2_check_oob_empty() will fail, since there are non=20
0xFF bytes outside the cleanmarker area.

I am myself using only 2 byte free regions where one can write without
changingh any other bytes and jffs2_check_oob_empty() works.  I have=20
to also use separate patch for wbuf.c to make it able to write and read=20
cleanmarker from multiple 2 byte fragments.

I am using at onenand_oob_64:
        .oobfree	=3D {
  =02		{14, 2}, {30, 2}, {46, 2}, {62, 2},
        }

Alternatively one could teach MTD to understand HW ECC bytes and
separate which ECC bytes are for main area and which for spare area.


Below is also a oob write verify which I used to make sure the clean
marker/EBH is written correctly.

Jarkko

---

Index: drivers/mtd/onenand/onenand_base.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /home/cvs/mtd/drivers/mtd/onenand/onenand_base.c,v
retrieving revision 1.15
diff -u -b -B -p -r1.15 onenand_base.c
--- drivers/mtd/onenand/onenand_base.c	20 Jan 2006 15:29:28 -0000	1.15
+++ drivers/mtd/onenand/onenand_base.c	23 Jan 2006 11:20:19 -0000
@@ -761,6 +761,36 @@ out:
=20
 #ifdef CONFIG_MTD_ONENAND_VERIFY_WRITE
 /**
+ * onenand_verify_oob - [GENERIC] verify the oob contents after a write
+ * @param mtd		MTD device structure
+ * @param buf		the databuffer to verify
+ * @param to		offset to read from
+ * @param len		number of bytes to read and compare
+ *
+ */
+static int onenand_verify_oob(struct mtd_info *mtd, const u_char *buf, lof=
f_t to, int len)
+{
+	struct onenand_chip *this =3D mtd->priv;
+	char *readp =3D this->page_buf;
+	int column =3D to & (mtd->oobsize - 1);
+	int status, i;
+
+	this->command(mtd, ONENAND_CMD_READOOB, to, mtd->oobsize);
+	onenand_update_bufferram(mtd, to, 0);
+	status =3D this->wait(mtd, FL_READING);
+	if (status)
+		return status;
+	=09
+	this->read_bufferram(mtd, ONENAND_SPARERAM, readp, column, len);
+=09
+	for(i =3D 0; i < len; i++)
+		if (buf[i] !=3D 0xFF && buf[i] !=3D readp[i])
+			return -EBADMSG;
+=09
+	return 0;
+}
+
+/**
  * onenand_verify_page - [GENERIC] verify the chip contents after a write
  * @param mtd		MTD device structure
  * @param buf		the databuffer to verify
@@ -792,6 +822,7 @@ static int onenand_verify_page(struct mt
 }
 #else
 #define onenand_verify_page(...)	(0)
+#define onenand_verify_oob(...)         (0)
 #endif
=20
 #define NOTALIGNED(x)	((x & (mtd->oobblock - 1)) !=3D 0)
@@ -911,7 +942,7 @@ static int onenand_write_oob(struct mtd_
 	size_t *retlen, const u_char *buf)
 {
 	struct onenand_chip *this =3D mtd->priv;
-	int column, status;
+	int column, ret =3D 0;
 	int written =3D 0;
=20
 	DEBUG(MTD_DEBUG_LEVEL3, "onenand_write_oob: to =3D 0x%08x, len =3D %i\n",=
 (unsigned int) to, (int) len);
@@ -943,9 +974,17 @@ static int onenand_write_oob(struct mtd_
=20
 		onenand_update_bufferram(mtd, to, 0);
=20
-		status =3D this->wait(mtd, FL_WRITING);
-		if (status)
+		ret =3D this->wait(mtd, FL_WRITING);
+		if (ret) {
+			DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_oob: write filaed %d\n", ret);
 			goto out;
+		}
+
+		ret =3D onenand_verify_oob(mtd, buf, to, thislen);
+		if (ret) {
+			DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_oob: verify failed %d\n", ret);
+			goto out;
+		}
=20
 		written +=3D thislen;
=20
@@ -962,7 +1001,7 @@ out:
=20
 	*retlen =3D written;
=20
-	return 0;
+	return ret;
 }
=20
 /**
