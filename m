Return-Path: <SRS0=s+BH=MQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AB5C4338F
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jul 2021 16:04:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B75C60EB1
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jul 2021 16:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B75C60EB1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H2cRogXqdBaSRpP5JiWsS3ZgH7odEwlYVqO1zrNr0ZQ=; b=VTfBfc+HmoT0ql
	pEQTH8tNW3SfcDzR3MoGzxpCu8grZwVke0l0UmMGALtKH/nAbLy/+37kdHc1hqH65kwQHU+u/MojM
	IxJ0zkl/pLatiyarsv9S2LP+diOs74NIkBBCVvbEH0/Godc6kjZk2R6iwmvUabuFABRdAMcvA9cAI
	RHPQxs3ZC2M3TuLrDugfnL2rj8vyY0n/blahOI8G9R9Gb7tWK5xSmU06PwXIuk/8eIoDgHso75KxL
	L9SZAIdXGgQXDgyKJ+K2K0ABgCsXh+OPWPJOnxMVEelbxd0o3pC9ImmEY3M2F7yLP60j/937MGpmH
	4uozE3NrEu+63MtIoXew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7K7X-007Oke-Ke; Sat, 24 Jul 2021 16:03:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7K7U-007Ojz-Mz
 for linux-mtd@lists.infradead.org; Sat, 24 Jul 2021 16:03:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A74AD60E91;
 Sat, 24 Jul 2021 16:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627142598;
 bh=uTpAM46Sxed+s6G1/L2bx3An7H0WSNp2eYFNoZ2hZEM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qTZsJhG8vIPCjJoN/ToyYi9DLuoOcHA+uMlu/zBt3V0Db9xPIzFGVc7ZESya0DGZG
 YxHtn7TOPoP40UWoRd58aNYpH0g3zf/mJiB379mlGsNTINbkawlHG9n8R3TMkbCKpl
 IuHpcrsL0euzza0axUhPElEdTRqbondaC7TtdJ0f5MywXkkvTmAHihl8+OTwNSE8Px
 0ADEE6VU3IQ0NmKrR85nANtcl1MPgiPUVkmSMNo9V/Yc6wMoaGMY7yAXgYoqecg2LI
 vbD0/5z687vtHTb9RM9UjTo4ejTlv14LqVtsjpPTTPhLUYoleV48mFtM94bvqRTau6
 qyxLbpbCj11Ow==
Date: Sat, 24 Jul 2021 21:33:08 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Martin Kaiser <martin@kaiser.cx>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: Add a check in of_get_nand_secure_regions()
Message-ID: <20210724160308.GA62321@thinkpad>
References: <YMtQFXE0F1w7mUh+@mwanda>
 <20210715225045.66185-1-miquel.raynal@bootlin.com>
 <20210724142712.GA24036@martin-debian-1.paytec.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210724142712.GA24036@martin-debian-1.paytec.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210724_090320_814759_73EDC1CE 
X-CRM114-Status: GOOD (  22.42  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
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

On Sat, Jul 24, 2021 at 04:27:30PM +0200, Martin Kaiser wrote:
> Hi all,
> 
> Thus wrote Miquel Raynal (miquel.raynal@bootlin.com):
> 
> > On Thu, 2021-06-17 at 13:37:25 UTC, Dan Carpenter wrote:
> > > Check for whether of_property_count_elems_of_size() returns a negative
> > > error code.
> 
> > > Fixes: 13b89768275d ("mtd: rawnand: Add support for secure regions in NAND memory")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> 
> > Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.
> 
> I'm running linux-next on an imx25 system with the following flash chip
> 
> [    1.997539] nand: device found, Manufacturer ID: 0x98, Chip ID: 0xaa
> [    2.004134] nand: Toshiba NAND 256MiB 1,8V 8-bit
> [    2.008917] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 128
> 
> The system is using the drivers/mtd/nand/raw/mxc_nand.c driver.
> 
> Since this commit appeared in linux-next, mxc_nand's probe function fails
> with -EINVAL, taking this path
> 
> mxcnd_probe
>    nand_scan
>       nand_scan_with_ids
>          nand_scan_tail
>             of_get_nand_secure_regions
> 
> nr_elem = of_property_count_elems_of_size(dn, "secure-regions", sizeof(u64));
> returns -EINVAL as there's no secure-regions property in my device tree.
> 

Doh! Sorry for missing this.

> We should certainly handle negative error codes before we calculate
> chip->nr_secure_regions = nr_elem / 2
> but a missing secure-regions property is a valid case and should not make
> the probe fail.
> 

Absolutely!

> If the property exists, but the device-tree entry is incorrect
> and of_property_count_elems_of_size returns -ENODATA, we might print a
> warning and ignore the entry.
> 

Hmm, I think it is best to error out in this case as the user has got DT wrong.

> What do you think?
> 

Since of_property_count_elems_of_size() returns -EINVAL if the length is not
a multiple of sizeof(u64), we can't just ignore -EINVAL.

So I think we can just check for the existence of the property before invoking
of_get_nand_secure_regions(). Miquel, what do you think?

Thanks,
Mani

> Thanks,
> 
>    Martin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
