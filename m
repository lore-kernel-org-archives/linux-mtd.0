Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A3FC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Jul 2022 00:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SdoYBZNDbrNZ5RRnpAupecHW4jihmuXJZFHkETzDSpw=; b=fhpjaIufNs1UbP
	iZs9BIAZpYZP3F1kusa9nRml5J6P9VthTAewGxYX5FHSdpgSbwHmfB65pRLr0KMKLDR05RO0jUY1x
	cjTevCdwfRn3Hj6OCOQ6ChPUmMu55BC4lgmCTYHhf5We/9IBoX4QMVWdY65s4ejtn1q4+ZgZTn5zW
	ErOuBig5wzjxd3qE9r/wHPpe8K2UtiquVI5UtfT+YlAtXhHrloazYOxTSC5sNw2Fsdrernhjm3r/B
	h3NsJGEJPX0qaUabXI2xLhcXBH7mFDA7GEJuJa4lSOrbsUymqY5oQSvTdGxh9k1SJGoyVLJU51QxD
	Tweg07RVVsS8+xRCHV/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBPvy-00Fxre-VL; Wed, 13 Jul 2022 00:08:55 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBPvw-00Fxpw-JQ
	for linux-mtd@lists.infradead.org; Wed, 13 Jul 2022 00:08:53 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 72so9068543pge.0
        for <linux-mtd@lists.infradead.org>; Tue, 12 Jul 2022 17:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gYdnEJ95Fa1ivaX14HTm5wp2ON9uqwoBETxSEIEMgV8=;
        b=XkjIQxVoKhvX34mR5GnSn82W9UyrBHZ7nSc2rVQjHrSJwPfEEKX8IFq8mU1950hdMR
         n8SxelM2nUgLrvufQHRr+u+t/xnsiYqKgqngOV9lsRxzpt6E0BB0uwInDCQiX9eQcpa1
         tyHiHOaIfPuKqvEJxuKDjyWJEfF6L1FDkhQ3m6oacIHz7OVc6EYVRCxIcT/XS21bCUtO
         CtB7f17gblbSuNeJFV7jVOncDBqI20dsrKQutrLYh/IMKhzUcAmUfVYhHPAt95AawPhu
         hqwZr9gyK9edAHGay1QJDqi3izECaGEB96aq5ehbBIQnvOUh2GzWnQT1MtyrWlkCc39y
         /2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gYdnEJ95Fa1ivaX14HTm5wp2ON9uqwoBETxSEIEMgV8=;
        b=c10JkE2SbXI8+q3NVCkEgk+zMc7EebpBAhXyvGU4unZVO0r7k/uPjh+ix0ujsTM1aq
         duscFQs9leKohG9JtHp42CAeHmffuY+HzZ58XGSaFf+RW2rhTXEPasC89DwtlM0NF0Wx
         dEzZI5pOT4YknJ5A+dNc9aHjB3LEsc1myhuxZaDuGOOBpxkNRebqTjcTNd/pBjcDYzvB
         ellDkIUF9YKovagpKL86BMsYPB3FTwB3G3L3ly5nJUWl125D2wSUYQBbJSxrmuGDPAqp
         dn6JDMaQfKS1VLIaryTq1qIW18biTWqYo5QuknkD1sQqC2jtkQ7Q/RKeQD/+5MANQge/
         7zEw==
X-Gm-Message-State: AJIora9IF8neCibORUmGArItFGXhgnAbWW1aLdSCk/SZEA/WN3zBuRto
	wh44lUThsWkBJvXuj0J2uf0=
X-Google-Smtp-Source: AGRyM1vMfk23Zcgx/wxD7E9sk5r762KH2vW9l+xSOatyUao9SAmWSAmawhjC9ectN6Q0cSnMHEcYoA==
X-Received: by 2002:a05:6a00:140d:b0:52a:d561:d991 with SMTP id l13-20020a056a00140d00b0052ad561d991mr697932pfu.46.1657670929181;
        Tue, 12 Jul 2022 17:08:49 -0700 (PDT)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id j12-20020a170902da8c00b0016bff65d5cbsm7407537plx.194.2022.07.12.17.08.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 17:08:48 -0700 (PDT)
Message-ID: <6b5a3129-8697-9604-0f75-120871ea1095@gmail.com>
Date: Wed, 13 Jul 2022 09:08:45 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v16 1/8] mtd: spi-nor: s/addr_width/addr_nbytes
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, p.yadav@ti.com
Cc: linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, michael@walle.cc, Bacem.Daassi@infineon.com,
 Takahiro.Kuwano@infineon.com
References: <cover.1654741888.git.Takahiro.Kuwano@infineon.com>
 <51c3b5f0a73bd6d812122f45c3b19b310332ead1.1654741888.git.Takahiro.Kuwano@infineon.com>
 <20220621055153.7dw3veo7z2hankna@ti.com>
 <0691a022-49d7-a07a-ef37-d63d2cbb377c@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <0691a022-49d7-a07a-ef37-d63d2cbb377c@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_170852_687516_155A4882 
X-CRM114-Status: UNSURE (   7.11  )
X-CRM114-Notice: Please train this message.
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

On 6/27/2022 9:37 PM, Tudor.Ambarus@microchip.com wrote:
> On 6/21/22 08:51, Pratyush Yadav wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Hi Takahiro,
>>
>> On 09/06/22 05:57PM, tkuw584924@gmail.com wrote:
>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>
>> Didn't Tudor write this patch? Please attribute authorship to him.
>>
> 
> Takahiro, no need to respin. I'll check the series these days.
> 
> Cheers,
> ta
Thank you, Tudor.
Any comments to the series?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
