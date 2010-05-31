Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OIz3I-0006LG-1Y
	for linux-mtd@lists.infradead.org; Mon, 31 May 2010 07:04:48 +0000
Subject: Re: Expected capabilities of MTD-layer drivers?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Leo Barnes <barnes.leo@gmail.com>
In-Reply-To: <AANLkTil3v1loUPrHZKHGe36FUqxYOTp52PDtXd9jAGpq@mail.gmail.com>
References: <AANLkTil3v1loUPrHZKHGe36FUqxYOTp52PDtXd9jAGpq@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 31 May 2010 10:02:35 +0300
Message-ID: <1275289355.2678.29.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-05-31 at 08:51 +0200, Leo Barnes wrote:
> Hello!
> 
> I have recently run into trouble with what I now believe is a buggy
> driver in the MTD-layer. The driver in question is the msm_nand driver
> in the MSM android kernel:
> 
> http://android.git.kernel.org/?p=kernel/msm.git;a=blob;f=drivers/mtd/devices/msm_nand.h;h=b5e6293e929ab0cab0fc1c1b35a5526915b64086;hb=HEAD
> 
> It seems to be written with YAFFS2 entirely in mind, which means that
> when trying to access it in other ways results in errors. So, in order
> to tell if it is in fact the driver that is buggy, I need to find out
> what the expected capabilities of nand_read/nand_read_oob and
> nand_write/nand_write_oob actually are.
> 
> 1. What are the allowed amount of bytes that can be read with
> nand_read? In the driver, this seems to be multiples of the pagesize,
> but I have spotted the UBI driver trying to read 64 byte chunks when
> trying to scan all the EC headers (which fails). When studying the
> OneNAND drivers, an arbitrary amount of bytes seems to be allowed, but
> OneNAND is after all quite different from regular NAND.

MTD interface assumes that arbitrary amount of bytes can be read. I'm
not sure this is a good idea, but this is historical.

> 2. What are the allowed amount of bytes that can be written with
> nand_write/nand_write_oob?

Any amount, but aligned to the min I/O unit size (mtd->writesize).

> 3. When running the mtd_readtest, the test fails on every page on
> every block when it asks the driver to read OOB-data. What is the
> expected behaviour when ops.mode = MTD_OOB_PLACE, ops.datbuf = ops.len
> = 0 and ops.ooblen = mtd->oobsize (64 bytes in this case)? At the
> moment, the driver returns EBADMSG whenever mtd_readtest tries to do
> this.

Sorry, not sure, I do not use OOB and already forgot. But the OneNAND
driver or nand_base.c is a good reference.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
