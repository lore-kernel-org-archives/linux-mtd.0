Return-Path: <SRS0=gTFy=RC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24519C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Feb 2019 22:59:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEA2F2087C
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Feb 2019 22:59:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m2VURS0L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEA2F2087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DISKLHdQg3I5l0CyViexEW57HG8bFUDBmBVNWSHb7kM=; b=m2VURS0LZbsB7h
	OrVH04vv4j2mf2rcl/QnCKEDNsQ+qxz/qCoFEJwI1AKVio5QSuG6o4yxOFubb1hLR8C43gWf6PLMa
	MjEmxTp3ZUb9Yu6Kpx1vyASDGtwlVinlI8WFJ+8B9BD1CWcumLHVJDL1eimRbdD1k4V3dNPfgOFT1
	YfmxfDcbayzIfsvjqG4jqEkTXIL8cWzHPVd5cNFVHfQZE9I4yt6aYOj79d72rUshjBV1W2iz2Fkui
	z5SdAeREGnvkFrE9uMg1kUzWk9uCUhiIYaAuEc2Y/qWR1keJfLjmESILH1sR+TSyX+MhwzgxEMsqc
	9MHSRa1AFpA+NGUTkz5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gz8Af-0000k1-6T; Wed, 27 Feb 2019 22:59:25 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gz8Ac-0000ji-17
 for linux-mtd@lists.infradead.org; Wed, 27 Feb 2019 22:59:24 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 9334F608A396;
 Wed, 27 Feb 2019 23:59:19 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 4GRcXsxbzWnT; Wed, 27 Feb 2019 23:59:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C8CFC608A3A6;
 Wed, 27 Feb 2019 23:59:18 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id srJ67fUplq6s; Wed, 27 Feb 2019 23:59:18 +0100 (CET)
Received: from blindfold.localnet (213-47-184-186.cable.dynamic.surfer.at
 [213.47.184.186])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 987A1608A396;
 Wed, 27 Feb 2019 23:59:18 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Tim Harvey <tharvey@gateworks.com>, linux-mtd@lists.infradead.org
Subject: Re: ubi/ubifs performance comparison on two NAND devices
Date: Wed, 27 Feb 2019 23:59:18 +0100
Message-ID: <1778492.l5RC12KMDO@blindfold>
In-Reply-To: <CAJ+vNU1xtj3f7GefcyY=s7RmNxtBjFpefaG57Xmeq80w0=monQ@mail.gmail.com>
References: <CAJ+vNU3sxjVjuPg8NRCBJzRNByM__xFAYdiQo=-ZKXawvZw1yQ@mail.gmail.com>
 <CAFLxGvyFgO-OzgrijL_i0Us5=_VbuYTSCBW0EVyC+8HYpnqOfg@mail.gmail.com>
 <CAJ+vNU1xtj3f7GefcyY=s7RmNxtBjFpefaG57Xmeq80w0=monQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190227_145922_370636_F30CF85C 
X-CRM114-Status: GOOD (  25.75  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Tim,

Am Mittwoch, 27. Februar 2019, 23:43:17 CET schrieb Tim Harvey:
> On Wed, Feb 27, 2019 at 2:13 PM Richard Weinberger
> <richard.weinberger@gmail.com> wrote:
> >
> > On Wed, Feb 27, 2019 at 9:39 PM Tim Harvey <tharvey@gateworks.com> wrote:
> > >
> > > Greetings,
> > >
> > > I've got two embedded boards (IMX6 using gpmi-nand driver) that are
> > > identical except for the NAND FLASH and am trying to understand why
> > > I'm seeing a massive performance difference when it comes to ubi and
> > > ubifs (in particular ubi scanning and UBIFS resizing).
> > >
> > > Micron MT29F16G08ADACAH4:
> > > - page size: 4320 bytes (4096 + 224 bytes)
> > > - block size: 64 pages (256K + 14K bytes)
> > > - device size: 16Gb
> > > - 30ns per-block read
> > > - 300us per-block program
> > > - 2.0ms per-block erase
> > >
> > > Cypress S34ML16G202BHI000
> > > - page size: 2176 bytes (2048+128)
> > > - block size: 64 pages (128K + 8K)
> > > - device size: 16Gb
> > > - 25ns per-block read
> > > - 300us per-block program
> > > - 3.5ms per-block erase
> > >
> > > The parts are relatively close in per-block performance but because
> > > the Micron has twice the block size I think of it being twice as fast
> > > on a per-byte basis compared to the Cypress and I do see this relative
> > > performance when testing read/write/erase both in modern U-Boot and
> > > latest Linux. What doesn't add up is that the Cypress part takes about
> > > 7x longer to complete the ubi attach (between 'attaching mtd' and

Here you say attach takes 7 times longer.

> > > 'scanning is finished' and about 100x longer to complete the UBIFS
> > > free space fixup (between 'start fixing up free space' and 'free space
> > > fixup complete') performed on the first mount of a ubifs filesystem
> > > that was created with auto-resize enabled.
> > >
> > > Both parts are 2GiB and the ubi scanning on attach in the kernel goes
> > > from ~4s on Micron to ~28s on Cypress and the UBIFS free space fixup
> > > goes from 0.5s on Micron to a whopping 56s on Cypress.
> > >
> > > Any ideas why would I be seeing this kind of performance difference
> > > when the raw erase/read/write performance is (both datasheet and Linux
> > > tests) only 2x slower? Anywhere I can look to improve performance of
> > > the Cypress part?
> >
> > Let's focus as first step on UBI attach by scanning. Here UBI reads
> > the first two
> > (sub)pages of each block.
> >
> > Please figure whether in both setup subpages are used or not. Then
> > measure how long
> > it takes to read a single page.
> > Given this numbers we can start with the detective work.
> >
> 
> Hi Richard,
> 
> I suppose I should have provided:
> 
> [    6.438793] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xd5
> [    6.445240] nand: Micron MT29F16G08ADACAH4
> [    6.449362] nand: 2048 MiB, SLC, erase size: 256 KiB, page size:
> 4096, OOB size: 224
> [    6.459037] Scanning device for bad blocks
> [    8.784007] 3 fixed-partitions partitions found on MTD device gpmi-nand
> [    8.790716] Creating 3 MTD partitions on "gpmi-nand":
> [    8.795823] 0x000000000000-0x000001000000 : "uboot"
> [    8.810841] 0x000001000000-0x000001100000 : "env"
> [    8.819356] 0x000001100000-0x000080000000 : "rootfs"
> [    9.355834] gpmi-nand 112000.gpmi-nand: driver registered.
> 
> and
> 
> [    6.014529] nand: device found, Manufacturer ID: 0x01, Chip ID: 0xd5
> [    6.020907] nand: AMD/Spansion S34ML16G2
> [    6.024917] nand: 2048 MiB, SLC, erase size: 128 KiB, page size:
> 2048, OOB size: 128
> [    6.033385] Scanning device for bad blocks
> [   10.689345] 3 fixed-partitions partitions found on MTD device gpmi-nand
> [   10.696056] Creating 3 MTD partitions on "gpmi-nand":
> [   10.701143] 0x000000000000-0x000001000000 : "uboot"
> [   10.720392] 0x000001000000-0x000001100000 : "env"
> [   10.729253] 0x000001100000-0x000080000000 : "rootfs"
> [   11.793715] gpmi-nand 112000.gpmi-nand: driver registered.
> 
> So its taking 2.3s to scan the Micron and 5.4s to scan the Cypress
> which is what I would expect (Micron 2x faster as it has similar read
> time per block but half as many blocks)

And now all is good.
I'm confused.

> > Did you also check what timings both NANDs are using?
> 
> No, where would I see these? Would this be something that can be
> provided in device-tree or a nand chip-specific driver?

Usually the driver computes them based on various sources.
See drivers/mtd/nand/raw/nand_timings.c

Thanks,
//richard




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
