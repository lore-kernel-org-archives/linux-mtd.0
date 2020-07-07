Return-Path: <SRS0=3nwF=AS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E50EC433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 05:53:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A7A020702
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jul 2020 05:53:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YpnnHuJO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIGvPBug"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A7A020702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nZ2H8bt2sPdqsdhHpdGhsWg5Mj/eHaA7Aa9UbwYrizo=; b=YpnnHuJOBvN7YvMjffqQ/Y6Nc
	oFj2ay5metACMOTmRl++hJEMaYDilJXKuh7zUa7/GRk/bLcQz5q96ARE6ixr0N5ArEdaeoV+RClor
	no1KCm4cA12ohnawUb9+2Yc6uiNfPetWoZGS+0gZroSqjZuzF2QufD3X+Uyvn4pBqaFcpfuku5J1j
	/6nCz6dUS9mhIuJpKdkZPfviz60z4e7Z3OHdD72HCersJlPdqhaT44Hpv5GP92AYNQ+3oxr5Ey/l1
	TJOD2eCvngENnOkJun34bF+JBmb8osGYRxr13apOjspJ2I2Twd7cVWsNlFVH8+77PeHTkQdnX5492
	2pFPdqHeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsgTU-0006jt-Ba; Tue, 07 Jul 2020 05:49:00 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsgTO-0006jL-Bf
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2020 05:48:54 +0000
Received: by mail-pf1-x444.google.com with SMTP id s26so4324659pfm.4
 for <linux-mtd@lists.infradead.org>; Mon, 06 Jul 2020 22:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LIbFU0MCNrtFoKZqLvGHi0BplV8EZyleXYOcQej/aSA=;
 b=RIGvPBugTpNAE39cwI5hZVIYd4ZGUxqFEAqvvtOKnhvUG1Q+QLrpSC7IgtznNjwSQV
 b5IG0S0eLDHXy04T4thmannsnmE1Vb7xQXasN6sluYMyEGI5a+fwFwJJ1vKfAwOnxUOS
 u0girN2aEGnjNZ7cpHpxjE/xDKfyZxn4q04Eol9GLJgW7xc4/gGoLVMw7UhXTnk1Wbk2
 T36HhtlHrp6XchLBTLpneC2wDmVR9YTeP5ua+E9Haz8mUWCcA4Mri+xVFrwG1PS8lQMu
 29IonFsC+4aAfFUX85MAarpVgbzqTzPb9iVfJGGalQEMjko1mMB3OggMVrspRRtJwidW
 9AhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LIbFU0MCNrtFoKZqLvGHi0BplV8EZyleXYOcQej/aSA=;
 b=KeqoMwt3dOhX4Mrr39esVSu52/FORARFHBspN5OT92PaTw/I2s80E2aiX4r5k9xkDj
 Um5qyHUFP9UQf6iMBq/c33rVRvyf6WxM+m2s06aFfKk47Rqv+oTs82EUSPL0k02gSMYp
 QDyCJz0Sw1pcVHa/ZU2dCIz4dSQSu8+I8y684NWINzwn+kqVByqf+iO9x62hrERi82x2
 O7NnfV0N0b/4cV81mV5PRXwyFGxMc2Lq6298CO+oHnUIoOCUP1q7vumtyTGr31fj5TCC
 w9c1H8M9oJZWx3AofWo3Lxv31pQSVDmxnVlGPw35D4K/LSppIGiW/hZfgOgzL5UPKZDq
 O3nA==
X-Gm-Message-State: AOAM5332DKRUeA9YWdgXdk4BWRxVunq29gcA3WlMYMPX88fPWH0pP3LY
 kgVDT4piq0QEM5YaRspHs5Y=
X-Google-Smtp-Source: ABdhPJzOPMeWPAzdIyzfJjVE/0EqwWkFkaH/PlhO2BEqAVhn6jPE/hQePR1KnZcy+wfXfIryN4URZw==
X-Received: by 2002:a62:fc4c:: with SMTP id e73mr43174803pfh.308.1594100928658; 
 Mon, 06 Jul 2020 22:48:48 -0700 (PDT)
Received: from [192.168.210.75] (zz20174137476F6254EB.userreverse.dion.ne.jp.
 [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id i128sm21591496pfe.74.2020.07.06.22.48.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2020 22:48:48 -0700 (PDT)
Subject: Re: [PATCH] mtd: spi-nor: spansion: Remove s70fl01gs from flash_info
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
References: <20200626051650.495-1-Takahiro.Kuwano@cypress.com>
 <48516fcf-70fd-dffe-96b4-39a7772eaabc@microchip.com>
From: Takahiro Kuwano <kuwano.takahiro@gmail.com>
Message-ID: <63f7d4a7-18fc-e699-10dc-9be781d5b0cb@gmail.com>
Date: Tue, 7 Jul 2020 14:48:44 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <48516fcf-70fd-dffe-96b4-39a7772eaabc@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_014854_417588_3F3DF408 
X-CRM114-Status: GOOD (  13.85  )
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
Cc: richard@nod.at, Takahiro.Kuwano@cypress.com, Bacem.Daassi@cypress.com,
 vigneshr@ti.com, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 7/3/20 9:20 PM, Tudor.Ambarus@microchip.com wrote:
> On 6/26/20 8:16 AM, kuwano.takahiro@gmail.com wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> From: Takahiro Kuwano <Takahiro.Kuwano@cypress.com>
>>
>> The s70fl01gs is a dual die stack of two s25fl512s die with dedicated chip
>> select pins to each. Tested with the device and confirmed that is working
>> as two s25fl512s devices. The current device ID in the flash_info table
> 
> Right, the datasheet specifies too that the S70FS01GS device is a dual die
> stack of two FS512S die.
> 
>> matches with s70fs01gs which does not work with current MTD.
> 
> s70fs01gs is not correctly supported indeed, but the lower half of it
> (first s25fl512s die) should work. Can't you correctly read/erase/write
> on the lower half of the s70fs01gs flash with the current code?

No, because the S70FS01GS does not support RDSR(05h) which is critical
for erase/write. The S70FS01GS is a dual die stack with one chip select.
Accessing to the registers requires RDAR(65h)/WRAR(71h) designating die
and register address.  

Best Regards,
Takahiro


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
