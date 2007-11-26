Received: from s200aog12.obsmtp.com ([207.126.144.126])
	by bombadil.infradead.org with smtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Iwhfv-0001v0-8d
	for linux-mtd@lists.infradead.org; Mon, 26 Nov 2007 17:23:24 +0000
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 80739DA97
	for <linux-mtd@lists.infradead.org>;
	Mon, 26 Nov 2007 17:23:10 +0000 (GMT)
Received: from mail1.nap.st.com (mail1.nap.st.com [10.150.200.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4A2E84C1E1
	for <linux-mtd@lists.infradead.org>;
	Mon, 26 Nov 2007 17:23:10 +0000 (GMT)
From: Massimo CIRILLO <massimo.cirillo@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: Wrong cache invalidation in cfi_cmdset0001.c (2.6.21 kernel)
Date: Mon, 26 Nov 2007 18:23:09 +0100
Message-ID: <000a01c83051$03c9a510$7205960a@nap.st.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


We found an issue in cfi_cmdset0001.c file of 2.6.21 kernel.
It is related to cache region invalidation in the buffered
write procedure.

The original code performs cache invalidation from "adr" to "adr + len" =
in
do_write_buffer() while we modify region from "cmd_adr" to "len2"=20
where len2 is equal to initial value of len.

The following is the patch to apply for 2.6.21 kernel.

--- a/drivers/mtd/chips/cfi_cmdset_0001.c	2007-11-26 18:06:37.000000000 =
+0100
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c	2007-11-26 18:06:44.000000000 =
+0100
@@ -1472,6 +1472,7 @@ static int __xipram do_write_buffer(stru
 	int ret, wbufsize, word_gap, words;
 	const struct kvec *vec;
 	unsigned long vec_seek;
+	int len2=3Dlen;
=20
 	wbufsize =3D cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
 	adr +=3D chip->start;
@@ -1578,7 +1579,7 @@ static int __xipram do_write_buffer(stru
 	chip->state =3D FL_WRITING;
=20
 	ret =3D INVAL_CACHE_AND_WAIT(map, chip, cmd_adr,
-				   adr, len,
+				   cmd_adr, len2,
 				   chip->buffer_write_time);
 	if (ret) {
 		map_write(map, CMD(0x70), cmd_adr);

In any case we believe this patch should be valid also for the 2.6.22 =
and 2.6.23 kernel.

Looking forward feedbacks.
