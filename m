Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897B5C388F7
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 14:20:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B3932076E
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 14:20:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iSCcF+iR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B3932076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thorsis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZEMCnBxZO8kro09WFEg9GVYRZy5fYi+Z43QF/V8P4s=; b=iSCcF+iR0dDCBoafVyQ/3d0oY9
	K5bT6LthaqjQBARaWhQ+WZ0RuUPEBarOxdQ2/gZW39PKoQhbQUhX/93qcW2w4H/oaIWcYvoLpbGSO
	ajFxrDy7cHGIBLFbcoBXAlTohxbYZP1jAm105gAd+ZHxGPTtSnCe3Uwf1i0DvwxQkrRcna5cJcC53
	aQRL163NK5mBRmx6b9UvoEGpF/oecqEYbRPUcOgFucbNZdOy1ZfoeYpNmSDswTAzGMahscDzrfKpW
	im1ULV/3sLtR/vzQZygTIL6EGMbuez7E4/wywuNPcuoZ2RZ0st40KXSTPXMa/kCtNxafCFlCFliqJ
	I8xyKtaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc81K-0003yD-ME; Mon, 09 Nov 2020 14:19:46 +0000
Received: from mail.thorsis.com ([92.198.35.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc81C-0003x2-NW
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 14:19:39 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id 9E54D477B
 for <linux-mtd@lists.infradead.org>; Mon,  9 Nov 2020 15:19:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EQkn0hQXgsR2 for <linux-mtd@lists.infradead.org>;
 Mon,  9 Nov 2020 15:19:35 +0100 (CET)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id 0B671F2C; Mon,  9 Nov 2020 15:19:33 +0100 (CET)
From: Alexander Dahl <ada@thorsis.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 05/23] mtd: mtdcore: Fix misspelled function parameter
 'section'
Date: Mon, 09 Nov 2020 15:19:28 +0100
Message-ID: <14597255.v2tPdhxTZE@ada>
In-Reply-To: <20201106213655.1838861-6-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
 <20201106213655.1838861-6-lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_091938_933845_2B69B4DB 
X-CRM114-Status: GOOD (  17.70  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Lee Jones <lee.jones@linaro.org>, David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

Am Freitag, 6. November 2020, 22:36:37 CET schrieb Lee Jones:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/mtd/mtdcore.c:1592: warning: Function parameter or member 'section'
> not described in 'mtd_ooblayout_find_eccregion' drivers/mtd/mtdcore.c:1592:
> warning: Excess function parameter 'sectionp' description in
> 'mtd_ooblayout_find_eccregion'
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/mtd/mtdcore.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index e9e163ae9d863..31d1be4b22617 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -1578,7 +1578,7 @@ static int mtd_ooblayout_find_region(struct mtd_info
> *mtd, int byte, *				  ECC byte
>   * @mtd: mtd info structure
>   * @eccbyte: the byte we are searching for
> - * @sectionp: pointer where the section id will be stored
> + * @section: pointer where the section id will be stored
>   * @oobregion: OOB region information
>   *
>   * Works like mtd_ooblayout_find_region() except it searches for a specific
> ECC

Reviewed-by: Alexander Dahl <ada@thorsis.com>

Greets
Alex




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
