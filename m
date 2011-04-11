Received: from fmmailgate05.web.de ([217.72.192.243])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q9Isn-0006x5-Oo
	for linux-mtd@lists.infradead.org; Mon, 11 Apr 2011 15:18:30 +0000
Received: from mwmweb014  ( [172.20.18.23])
	by fmmailgate05.web.de (Postfix) with ESMTP id 6B8A765367A0
	for <linux-mtd@lists.infradead.org>;
	Mon, 11 Apr 2011 17:18:27 +0200 (CEST)
Date: Mon, 11 Apr 2011 17:18:27 +0200 (CEST)
From: "Sven Krauss" <sven.krauss@web.de>
To: linux-mtd@lists.infradead.org
Message-ID: <1631427694.1700754.1302535107434.JavaMail.fmail@mwmweb014>
Subject: DMA misaligned error with device 4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!

I am working on a TI-OMAP (OMAP3530 Kernel 2.6.33.7) board and with heavy l=
oad i got the following error.=C2=A0

DMA misaligned error with device 4

BUG: soft lockup - CPU#0 stuck for 61s! [jffs2_gcd_mtd4:419]
Modules linked in:
=C2=A0
Pid: 419, comm: =C2=A0 =C2=A0 =C2=A0 jffs2_gcd_mtd4
CPU: 0 =C2=A0 =C2=A0Not tainted =C2=A0(2.6.33.7 #1)
PC is at omap_write_buf_dma_pref+0x184/0x230
LR is at omap_write_buf_dma_pref+0x178/0x230
pc : [<c01fe170>] =C2=A0 =C2=A0lr : [<c01fe164>] =C2=A0 =C2=A0psr: 20000013
sp : cfafdc30 =C2=A0ip : cfafdb80 =C2=A0fp : cf8d2010
r10: 00000800 =C2=A0r9 : 00000100 =C2=A0r8 : c711b5be
r7 : 00000800 =C2=A0r6 : cf8d2000 =C2=A0r5 : 00000001 =C2=A0r4 : 00000000
r3 : fe000000 =C2=A0r2 : 00000001 =C2=A0r1 : cf8cb1c0 =C2=A0r0 : 00000800
Flags: nzCv =C2=A0IRQs on =C2=A0FIQs on =C2=A0Mode SVC_32 =C2=A0ISA ARM =C2=
=A0Segment kernel
Control: 10c5387d =C2=A0Table: 8fb40019 =C2=A0DAC: 00000017

>From this moment the cpu is dead.

I went down to the kernel and found the following problem. I will start in =
jffs2_flash_writev() from fs/jffs2/wbuf.c. There is a for loop running thro=
ugh a vector invec. Inside the loop data is written to the write buffer (wb=
uf). If the buffer is full __jffs2_flush_wbuf will be called. If now an una=
ligned amount of data was written the next call c->mtd->write() inside the =
next condition will fail, because the pointer (v) is not aligned. This poin=
ter is directly written to the dma. This results in the crash above.

I suggest the following patch. For me this works fine.

--- linux-2.6.33.7.orig/drivers/mtd/nand/omap2.c 2010-08-02 19:27:18.000000=
000 +0200
+++ linux-2.6.33.7/drivers/mtd/nand/omap2.c 2011-04-11 17:11:53.000000000 +=
0200
@@ -503,9 +506,11 @@
=C2=A0{
=C2=A0 if (len <=3D mtd->oobsize)
=C2=A0 omap_write_buf_pref(mtd, buf, len);
+ else if (!IS_ALIGNED((unsigned long)buf, 4))
+ omap_write_buf_pref(mtd, buf, len);
=C2=A0 else
=C2=A0 /* start transfer in DMA mode */
- omap_nand_dma_transfer(mtd, buf, len, 0x1);
+ omap_nand_dma_transfer(mtd, (void*)buf, len, 0x1);
=C2=A0}
=C2=A0
=C2=A0/**
Thanks very much!


=C2=A0
___________________________________________________________
Empfehlen Sie WEB.DE DSL Ihren Freunden und Bekannten und wir  =20
belohnen Sie mit bis zu 50,- Euro! https://freundschaftswerbung.web.de
