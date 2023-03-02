Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C14C6FA8E
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Mar 2023 06:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tJCprhHnqtBWUDim6sZd2Rje7yJeicYKmnlRv5Lp3mQ=; b=AzmI36EMApCB73
	TLiXosV590RwMdwyb3eNrXtDY9t4Byew/Ge2hyq4fJrGLgg9Ah/I8CRUdqRqH3IEu56KDnJIMKA+J
	sfcg+5QFw+POxvPMaZJ4OyzNpKV6mj98yqs8iirSaP6P9KzwfDKe2tz9rIg2H2FWm6OPMexGOkGe5
	oWDDbbDXT++rjndBEHHZygzQcoRU7DeeueutBxY8+zT7B2cTFzRT709mdp0iEWlirF+tR++VlBQI4
	+rAf1S/6OKEO9dVg6qE34OObEbSXU2Nn5WetSkcElFEbMWSD3fm2M8HNY2E6QFEG6PxeKuCQrwkJu
	ogHM4S8af8eLWQGQODGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXcdc-0012uP-Dh; Thu, 02 Mar 2023 06:42:00 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXcdZ-0012sz-Fj
	for linux-mtd@lists.infradead.org; Thu, 02 Mar 2023 06:41:58 +0000
Received: by mail-ed1-x535.google.com with SMTP id eg37so63366955edb.12
        for <linux-mtd@lists.infradead.org>; Wed, 01 Mar 2023 22:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677739314;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qrvWbUkFg6M3i4StPsZDInyKYzYlqynbXskR5F0DAqY=;
        b=Lgt4hBrb16XcH9ikobusXxqSRAsXzzZrH9FwMBx6P5S6BK400OukDGhbks6y2aWiiD
         VugNQDxoh91qUh2p0uhECVXqtCsy+Z4gth4pQorTVAs3RX0wdi92pPZuQSZ/7d2FESgb
         cCXIXJDHhTz2RVG7vxsL7sdrw1OdlxK9UnCWrzrTIrHHAcolyLo1ji1a2QmZgubL8LzY
         0HAnXVVnv6l+1qFec0zckIFcJw0QNR7l3+Qh0HPFGLGON0xGlhFSjw2L2+LHs7MZFRWV
         2MYtRiAHN1yGDzJjyixeSi27VoKcZLrte4IJ9P7lSijpXKdDbF6hTVG9iCybbhO0+EkJ
         ah9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677739314;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qrvWbUkFg6M3i4StPsZDInyKYzYlqynbXskR5F0DAqY=;
        b=sB/WpCG2zxsyGme/hp2xvcqAR/JyX/foz+t3yyV+yzxAlFpASjgoX3y2/1vMSmTWzn
         zsGXBGLIzslfx37Zx016ideIPVMeBTecN9L6eAZ4VJbGiSMaoH+g2RGRvnQFQpCSsMez
         EVUDatUP3GpoleRzPy7B/mRAMFH55oLWwv6hMbUURjS0PvQJ4wTQ5SaiWFYcLFXy8/SP
         sFZvbsuVoLINdTZqv1riO+9ooAGYUngx2myg1hDRbM1EXMQ1HMc/oAWsRozSSt4rf8sS
         KurUh8rvrZIwsWv7/jJjNTDRU03mmek/C7LS/Q43Tq1ht8u9MUcIqaCSp7sZ5gpFUy1m
         /N8w==
X-Gm-Message-State: AO0yUKVI6bM6PZKfO4DAd+Ki0P0vNm6CRzaO/yD5N/wChmwF0ineV7nS
	pF1NnCxyF198V6/WYv4Es2d6Hg==
X-Google-Smtp-Source: AK7set/SzQvhkJXd/IYsYmt1lQVLtSIGYt5T2Lk5iQt3AkKaMuHjkclghISAMsLV2admkHKovSIPag==
X-Received: by 2002:a17:907:3e0d:b0:8af:2107:6ce5 with SMTP id hp13-20020a1709073e0d00b008af21076ce5mr11940559ejc.35.1677739314509;
        Wed, 01 Mar 2023 22:41:54 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.78])
        by smtp.gmail.com with ESMTPSA id c12-20020a50f60c000000b004bc607d433bsm1532026edn.62.2023.03.01.22.41.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 22:41:54 -0800 (PST)
Message-ID: <fc43d34e-86d5-2151-7d77-2e0fab7e303e@linaro.org>
Date: Thu, 2 Mar 2023 08:41:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 7/8] mtd: spi-nor: spansion: Set
 params->addr_mode_nbytes = 4 for multi-die parts
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1675835253.git.Takahiro.Kuwano@infineon.com>
 <9006f197a4f0f287efaef77a8ff0935d5d7833fb.1675835253.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <9006f197a4f0f287efaef77a8ff0935d5d7833fb.1675835253.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_224157_615906_4FEB59CC 
X-CRM114-Status: GOOD (  10.69  )
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



On 08.02.2023 07:53, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> The params->addr_mode_nbytes is set to 3 during BFPT parse in case of
> BFPT_DWORD1_ADDRESS_BYTES_3_OR_4. Infineon SEMPER multi-chip devices are
> in 3- or 4-byte address mode by factory default, depending on model number.

are the models differentiated by unique IDs?

> 3-byte address mode is for backward compatibility for some SoCs. Since we
> cannot access to registers in 2nd die by 3-byte addressing. We assume post
> BootRom programs change the address mode to 4 before hand-off.

no, we can't make this assumption. The only assumption that we may
accept is that the flash is at the factory default settings. But this is
fragile too, because one can configure the flash in a non volatile way
and change the factory default settings. You can't add support for
flashes that come with 3 byte address mode by default without
discovering the address mode at run-time.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
