Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837F2C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jan 2022 03:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J1oNJGyN/bas+C3MzPVIEjOoqPrD/K1J9f7vgoczcVI=; b=eOOTMJ7KBYhvKE
	vBhMImtUshNJpbZIudMgz31bT5E5rwrwIMvza0tMdc4Si9xkar4jon2z42yGr3ivavD2ua0OP4P4W
	ivordeD4Dmk1KdF6ILdMIr68m43236acAWvI+ET4xQvcN8bD9NfScnEJ9dTV+YInQq5VQWWd52Sha
	qwA2bBhQ64+/WCGMwV6HkmwyK56ckoYiWrMV/DLWq8Fcp6hUk9VqMkaxiJxPGOLBU3KfKzHfnSO2P
	ZfVUi2GWsyhwn8Lt/2TmVGPuWxXG9+szQXKeEWcuqKHhOnxE6gzFyFhUdasl3ztWS0R5P/IWNte5/
	C5wN2pEd1/hZdYLOKllg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5fdz-0027XF-He; Fri, 07 Jan 2022 03:10:19 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5fdx-0027WJ-5p
 for linux-mtd@lists.infradead.org; Fri, 07 Jan 2022 03:10:18 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so10601271pjf.3
 for <linux-mtd@lists.infradead.org>; Thu, 06 Jan 2022 19:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iY5YKhrWGtv3PVz3CqUsOeJdo+Ll0jlGjU2SO1zZ0rI=;
 b=E4EctSnN4YWAnFKv4W6RlD4QPT3glQAvsVC/85AwANR2GYi0HPGSVPMESdAGOJUmmW
 SYgWw/2y0ioZ+tNexZt4OBzhRYoA4sC6cOXsOq3DpMI2ZDx9mUFZBB5N7dZJ+w9N6Pn3
 aI8/fA/d6n2xMJbit6agt78xV/nPvkcjphu6zWC77/JDsYg0PwUHQfXMC/GqGQvOUMmW
 sNu1zXpZ+/2PyWue82jj9uIO081QiNah6bsEgIXcqQFPv51M8/WecMJofvcCI+jCciGH
 x+bPNn+ZAhJvD9HT1kmq1JWw4akFWgRhpbyIHfGisnXlTEtNi2bp64OPw2R5Grr584pW
 X9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iY5YKhrWGtv3PVz3CqUsOeJdo+Ll0jlGjU2SO1zZ0rI=;
 b=iKdodVSmOmbPYwFY4Sgsg6UPCsT6bwRnaMWKm69kaOlC4iv0fpX3Q1v6zX0A16/a5E
 QZ14yn7T7k7T5T7RnaAJjXVqDvgYpTCC1gQ+wzSoMq8RNmNHwbVczL6CNTdurj0+QfYz
 //h2tUKy7a2ZM4oFRU7+f6tW/F94RszsLp6POKAIszwCNYy7C19SP2wX6vDkR0mHSgLU
 9ZJn5TcZAFI1E+EsH354rswmOOFj7QLaJZN/MO4ajxIfIBmB5Etvn2DR0DHk+O/e36A4
 8M6RfzAkDua10ePoH3hZROIhBsBCMK3FaiXLSUGaNt455YZF3gKMlueFtPO+UoUE+faU
 dsEg==
X-Gm-Message-State: AOAM530I3mQzEMEelXvnrC4Q/Yuk1oywr8LfEDBvbAsUcfXJblJEsQIk
 nJ/bc9RnTmnoCrX8ZacWu4iV762CgYo=
X-Google-Smtp-Source: ABdhPJznvRNqeW9KiMIacBGgZ9YsfjM57PB6eYRoAbWn1w65ZaA+55945j1Lf4/n/Rbym4fqyGGDBA==
X-Received: by 2002:a17:90b:4ad2:: with SMTP id
 mh18mr13513571pjb.197.1641525014620; 
 Thu, 06 Jan 2022 19:10:14 -0800 (PST)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 np1sm7563632pjb.42.2022.01.06.19.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 19:10:14 -0800 (PST)
Message-ID: <703aeebe-3413-0e5e-80ca-4c0bcd36e3f5@gmail.com>
Date: Thu, 6 Jan 2022 19:10:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v2 2/9] mtd: rawnand: brcmnand: Allow SoC to provide I/O
 operations
Content-Language: en-US
To: linux-mtd@lists.infradead.org
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Cai Huoqing <caihuoqing@baidu.com>, Colin Ian King <colin.king@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM SPECIFIC AMBA DRIVER (BCMA)"
 <linux-wireless@vger.kernel.org>,
 "open list:BROADCOM STB NAND FLASH DRIVER"
 <bcm-kernel-feedback-list@broadcom.com>
References: <20220107001328.2233896-1-f.fainelli@gmail.com>
 <20220107001328.2233896-3-f.fainelli@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220107001328.2233896-3-f.fainelli@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_191017_257448_04769602 
X-CRM114-Status: GOOD (  12.42  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 1/6/2022 4:13 PM, Florian Fainelli wrote:
> Allow a brcmnand_soc instance to provide a custom set of I/O operations
> which we will require when using this driver on a BCMA bus which is not
> directly memory mapped I/O. Update the nand_{read,write}_reg accordingly
> to use the SoC operations if provided.
> 
> To minimize the penalty on other SoCs which do support standard MMIO
> accesses, we use a static key which is disabled by default and gets
> enabled if a soc implementation does provide I/O operations.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---

[snip]

>   	init_completion(&ctrl->done);
>   	init_completion(&ctrl->dma_done);
>   	init_completion(&ctrl->edu_done);
> @@ -3145,6 +3169,8 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
>   		/* Enable interrupt */
>   		ctrl->soc->ctlrdy_ack(ctrl->soc);
>   		ctrl->soc->ctlrdy_set_enabled(ctrl->soc, true);
> +		if (brcmnand_soc_has_ops(soc))
> +			static_branch_enable(&brcmnand_soc_has_ops_key);

This hunk got mistakenly added with a rebase, I will wait for additional 
comments before spinning a new version.
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
