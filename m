Return-Path: <SRS0=DU2W=6Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B4BC3A5A9
	for <linux-mtd@archiver.kernel.org>; Sat,  2 May 2020 13:15:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D47B21974
	for <linux-mtd@archiver.kernel.org>; Sat,  2 May 2020 13:15:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a/QvilF3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D47B21974
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BuTsfJvSvns/YCTBeaoUoWjDDvFv9T/0QLE4JgumYEI=; b=a/QvilF3DTM6GK
	rV9DRIkfZ46vX7vg2eoHszQBK7I92FMAL286yhLWPMcaYsSTvNYpRWrlFI4LmZj1OFV2prFC6NpWZ
	09To89AWYQij5wAp8ohsu5hF4CxPjVW8gUZ3D/vwctIjDCS4RVMRJlntWFrzEWo+RADI24hIPtqDd
	9rVBRxcTFg2dm4zs0LX7SeVE9JkixReQ/6kZ34KWaX6GQC6yb7zd6iWyZt5TiGwF9AVFiRbcNbIDE
	9bfyvphlVOpR46nbC9rjMYfjZhZnuFO6Zvi5b4+qSmLttSdEyuFTudGzpX+uoe9akJeMBxiLkjYwb
	0c53GUu2pMA+6RHk7Dgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUrzD-0000aj-GV; Sat, 02 May 2020 13:15:19 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUrz9-0000YY-UZ
 for linux-mtd@lists.infradead.org; Sat, 02 May 2020 13:15:18 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B50A527F310;
 Sat,  2 May 2020 14:15:13 +0100 (BST)
Date: Sat, 2 May 2020 15:15:10 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Lubomir Rintel <lkundrak@v3.sk>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 00/17] mtd: rawnand: cafe: Convert to exec_op() (and more)
Message-ID: <20200502151510.59a690a8@collabora.com>
In-Reply-To: <20200502112732.330971-1-lkundrak@v3.sk>
References: <20200427082028.394719-1-boris.brezillon@collabora.com>
 <20200502112732.330971-1-lkundrak@v3.sk>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200502_061516_696549_5D4F612E 
X-CRM114-Status: GOOD (  29.11  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat,  2 May 2020 13:27:32 +0200
Lubomir Rintel <lkundrak@v3.sk> wrote:

> Boris Brezillon wrote:
> > Hello,
> > 
> > A bit of context to explain the motivation behind those conversions
> > I've been sending for the last couple of weeks. The raw NAND subsystem
> > carries a lot of history which makes any rework not only painful, but
> > also subject to regressions which we only detect when someone dares to
> > update its kernel on one of those ancient HW. While carrying drivers
> > for old HW is not a problem per se, carrying ancient and unmaintained
> > drivers that are not converted to new APIs is a maintenance burden,
> > hence this massive conversion attempt I'm conducting here.
> > 
> > So here it is, a series converting the CAFE NAND controller driver to
> > exec_op(), plus a bunch of minor improvements done along the way.
> > I hope I'll find someone to test those changes, but if there's no one
> > still owning OLPC HW or no interest in keeping it supported in recent
> > kernel versions, we should definitely consider removing the driver
> > instead.
> > 
> > Regards,
> > 
> > Boris
> > 
> > Boris Brezillon (17):
> >   mtd: rawnand: cafe: Get rid of an inaccurate kernel doc header
> >   mtd: rawnand: cafe: Rename cafe_nand_write_page_lowlevel()
> >   mtd: rawnand: cafe: Use a correct ECC mode and pass the ECC alg
> >   mtd: rawnand: cafe: Include linux/io.h instead of asm/io.h
> >   mtd: rawnand: cafe: Demistify register fields
> >   mtd: rawnand: cafe: Factor out the controller initialization logic
> >   mtd: rawnand: cafe: Get rid of the debug module param
> >   mtd: rawnand: cafe: Use devm_kzalloc and devm_request_irq()
> >   mtd: rawnand: cafe: Get rid of a useless label
> >   mtd: rawnand: cafe: Explicitly inherit from nand_controller
> >   mtd: rawnand: cafe: Don't leave ECC enabled in the write path
> >   mtd: rawnand: cafe: Don't split things when reading/writing a page
> >   mtd: rawnand: cafe: Add exec_op() support
> >   mtd: rawnand: cafe: Get rid of the legacy interface implementation
> >   mtd: rawnand: cafe: Adjust the cafe_{read,write}_buf() prototypes
> >   mtd: rawnand: cafe: Handle non-32bit aligned reads/writes
> >   mtd: rawnand: cafe: s/uint{8,16,32}_t/u{8,16,32}/
> > 
> >  drivers/mtd/nand/raw/cafe_nand.c | 805 ++++++++++++++++---------------
> >  1 file changed, 423 insertions(+), 382 deletions(-)  
> 
> Thanks for doing this. With a couple of changes I've indicated in responses to
> some of the patches this has been:
> 
> Tested-by: Lubomir Rintel <lkundrak@v3.sk>

Thanks a lot for testing *and debugging* my changes. I must admit that
was unexpected, and I'm amazed by how fast I got feedback on that one
:-). Kudos to Thomas as well for noticing the email and getting us in
touch.

> 
> Other than that, I have a couple of suggestions (I'm not really in a position 
> to demand them, but they would've done the review easier for me):
> 
> 1.) I'm wondering if we could remove these:
> 
>   /* Make it easier to switch to PIO if we need to */
>   #define cafe_readl(cafe, addr)                  readl((cafe)->mmio + CAFE_##addr)
>   #define cafe_writel(cafe, datum, addr)          writel(datum, (cafe)->mmio + CAFE_##addr)
> 
> Or at least don't add new calls to them in our patches and call 
> readl()/writel() directly. The string pasting makes it impossible to grep
> for the register names.
> 
> It's not like a switch to PIO is ever going to happen and with an instance
> of readl_poll_timeout() added it's not like it would be a matter of
> rewriting those macros.

I can certainly do that.

> 
> 2.) When the block after a conditional is multiple lines, could you please
> include the curly braces? That is:
> 
>         if (ctrl1 & CAFE_NAND_CTRL1_HAS_DATA_IN) {
>                 cafe_read_buf(chip,
>                               subop->instrs[data_instr].ctx.data.buf.in +
>                               nand_subop_get_data_start_off(subop, data_instr),
>                               nand_subop_get_data_len(subop, data_instr));
>         }
> 
> Instead of:
> 
>         if (ctrl1 & CAFE_NAND_CTRL1_HAS_DATA_IN)
>                 cafe_read_buf(chip,
>                               subop->instrs[data_instr].ctx.data.buf.in +
>                               nand_subop_get_data_start_off(subop, data_instr),
>                               nand_subop_get_data_len(subop, data_instr));
> 
> This makes things significantly easier to read for me, not to mention that it
> comes handy to have the braces around for printf debugging.

I do prefer the version without brackets, but given you debugged it,
I'd be okay changing that one ;-) (assuming Miquel is okay with that
too, of course).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
