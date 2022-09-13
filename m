Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD79BC54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Sep 2022 05:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XW5E8xQOA6H5Z9HVeRq16GWkyJ88Fa32cFn6DHivJQ0=; b=pmYljdJmUO5IHu
	165iMeUMHdqFwBi/HsFm2VkKUFEGpvfYzOilAaKUk9RWQ0/uMGlGSolv2JmH3cUp2LrT9LTDTzgNt
	ptzXknZ1xhpQRcdgTLFKZF+5/DU0PnFMWZcyVnX6uHIeKwqFB3SjTCoxoyJBRc8CTRFtOvY+VKv68
	SwzuFVl0O8yMHeQbuz5RHMN+8vNw9se+YA+piay+PYcpPcmcY6oBGLyni0vJ8wSpC9YPnJGK83ETb
	Y2/6FMHhPB/1m1TqwJb7p3BbDDdGO8IvAjk5a3/bkFzq9Ek+vuxIbLJOBo7ZCUpVwlSKMlKz0awL/
	7pm8b9vydCIHEpe/PfDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXyQ4-002M6O-3Z; Tue, 13 Sep 2022 05:25:12 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXyQ1-002Lwn-77
	for linux-mtd@lists.infradead.org; Tue, 13 Sep 2022 05:25:10 +0000
Received: by mail-ej1-x62e.google.com with SMTP id w16so9491498eji.9
        for <linux-mtd@lists.infradead.org>; Mon, 12 Sep 2022 22:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=CYG+gCQrNaZX712OWhKDDc9oytVFjJznZ+Wqaxz+G2w=;
        b=eVBAQtKp8A6UusDfiUzUBOJBjzt0eDI9jd+RDy1VOKE3bpFzyvN9sCDjp4892H8yE8
         rDyIGGPMEaavoDFn7s4RYBonGnUkfmHLOZM1DXMphXTjMjaeLoyfGeiKsp/En+dwtwJx
         Qi0ZeA2SWLgXxPGQ6YhVcmsxleI7umGfoTW9dHWiL6qzWzkROh+WSYwTHv1C02SfywKl
         KUMPgYTi8HRbB4Dzk5Y6noG8dMbJUQPteSlMGtAS2uxeR7bbRwf8I8/Ywc9FFH10OTC/
         d700nf8ZgqSN0NJ2K1g9mVJlIeKGzShU873PFhhOGimJeb2Hz2n1qLr4/3c8PuXPa9q8
         pPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=CYG+gCQrNaZX712OWhKDDc9oytVFjJznZ+Wqaxz+G2w=;
        b=3lzoHvjKuOE2wnkf+f7mBbY1bvARs+NgNHG2W6Fxd2Z5I70I/E56xkWMWrG07iyLH3
         cUA6M5PcYhunFiDm8ZrR+Gfhwj3aLdis/O5XGmQ3x73OoZa4bYMvd1+SSWal1Djoy9oE
         zi0gDhWOOqiXMhZC7txk218FrQLsReySrzwLO5jses8IvIWJDJWqmrVokQhR4Ugs95en
         buh5y/dw84GeMemtQxhAtjpNkOGNBD3YmFdYp9k7kgWoBU9OSLHSz12e/yhnMaVbnuue
         kmWH8ojWIp2LTSBIo2Jn5Mq/5/2ALC44cqbcVSAgm4Q4D3mtYZtbCUEKVPc0qTRjo7ww
         BLFQ==
X-Gm-Message-State: ACgBeo06f7Z/T84Pe1uX7Y0ABwfbrqNd3zOvDhXsVSFpfyCOdQwQPVq1
	Omb+rxHTczFzXJ7Rhw8jctY=
X-Google-Smtp-Source: AA6agR5zAa3oSAhpnAjqb9RISRRQDjjY4Oz0nWxMzo/2HvJrrULrbQuhYQ7u9bdsmtdwbkGgbc1C+g==
X-Received: by 2002:a17:907:2cd2:b0:770:8363:1f38 with SMTP id hg18-20020a1709072cd200b0077083631f38mr20181284ejc.381.1663046703828;
        Mon, 12 Sep 2022 22:25:03 -0700 (PDT)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id tl1-20020a170907c30100b0077fde38993asm624953ejc.152.2022.09.12.22.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 22:25:03 -0700 (PDT)
Message-ID: <df6751b4-32cb-4bad-07e1-c0ad8a852f25@gmail.com>
Date: Tue, 13 Sep 2022 07:25:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH 0/1] mtd: mtdpart: Fix cosmetic print
To: Adrian Zaharia <Adrian.Zaharia@windriver.com>,
 linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 jani.nurminen@windriver.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20220825060407.335475-1-Adrian.Zaharia@windriver.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20220825060407.335475-1-Adrian.Zaharia@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_222509_288875_50CD5B21 
X-CRM114-Status: GOOD (  13.32  )
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

Hi,

On 25.08.2022 08:04, Adrian Zaharia wrote:
> The print of the MTD partitions during boot are off-by-one for the size.
> This patch fixes this issue and shows the real last offset.
> 
> Jani Nurminen (1):
>    mtd: mtdpart: Fix cosmetic print
> 
>   drivers/mtd/mtdpart.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> 
> base-commit: 072e51356cd5a4a1c12c1020bc054c99b98333df

this cover latter (0/1) is rather useless. Doesn't say anything more
than actual (and the only) patch 1/1.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
