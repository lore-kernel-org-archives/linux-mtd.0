Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CFs61-00085x-Ug
	for linux-mtd@lists.infradead.org; Fri, 08 Oct 2004 06:35:35 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Lorenzo PARISI <lorenzo.parisi@st.com>
In-Reply-To: <1097229657.11402.1440.camel@thomas>
References: <83197f15.8bfe70e2.81c1800@mail1.agr.st.com>
	<1097229657.11402.1440.camel@thomas>
Content-Type: multipart/mixed; boundary="=-aHQQwQ/k4c2xqyLjos7P"
Message-Id: <1097231263.11402.1449.camel@thomas>
Mime-Version: 1.0
Date: Fri, 08 Oct 2004 12:27:44 +0200
Cc: MTD mailing list <linux-mtd@lists.infradead.org>,
	YAFFS mailing list <yaffs@stoneboat.aleph1.co.uk>
Subject: Re: Benchmark errors
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-aHQQwQ/k4c2xqyLjos7P
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2004-10-08 at 12:00, Thomas Gleixner wrote:
> On Fri, 2004-10-08 at 11:52, Lorenzo PARISI wrote:
> > Hi all,
> > nand_write_oob: Failed write verify, page 0x0....
> 
> So it works with JFFS2 and it fails on YAFFS. The MTD internal interface
> was reworked some time ago and it might be that the write verify does
> not work with YAFFS anymore, as YAFFS is using a legacy variant of the
> interface. Can you please switch of the write verify and test again ?
> 
Can you please figure out, where the verify exactly fails ?
Please apply the attached patch to nand_base.c

tglx



--=-aHQQwQ/k4c2xqyLjos7P
Content-Disposition: attachment; filename=nand_base.diff
Content-Type: text/x-patch; name=nand_base.diff; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 7bit

diff -u -r1.121 nand_base.c
--- nand_base.c	6 Oct 2004 19:53:11 -0000	1.121
+++ nand_base.c	8 Oct 2004 10:34:39 -0000
@@ -310,11 +310,17 @@
 {
 	int i;
 	struct nand_chip *this = mtd->priv;
+	u_char tmp;
 
-	for (i=0; i<len; i++)
-		if (buf[i] != readb(this->IO_ADDR_R))
+	for (i=0; i<len; i++) {
+		tmp = readb(this->IO_ADDR_R);
+		if (buf[i] != tmp) {
+			DEBUG (MTD_DEBUG_LEVEL0, 
+			       "Verify failed: 0x%02x instead of 0x%02x at offset %d\n",
+			       tmp, buf[i], i);
 			return -EFAULT;
-
+		}
+	}
 	return 0;
 }
 
@@ -955,7 +961,7 @@
 		 */
 		if (oobmode) {
 			if (this->verify_buf(mtd, &oob_buf[oobofs], mtd->oobsize - hweccbytes * eccsteps)) {
-				DEBUG (MTD_DEBUG_LEVEL0, "%s: " "Failed write verify, page 0x%08x ", __FUNCTION__, page);
+				DEBUG (MTD_DEBUG_LEVEL0, "%s: " "Failed write verify oob, page 0x%08x ", __FUNCTION__, page);
 				goto out;
 			}
 		} else {

--=-aHQQwQ/k4c2xqyLjos7P--
