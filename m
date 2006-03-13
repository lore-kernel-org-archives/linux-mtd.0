Received: from mxs2.siemens.at ([194.138.12.133])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FIovW-0005lc-Su
	for linux-mtd@lists.infradead.org; Mon, 13 Mar 2006 10:25:53 -0500
Received: from vies1kbx.sie.siemens.at ([158.226.129.82])
	by mxs2.siemens.at  with ESMTP id k2DFP0ZA027698
	for <linux-mtd@lists.infradead.org>; Mon, 13 Mar 2006 16:25:00 +0100
Received: from nets138a.ww300.siemens.net ([158.226.129.98])
	by vies1kbx.sie.siemens.at (8.12.11/8.12.1) with ESMTP id
	k2DFOpcJ006786
	for <linux-mtd@lists.infradead.org>; Mon, 13 Mar 2006 16:25:00 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Mar 2006 16:24:56 +0100
Message-ID: <38F58D7B92CB20438DF49D28B572CC6F23BBEA@budgw09a.ww300.siemens.net>
From: "Selmeci, Tamas" <tamas.selmeci@siemens.com>
To: <linux-mtd@lists.infradead.org>
Subject: SMC+vivi
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!

Is anybody here who has some experience with SmartMedia Cards and Vivi?
(Especially on S3C2410?)

My boot device is a 64MB SMC. This is partitioned with Vivi, which is
also the boot manager. These are the partitions:
1. Vivi program code
2. Vivi data
3. Kernel image
4. Root FS

Data is downloaded to the card via the developer board, using it's
specific download tool.=20

Everything is OK until the point where I want to mount root fs. It seems
that the SMC is partitioned in the standard MTD-manner, but currently I
can't make my kernel mount the rootfs.I don't know if I have to enable
NFTL and FTL in 2.6.15-5 kernel in order to be able to mount the root fs
located on SMC. Currently they're enabled, but during the boot, the
kernel displays no message at all about MTD devices - I think it should,
because SMC is an MTD too... That's why the given kernel root parameters
(root=3D/dev/mtdblock/3, mtdblock3) are all useless.

What should I do? Does anybody has any idea?

Regards:
--
Tamas Selmeci
Siemens PSE HU
Tel.:    +36-1-471-3861
Email:   tamas.selmeci@siemens.com
Address: H-1143 Budapest, Gizella ut 51-59=20
