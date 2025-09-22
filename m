Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CDBCAC5A7
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Sep 2025 06:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FHPzsxZFBuGyHEf44KBGGwBqTgiXwoV6mSUa1HGv19A=; b=dBAhNvOfAS3xgw
	yJAMIUPpvQN1BcfZVWLD9mGSJaDfC6axKgP2iMiitNWVBzwySoGoBVO7lNftz20JSDurjZxDDPse5
	EmHiPzeWojdbOUnU8nTbLfW99N69V7pM/cOL+lKrcBiA+C5VSlH9fZWPVRe2DlpEVy2arCp/ewh5F
	KpHdJSlIr5Vy2O9MB2hC5F0MC8VZZhjWteymETh2N9xaeB36hve8xv1r5aQjhwGPnWlwxtUIKQVal
	5TuPb/QNpvvlc8hXhyzPdaibi6WVqooGRFrDsudp4OkQZbHB8NXoxe5NbFRkzx1tNhtqvjtErtNY4
	ismwGaFSAL/veZwthvng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ZbF-00000008uMc-20ru;
	Mon, 22 Sep 2025 06:00:33 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0ZbC-00000008uME-16KA
	for linux-mtd@lists.infradead.org;
	Mon, 22 Sep 2025 06:00:32 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58M60FDs1170592;
	Mon, 22 Sep 2025 01:00:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758520815;
	bh=APx8eOuMTJTC4YkubB7eJd0QwNCQpx44ZVFa/uuHCDk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ik0gJIOqHz6uYuG102dHRi9EmvmFWYwusfI5DrIzyA8jxNY6aefYkDtI6AyeiKvRc
	 eISRZIfdqVrR/l6gw9X9Fo1g8u5pJqzx5KleHKTa1s+u3eHaMFMhucvvxFhQ3prinm
	 zWb4g/9jlgBPR3I8fhxJ43tyMhO274mDiR9EktUI=
Received: from DLEE209.ent.ti.com (dlee209.ent.ti.com [157.170.170.98])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58M60Fi0079861
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 Sep 2025 01:00:15 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 22 Sep
 2025 01:00:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 22 Sep 2025 01:00:14 -0500
Received: from [172.24.17.2] (lt5cg1457vgj.dhcp.ti.com [172.24.17.2])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58M609t72276522;
	Mon, 22 Sep 2025 01:00:10 -0500
Message-ID: <e79d5220-2824-4cd2-8e61-b1da8d22d2a1@ti.com>
Date: Mon, 22 Sep 2025 11:30:08 +0530
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] mtd: cfi: use struct_size() helper for cfiq allocation
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <skhan@linuxfoundation.org>, <david.hunter.linux@gmail.com>,
        <linux-kernel-mentees@lists.linux.dev>
References: <20250918184420.76047-1-krishnagopi487@gmail.com>
From: "Raghavendra, Vignesh" <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <20250918184420.76047-1-krishnagopi487@gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_230030_491979_BCE101DA 
X-CRM114-Status: GOOD (  15.10  )
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



On 9/19/2025 12:14 AM, Gopi Krishna Menon wrote:
> Documentation/process/deprecated.rst recommends against performing
> dynamic size calculations in the arguments of memory allocator
> function due to the risk of overflow. Such calculations can
> wrap around and result in a smaller allocation than what the caller
> was expecting.
> 
> Replace the size calculation in cfiq allocation with struct_size()
> helper to make the code clearer and handle the overflows correctly.
> 
> Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
> ---
>  drivers/mtd/chips/cfi_probe.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
> index a04b6174181c..e254f9cd2796 100644
> --- a/drivers/mtd/chips/cfi_probe.c
> +++ b/drivers/mtd/chips/cfi_probe.c
> @@ -208,7 +208,7 @@ static int __xipram cfi_chip_setup(struct map_info *map,
>  	if (!num_erase_regions)
>  		return 0;
>  
> -	cfi->cfiq = kmalloc(sizeof(struct cfi_ident) + num_erase_regions * 4, GFP_KERNEL);
> +	cfi->cfiq = kmalloc(struct_size(cfi->cfiq, EraseRegionInfo, num_erase_regions), GFP_KERNEL);
>  	if (!cfi->cfiq)
>  		return 0;
> 

Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

There seems to be one more occurrence of this pattern in jedec_probe.c.
Would appreciate if you could fix that too. Thanks!

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
