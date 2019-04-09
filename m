Return-Path: <SRS0=j3xG=SL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A30C10F0E
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 16:34:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B18972077C
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2019 16:34:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZSoRqONB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="o/wlH4WH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B18972077C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:Subject:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=of0UoQoImVMxEntidNqgrsN/pSe6MgRJa47j57uljjA=; b=ZSoRqONBxAhb9xHGydOd1FS2x+
	h6YLnc3nq8f6t0/nYwqdHNSFPrBrKZkdrXk+183VCoJMveUYvH7mZlBtKCjwi7bWJ4HrBuZDFH446
	zKnv32RZaEe6trhICSilG5DLXX9YWqKC94j/BeSRCK7k/1m4Ok40XMQN8w7ohZbKyBfkTDi7weh5l
	JBftZbdWnK8vWN+ETedNExx4YH+WsyFt/eyTXinJyluOPdXhBJWGGOaoFu7s/wlceaWLyjzKVaPEZ
	eaPYpSvNi1n+aXEeQ5hMbLKe/lAaLceGfVnDddeMT0TS6221ywnbQYxFs6DmUTZQjDrnAdvATJScz
	uRmMckxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDthQ-0007Lj-Nu; Tue, 09 Apr 2019 16:34:16 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDthG-0007AA-6X
 for linux-mtd@lists.infradead.org; Tue, 09 Apr 2019 16:34:11 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x39GY0RF120822;
 Tue, 9 Apr 2019 11:34:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1554827640;
 bh=R+lBPg9u3BmflWUbzWoTFlh+zbBJl9a+FtpF5t2rl4k=;
 h=From:Subject:To:References:Date:In-Reply-To;
 b=o/wlH4WHq/o2ZeBrbJy0osVdj4Re2z6FpHAn5XAUORX/R4AN7yBRad8eliuJoboq3
 wLQjANlHpbVkWQE+VtO9h/8etHHNs2z49QW71gpF1Xb96G6L48ndEOdX2bTHFk/OV9
 ZUApv287eztrmL4hbVD+PggYxhEs0B1q8uf5B9qU=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x39GY0af058693
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 Apr 2019 11:34:00 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 9 Apr
 2019 11:33:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 9 Apr 2019 11:33:59 -0500
Received: from [172.22.219.153] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x39GXuCH094160;
 Tue, 9 Apr 2019 11:33:57 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2] MAINTAINERS: MTD Git repository is hosted on kernel.org
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Tudor
 Ambarus <Tudor.Ambarus@microchip.com>, <linux-mtd@lists.infradead.org>
References: <20190405080342.26330-1-miquel.raynal@bootlin.com>
Message-ID: <9174a343-6495-7750-4c58-50b2f3d5fb53@ti.com>
Date: Tue, 9 Apr 2019 22:03:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190405080342.26330-1-miquel.raynal@bootlin.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_093406_582327_30E4D66A 
X-CRM114-Status: GOOD (  15.02  )
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



On 05-Apr-19 1:33 PM, Miquel Raynal wrote:
> Because of the slowness of the infradead.org server, Linus requested
> that we send him PRs from another domain. We moved our Git repository
> to kernel.org and maintain the following branches:
> * Fixes based on the last -rc: mtd/fixes
> * Next branch based usually on -rc1: mtd/next, nand/next, spi-nor/next.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> 
> Changes in v2:
> * Drop nand/fixes and spi-nor/fixes, we won't use them.
> 
> 
>  MAINTAINERS | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 

Acked-by: Vignesh Raghavendra <vigneshr@ti.com>

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 383915d69a51..ef6a56141344 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10004,8 +10004,8 @@ M:	Vignesh Raghavendra <vigneshr@ti.com>
>  L:	linux-mtd@lists.infradead.org
>  W:	http://www.linux-mtd.infradead.org/
>  Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
> -T:	git git://git.infradead.org/linux-mtd.git master
> -T:	git git://git.infradead.org/linux-mtd.git mtd/next
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/mtd/
>  F:	drivers/mtd/
> @@ -10617,8 +10617,7 @@ R:	Richard Weinberger <richard@nod.at>
>  L:	linux-mtd@lists.infradead.org
>  W:	http://www.linux-mtd.infradead.org/
>  Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
> -T:	git git://git.infradead.org/linux-mtd.git nand/fixes
> -T:	git git://git.infradead.org/linux-mtd.git nand/next
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
>  S:	Maintained
>  F:	drivers/mtd/nand/
>  F:	include/linux/mtd/*nand*.h
> @@ -14603,8 +14602,7 @@ M:	Tudor Ambarus <tudor.ambarus@microchip.com>
>  L:	linux-mtd@lists.infradead.org
>  W:	http://www.linux-mtd.infradead.org/
>  Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
> -T:	git git://git.infradead.org/linux-mtd.git spi-nor/fixes
> -T:	git git://git.infradead.org/linux-mtd.git spi-nor/next
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
>  S:	Maintained
>  F:	drivers/mtd/spi-nor/
>  F:	include/linux/mtd/spi-nor.h
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
