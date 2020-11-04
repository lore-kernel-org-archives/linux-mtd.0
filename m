Return-Path: <SRS0=yokd=EK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C12C2D0A3
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2020 03:39:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E118A20781
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2020 03:39:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eqlIs1j1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqaci2K8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E118A20781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4FxXCLqxrohwhQASM5dILXw9g6YwcYtLUmGBEzm/bps=; b=eqlIs1j1OE9qRErF7gUteM+bm
	2q4HJN+boClmmdALvLK0TYpbPPDbpObP63dWqgLZ9q+P3ZRI2AEugzPhpoWmpXSdlFv/qP/7eQ523
	QDGAI6Oix2U233sqklm5q6DMmUwQj3bhjsmI9R06Po+CuwkUuAz8xooqigqO2bosHBhNXUBXQC4fd
	odA/RrmWPHyOjrr+GhYaKa2YrGtt0qUrqEN8WLUYIckNnXhq2f9qVuqBnEk4c31mrIyV3ju3k7wTn
	gHtTolTAlOJSasnr4UVIUm2KgArq0kKMiBRS68TL4dpqdX7AlTtJkHXdxFE8tQ9R16au2dGlOYJUy
	TfDPhd0Dw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ka9dD-0002WQ-Sr; Wed, 04 Nov 2020 03:38:43 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ka9d7-0002Vn-3j
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2020 03:38:38 +0000
Received: by mail-pf1-x430.google.com with SMTP id z3so742058pfb.10
 for <linux-mtd@lists.infradead.org>; Tue, 03 Nov 2020 19:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YLtmPSq/gZaYtW23BxWonT+DULm5kLo0W0DpjwAsfhI=;
 b=iqaci2K8GKT+RZlJ/Pksv05GhtiAxp8bHyQoZszQtMUaCO6BH5cms2EbKD2OysZGb9
 V73C5TWcNBY1I4NUN8CKsTFm49C6l9C/zcuuNuQVwv06uQPZYfWyJQ0AKlBG2t1FKPeo
 GGdDSipkg1PZeIQu63PLZoBYHCXWP6aJsTiAG2TKb8w0L2horqjE6difU4OgtbIHqScY
 bkhO3LcVt8rg2luyvsD1UsgoD7I0KuSXptcFqLofFePYKi7vrQOvRQZFypmyjyU75WDE
 WczEt+atAEXlwp9lC7eSIgP+WfXGzZjDGNZUU7gf9u7tyyybSUmCCm1VKwMBYD0KsOU3
 pkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YLtmPSq/gZaYtW23BxWonT+DULm5kLo0W0DpjwAsfhI=;
 b=QEUic6rZrw0XSi9855qR055gd//MTEvdd+PaKqkqAUZ0WiqH7SwPelSbJBEydwyEqh
 LGJMvnz+3udPsGlB9bvw80+EPaARtUpcR7NtDDuEuF5+9v1KsZ5ye55EhosZmy+6Yjrk
 PkobPJTDQN3LfmO4eQ5MJ9b6SJsR4qZrMWutAveHOcJyCzSiEEXXzhDSmkzUt5HhIRpw
 g/3tbRfOjJJyEs4le4fZRLODU6WiIFWjoBQM31TOjOBnt0xxlX7EJsr06xVkqUExz4xt
 WpFDdSWtDDAevmBAs7AijBPn23GNYzYxx3vpHfw8JnuS3/OOWpCiTFQknbWwFBAb7qba
 8Wvg==
X-Gm-Message-State: AOAM530igZu9o32lvg3AHXNH/hZMD9EAJ2tNGd3zfqCcZ3b3He2gqP30
 JstxBuXxHeqxrmn6bVearlA=
X-Google-Smtp-Source: ABdhPJyj/PWwv3HfM+i3uhqsjzily+vtLgiW5mjiAvEgecpDxNnv+S2fvt+3xdYfwDphYqjBF0kg1w==
X-Received: by 2002:a63:6547:: with SMTP id z68mr19838680pgb.411.1604461114808; 
 Tue, 03 Nov 2020 19:38:34 -0800 (PST)
Received: from [10.230.28.234] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id z10sm518189pjz.49.2020.11.03.19.38.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 19:38:34 -0800 (PST)
Subject: Re: [PATCH 13/23] mtd: nand: raw: brcmnand: brcmnand: Demote
 non-conformant kernel-doc headers
To: Lee Jones <lee.jones@linaro.org>, vigneshr@ti.com
References: <20201102115406.1074327-1-lee.jones@linaro.org>
 <20201102115406.1074327-14-lee.jones@linaro.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <e9e6773f-ceab-1732-cd21-ca4230c16bd2@gmail.com>
Date: Tue, 3 Nov 2020 19:38:32 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201102115406.1074327-14-lee.jones@linaro.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_223837_258586_047B235A 
X-CRM114-Status: GOOD (  10.92  )
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
Cc: Kamal Dasu <kdasu.kdev@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 11/2/2020 3:53 AM, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1854: warning: Function parameter or member 'host' not described in 'brcmnand_edu_trans'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1854: warning: Function parameter or member 'addr' not described in 'brcmnand_edu_trans'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1854: warning: Function parameter or member 'buf' not described in 'brcmnand_edu_trans'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1854: warning: Function parameter or member 'len' not described in 'brcmnand_edu_trans'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1854: warning: Function parameter or member 'cmd' not described in 'brcmnand_edu_trans'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'host' not described in 'brcmnand_fill_dma_desc'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'desc' not described in 'brcmnand_fill_dma_desc'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'addr' not described in 'brcmnand_fill_dma_desc'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'buf' not described in 'brcmnand_fill_dma_desc'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'len' not described in 'brcmnand_fill_dma_desc'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'dma_cmd' not described in 'brcmnand_fill_dma_desc'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'begin' not described in 'brcmnand_fill_dma_desc'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'end' not described in 'brcmnand_fill_dma_desc'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1951: warning: Function parameter or member 'next_desc' not described in 'brcmnand_fill_dma_desc'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1977: warning: Function parameter or member 'host' not described in 'brcmnand_dma_run'
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c:1977: warning: Function parameter or member 'desc' not described in 'brcmnand_dma_run'
> 
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: bcm-kernel-feedback-list@broadcom.com
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
