Return-Path: <SRS0=s+BH=MQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A9BC4338F
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jul 2021 14:29:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF5C660E53
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Jul 2021 14:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF5C660E53
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kaiser.cx
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AcbvFlAwVKYGZxGx6JyDaIGPksUB7yqUXWjM9Ps+Ky8=; b=TUZU0QkMeuYvum
	XhlxvWW3K+0Lv3RGUw1EJmHZZOZM+REsNGXy/tvIFtDe45OisGb9Rqr3uqp1OH0SciL0X0KoJUgqB
	PrN2T7/u1THA0AXsdhBjcJqoE4XVJNGQ1e8Xr1MPNdU5WJH0gfvvwDin+8/Dlq82YTlXxXXS2y9J4
	AH0b3GE3TDm2XQmW0H8+tyW0fovqTsKN0j7KdhfokkwnhXMcpNpClIzKMB0qwBzWMZMx9BpvXJ332
	v1jYzkR2Ob4V2SwZjMaWb4oCdL/q7JAOCSNZsxSUsHxHzw7nCVOKUd569jcCcNkDt0P0cOYWx5uO7
	BRTeiFvGspyqDn9QeMww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7Id7-007HsW-JZ; Sat, 24 Jul 2021 14:27:53 +0000
Received: from viti.kaiser.cx ([2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7Id1-007Hs7-S2
 for linux-mtd@lists.infradead.org; Sat, 24 Jul 2021 14:27:49 +0000
Received: from ipservice-092-217-090-214.092.217.pools.vodafone-ip.de
 ([92.217.90.214] helo=martin-debian-2.paytec.ch)
 by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <postmaster@kaiser.cx>)
 id 1m7Icl-0002yQ-Ds; Sat, 24 Jul 2021 16:27:31 +0200
Received: from martin by martin-debian-2.paytec.ch with local (Exim 4.92)
 (envelope-from <martin@martin-debian-2.paytec.ch>)
 id 1m7Ick-0006H2-Vx; Sat, 24 Jul 2021 16:27:31 +0200
Date: Sat, 24 Jul 2021 16:27:30 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: Add a check in of_get_nand_secure_regions()
Message-ID: <20210724142712.GA24036@martin-debian-1.paytec.ch>
References: <YMtQFXE0F1w7mUh+@mwanda>
 <20210715225045.66185-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210715225045.66185-1-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210724_072748_112655_40A7A33A 
X-CRM114-Status: GOOD (  12.03  )
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

Hi all,

Thus wrote Miquel Raynal (miquel.raynal@bootlin.com):

> On Thu, 2021-06-17 at 13:37:25 UTC, Dan Carpenter wrote:
> > Check for whether of_property_count_elems_of_size() returns a negative
> > error code.

> > Fixes: 13b89768275d ("mtd: rawnand: Add support for secure regions in NAND memory")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

> Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

I'm running linux-next on an imx25 system with the following flash chip

[    1.997539] nand: device found, Manufacturer ID: 0x98, Chip ID: 0xaa
[    2.004134] nand: Toshiba NAND 256MiB 1,8V 8-bit
[    2.008917] nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 128

The system is using the drivers/mtd/nand/raw/mxc_nand.c driver.

Since this commit appeared in linux-next, mxc_nand's probe function fails
with -EINVAL, taking this path

mxcnd_probe
   nand_scan
      nand_scan_with_ids
         nand_scan_tail
            of_get_nand_secure_regions

nr_elem = of_property_count_elems_of_size(dn, "secure-regions", sizeof(u64));
returns -EINVAL as there's no secure-regions property in my device tree.

We should certainly handle negative error codes before we calculate
chip->nr_secure_regions = nr_elem / 2
but a missing secure-regions property is a valid case and should not make
the probe fail.

If the property exists, but the device-tree entry is incorrect
and of_property_count_elems_of_size returns -ENODATA, we might print a
warning and ignore the entry.

What do you think?

Thanks,

   Martin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
