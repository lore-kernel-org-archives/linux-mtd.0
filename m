Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFC4C00140
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jul 2022 02:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JZB+ZOVLWgrR39/ncRuD8azr3XOScE4WFbjetGHVpn8=; b=wPINq7jWHqXHjd
	Ro+G5N5h67h+C9GyNHjR1kk3828rZZVpesOE/DJQLykFNyOYvGSNKW38noFvg5arxp0O4wqNEoRA4
	RmET58NcKerIqOWtT9+lzGddVMZ5o8pUVlvsu4xU3iHCOeBDOozc02cdNAZVpGYFyl9MzievBHTBn
	vzhEApAyblwQ9JNKFIcBoMSrj/jDxgVQII4AEJgnmyfBR5bq0rGXQavje7UtTaW6DLs+oV9685nFm
	iI2xPEYpebT1icmzI0m5AGnAusZJ4sR0JGax3iH8RNxSIw1OSZuYjwTGBUaqHzeaGlyG5Y+p+vzbj
	JglwpxcJ9jOOi689DKrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHFqk-0001Sj-OS; Fri, 29 Jul 2022 02:35:38 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHFqh-0001SI-1O
	for linux-mtd@lists.infradead.org; Fri, 29 Jul 2022 02:35:36 +0000
Received: by mail-pj1-x102a.google.com with SMTP id c19-20020a17090ae11300b001f2f94ed5c6so6189487pjz.1
        for <linux-mtd@lists.infradead.org>; Thu, 28 Jul 2022 19:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=lhUduefVZAfahsTI0YAcKtlOoeTrsJbNEDksAv2ld/Q=;
        b=UdJwVhpeTZAiFrNCJiTRjyV3AKzvGmZz24piOJYU8z3lnrWsnj84cQBfNYqbglAvQ1
         mEGDIUGSGoUYVov4S/TAmIrs7Mr2LSXiCDZDOA6hvdQACKsWi+tQRr1PlKxM5aOyWBdp
         Xm9mf1WRBygQLiChaf6+fWj3O/+dGE/A7pQwd2N0c++wBe3I+1crtb2DJRKaYEs4xIy3
         Zt5tZ60bbp2Vw+A2rMW+zEA7gzhJPRGYUXbU3X+goZlNeMfxT4D8vgXrcCJYm56IBopn
         WXSwDqQEzgmrkIQzc9mRY/loJhPx/3NQVlIDq7mvTbMSxoA4mMfqSnWUs5EgHH0BSka6
         srIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=lhUduefVZAfahsTI0YAcKtlOoeTrsJbNEDksAv2ld/Q=;
        b=8CW31LId/R7XbryOSLpo5irOFP+CNi8ezoapAmA8xB8z/z5SRyxw0xmQmgwFNtl83A
         fvxb555B4SmNK9pC/jD91RF7AO47jiCzWQ1V/RISFFdcCuDPdrGwlEMHmqUHIVioroih
         ZqzkCPTABZec8N/eQ5T3h1I5fSp5qnQQW4tJe/IZrjqj1YOaNwNHTSZS4ruSnTA/S7Vh
         vM9uxNIfL3fD2PBTcFdDfNODNJAq/p/Jwijqruwt0ALFhW1GPs2w3q9eQ/JgqUJ2QS/b
         v82AkKmbK7T8XWAgonim6X6zPWi2bHNlcn6DpqX/Z0JUALeQhlzE7ZIpttooNepnUs52
         tjUA==
X-Gm-Message-State: ACgBeo04FdZM+4w7ZzPB1+PKUZ17Qde+AHribDAm7f5M30DotWaP1osZ
	W2uApY1C6/iLFU5VLFl1NcI=
X-Google-Smtp-Source: AA6agR7VKx1exAldBuJeSj1xTPJfbhdn+czQKr8gHAqVNkLJIjGy/2JCJOxkHz3Zuy9IkTvOml/NzQ==
X-Received: by 2002:a17:90b:33cd:b0:1f0:3655:17a8 with SMTP id lk13-20020a17090b33cd00b001f0365517a8mr1682290pjb.33.1659062133384;
        Thu, 28 Jul 2022 19:35:33 -0700 (PDT)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709026e0200b0016bf803341asm2058480plk.146.2022.07.28.19.35.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 19:35:33 -0700 (PDT)
Message-ID: <aeb5771d-16ff-cd8c-ad25-a076b4dd11a8@gmail.com>
Date: Fri, 29 Jul 2022 11:35:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] mtd: spi-nor: spansion: Replace hardcoded values for
 addr_nbytes/addr_mode_nbytes
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
 Takahiro.Kuwano@infineon.com
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 Bacem.Daassi@infineon.com, linux-mtd@lists.infradead.org
References: <20220728041451.85559-1-tudor.ambarus@microchip.com>
 <20220728041451.85559-2-tudor.ambarus@microchip.com>
 <3e6bc7e6-678c-176d-d289-0e9e394fbb2d@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <3e6bc7e6-678c-176d-d289-0e9e394fbb2d@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_193535_104349_30EF42B1 
X-CRM114-Status: GOOD (  10.73  )
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

On 7/28/2022 1:27 PM, Tudor.Ambarus@microchip.com wrote:
> Hi, Takahiro,
> 
> On 7/28/22 07:14, Tudor Ambarus wrote:
>> We track in the core the internal address mode of the flash. Stop using
>> hardcoded values for the number of bytes of address and use
>> nor->addr_nbytes and nor->params->addr_mode_nbytes instead.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/spansion.c | 16 +++++++++++-----
>>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> Would you please test this patch. You'll need an s25hx
> and an s28hs512t flash. Thanks!

Both s25 and s28 works fine!

Tested-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
