Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OIyqm-0003oZ-TP
	for linux-mtd@lists.infradead.org; Mon, 31 May 2010 06:51:53 +0000
Received: by fxm15 with SMTP id 15so2498111fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 30 May 2010 23:51:50 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 31 May 2010 08:51:50 +0200
Message-ID: <AANLkTil3v1loUPrHZKHGe36FUqxYOTp52PDtXd9jAGpq@mail.gmail.com>
Subject: Expected capabilities of MTD-layer drivers?
From: Leo Barnes <barnes.leo@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!

I have recently run into trouble with what I now believe is a buggy
driver in the MTD-layer. The driver in question is the msm_nand driver
in the MSM android kernel:

http://android.git.kernel.org/?p=kernel/msm.git;a=blob;f=drivers/mtd/devices/msm_nand.h;h=b5e6293e929ab0cab0fc1c1b35a5526915b64086;hb=HEAD

It seems to be written with YAFFS2 entirely in mind, which means that
when trying to access it in other ways results in errors. So, in order
to tell if it is in fact the driver that is buggy, I need to find out
what the expected capabilities of nand_read/nand_read_oob and
nand_write/nand_write_oob actually are.

1. What are the allowed amount of bytes that can be read with
nand_read? In the driver, this seems to be multiples of the pagesize,
but I have spotted the UBI driver trying to read 64 byte chunks when
trying to scan all the EC headers (which fails). When studying the
OneNAND drivers, an arbitrary amount of bytes seems to be allowed, but
OneNAND is after all quite different from regular NAND.

2. What are the allowed amount of bytes that can be written with
nand_write/nand_write_oob?

3. When running the mtd_readtest, the test fails on every page on
every block when it asks the driver to read OOB-data. What is the
expected behaviour when ops.mode = MTD_OOB_PLACE, ops.datbuf = ops.len
= 0 and ops.ooblen = mtd->oobsize (64 bytes in this case)? At the
moment, the driver returns EBADMSG whenever mtd_readtest tries to do
this.

Best regards,
//Leo
