Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9294C43334
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jul 2022 14:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LU87MzVXN2d0srHatMWIbUsgUZDd5G0/h/UYkXHtzIc=; b=mPiJFEpyY3hBd2
	IvwrNXCy1xEQba/VJ4XTGFFbsLeQn4cO7ot0EHSwE5P/S20cf0ESaZF7xYXJKcdXfZ76MlvngsLQP
	nLMedosTVPxzNWSrDR8NrH6gN4uUyb/8o/0Y1cKC4vwyPlVos2bkDUQ4gAIj4cVFBETbFRPU/PH0r
	Co2cVlbTFBDeOhTOMLeNXwzHAKe8VBSo0aPPbxjsxpS7S0XtrWsjXbkh6Ut0XXx7VsyxiWNqmw3Da
	xp9//Jfjq5h9daGTOOhEjcmizLROMZqajesQj2zIZAf9nrcaAxNoXQ/BBtwRmDXAwdnheM6FW100f
	+69H4uTU5Rw5P3flzZ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8j9S-000gvD-4P; Tue, 05 Jul 2022 14:03:42 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8j9P-000gtR-Hg
	for linux-mtd@lists.infradead.org; Tue, 05 Jul 2022 14:03:41 +0000
Received: by mail-lf1-x12b.google.com with SMTP id t24so20751978lfr.4
        for <linux-mtd@lists.infradead.org>; Tue, 05 Jul 2022 07:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FTByuoUDWjyR8an2g05CMGFWtHf96FEqLs3ngrwh6us=;
        b=GBKk4fxRrkRm2c6psUm6D/w0N6n06/W6BtHOUvFHVMUiEdDkUP1q3E7Hz3nQoPPBR8
         5UWPpfePuVzE2M3m9X6CPurk2EYEJIF/Xsx3X51ML0Oqn+H48opY24dyLGyRx8NWnSJh
         eyBKLJTcWVBNh7YybUZ/q2k44/aNZmn7GyfZSJOPonRfHLLnopZ/Qu0w+4AI+sRHrgMB
         vwdx1u/Il43czbMCaBdZ8xbPZRCEsoOMXvR6wuGUVRjbfO2Ntdo47Y5e7zgLNK5qglbQ
         N44z5Esp4HfJ5zYyPBLLp4LQbUQVB+96Rg325ZjuoHsK4uWgnbMN7DG7I50n/ZM9MhBy
         7ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FTByuoUDWjyR8an2g05CMGFWtHf96FEqLs3ngrwh6us=;
        b=WUvHMvr5sx5KVVK08XALAXlfxylGJ00KA9jgr82+EWDF0Prm3Xiedbn/A/0MFRVCjm
         hmk1M1Y5MG0X3BrG2lJQ3L/5rcInQ75Oyzaoip9gMeAk1MHf3B8hy0oVGObG5SwNWZcK
         X+1EJYII+P6qoa8pb9kmNNdiK6pipokQf3PdLAD2oPUGgduUbRMms/ozODPHfAljXtqt
         6Zs2m/XXbbZvwwEM/Apznp2YAAYBTb9Kblj81QB0AeuqvzhbuREc70MG57+/z74j01+R
         AOCCWyRopc8Nn7h6rJMUID64nySlZ5UsjJxOFUEgS80pxv6ZQUdwgK91zpdWZLM75AIo
         xPkg==
X-Gm-Message-State: AJIora/E4jMvrC6rqLzfRLsGj+NF+SsrYSf8RXCtdWwiwtqpZVcBSmdV
	zbW4t/dZ6pbaATFenNfwkxnfsA==
X-Google-Smtp-Source: AGRyM1uyOELuaksoAr9ygk7LHhzb3ah4SQdqixh/kdlutfggnui6spNPog9NnO2z+XbF/mcIT6CypA==
X-Received: by 2002:ac2:4e10:0:b0:47f:9af2:9c64 with SMTP id e16-20020ac24e10000000b0047f9af29c64mr21115541lfr.109.1657029817605;
        Tue, 05 Jul 2022 07:03:37 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id d13-20020a056512368d00b00480fdbc1b01sm5301077lfs.64.2022.07.05.07.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 07:03:37 -0700 (PDT)
Message-ID: <777026d0-578c-500f-7da4-0e81fc211df2@linaro.org>
Date: Tue, 5 Jul 2022 16:03:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 07/11] dt-bindings: spi: spi-nxp-fspi: add a new property
 nxp,fspi-dll-slvdly
Content-Language: en-US
To: Han Xu <han.xu@nxp.com>, Bough Chen <haibo.chen@nxp.com>,
 "ashish.kumar@nxp.com" <ashish.kumar@nxp.com>,
 "yogeshgaur.83@gmail.com" <yogeshgaur.83@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "singh.kuldeep87k@gmail.com" <singh.kuldeep87k@gmail.com>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "p.yadav@ti.com" <p.yadav@ti.com>, "michael@walle.cc" <michael@walle.cc>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "zhengxunli@mxic.com.tw" <zhengxunli@mxic.com.tw>
References: <1657012303-6464-1-git-send-email-haibo.chen@nxp.com>
 <1657012303-6464-7-git-send-email-haibo.chen@nxp.com>
 <ef676df1-77e0-b8ee-3950-97eade8ddd5b@linaro.org>
 <VI1PR04MB40167A70FBE772DF91047A4190819@VI1PR04MB4016.eurprd04.prod.outlook.com>
 <59d360ef-5374-c7a7-2995-854ab3715b25@linaro.org>
 <DU2PR04MB87747C9A8F18D8300461D6B197819@DU2PR04MB8774.eurprd04.prod.outlook.com>
 <f33ad190-f5c7-d9fa-088b-5538ab1f4d59@linaro.org>
 <DU2PR04MB877492F346BAA10B2AA7428497819@DU2PR04MB8774.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DU2PR04MB877492F346BAA10B2AA7428497819@DU2PR04MB8774.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_070339_643036_F2BA0CD4 
X-CRM114-Status: GOOD (  12.68  )
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

On 05/07/2022 16:00, Han Xu wrote:
>> So we probably misunderstood each other... looking at the driver it also explains
>> the confusing. You encoded here register value which is pretty often wrong
>> approach.
>>
>> This should be instead meaningful value for the user of the bindings, so usually
>> using one of property units:
>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com
>> %2Fdevicetree-org%2Fdt-
>> schema%2Fblob%2Fmain%2Fdtschema%2Fschemas%2Fproperty-
>> units.yaml&amp;data=05%7C01%7Chan.xu%40nxp.com%7C0ffe3d706e064f14382
>> 108da5e8a5add%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6379262
>> 45564450475%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV
>> 2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=Q4
>> SfVnBN%2BQ0vYKJzRf%2FXZkCA1WGyPV9doFcb%2BLSKx4w%3D&amp;reserved=0
>>
>> I think you could use here clock cycles or clock phase, but then it has to be obvious
>> it is that unit.
> 
> Hi Krzysztof, 
> 
> Let me clarify it, in the document a term "delay cell" was used to descript this register bit. 

Which document? The bindings (I cannot find it there)? Commit msg?

> Each delay cell equals "1/32 clock phase", so the unit of delay cell is clock phase. The value user need set in DT just number to define how many delay cells needed.

Your bindings did not say this at all.

Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
