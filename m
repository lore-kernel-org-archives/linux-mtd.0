Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3EAC3600C
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Apr 2025 06:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5iHm7alywjaNygbeeewKBgbiOjXZUaMreK4khOsQweQ=; b=p9Q4t2bVDR2L8C
	/qPizeE2RxSCOLy20n4+SoHa1UVIhQRy9MyoILEJ0buP9mA+3Mx9J/NIWpjY/K64Zsu3ajtmMLycZ
	9zzKv+n5u2t5MZ8S0HR7IKWvTYuVKoNRQZe7DaHSKRJMZniJs/bdMMGfe+VShSEPwLL3lmYjDWPwz
	Z8mZ9HUS7ktR8GrYhbMDdANM6i1uSQwrnMvZaHSJ1zK4WOcWR1KwdOPRnfIkofJwLKAXLVxtNLlus
	D4QMveM8qxlH5nCnwYhLizRfToSUnPxxEfzOEsAvfZvqoLArTfgyFXbkmTZuTC6//H67jr71tp1DU
	iDPTRtnoOZjHxTBF1NqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Dva-00000007u9f-29hR;
	Thu, 03 Apr 2025 06:19:50 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Dv6-00000007u5K-0YWh
	for linux-mtd@lists.infradead.org;
	Thu, 03 Apr 2025 06:19:21 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-39c1efc457bso294370f8f.2
        for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2025 23:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743661157; x=1744265957; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4hMx6SEeGvAeTt/gW/t4ifk30FnOIAfJuMp44OHabpI=;
        b=xCK7GObvb7kSNpwQVw9ZUM6P9xgYuxLafs69Cro8IfMUi1yXG6mu29FxPdJ4ycdgZN
         zn86+wz93/fz9koOBXHKbkxPjNIMQQRuwJTJdMp8xkhRGoaqokXIDWYEXnzCwf8j1HLK
         NMRehSlhqS526d2U+ddIcmyM67Nqubk2wgQZqkfBdo3hq0ZaUolL4nSR2Erg4fCYKMMD
         ZpQ0Wns9w56nVUTSGWmwDBogDMOW22DIz9gkCLXil0h+RIaKdQKsqz4BMTyxz6qXG0X/
         3dOHrzgmcvsHrsezYzeCZI0PyVSaW2O6ShaMzNCvUgS8T4/cRd3B6O+vBty3hzteembG
         rQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743661157; x=1744265957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4hMx6SEeGvAeTt/gW/t4ifk30FnOIAfJuMp44OHabpI=;
        b=qOnqvg4gSoaUyJ1mOfvhJASUiNx7SKcnx2uOQfOvKOvQ2dIhINzHuxw9m/RRAP6//J
         1Z4GqINkcSLJgcmdz+QjHNi4ON1MWDmPWxtBenszFpsMS8G3NKMbGgZIidOxf2lxoAva
         qHjuzxiexOoK9468jq5uj6w4+7sljFjybcqyxJAHz2mXeWMLCjmUTWggypzgm5XW8uNl
         /BF3ikO8fBT7J046LkXKc4dlxc23AtUcXSldnXQsJPo2bow0pKzY4zWrVWJpAHhuXJFS
         3sFZHKLDeYRE6jEnukAR4OkDeTrbacKxrsFmCBeVAd8BZS022UeQA0BD+sTNtuUNmGWB
         y3Rw==
X-Forwarded-Encrypted: i=1; AJvYcCW5ue76UqtL73IwQa44rX/BgGk0EbvJWmXXFigEW0WYetHyYMjOzeRzpzQ8PT2oGHgnhBMA/CKZ9nc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq8X/Y4WcdXw5kq4IAJa/sAOk/wjUu2CqEthgKODcZ2U6mmnLg
	U3pWGdywloJBerfoFY8qH9wa7hl9c7NGUxKnEyqfXVw0Si4dcODlZ/VBIQzWDms=
X-Gm-Gg: ASbGncszDBEjsawPUPjES7COcAIjBDWNs+QCJcpM2tJmY0IukY4mgkYqpQzswG2ohs4
	aJ7rKyAsxSMDXrzeJAjx2qndXs6EJey4gwocjfMq/Pwp0SZc2Z40iXzOfwag474IoOA+uAE2Uw/
	xExTXw5LEgrAcBZFJkdaB829UfqTR05a9/1wJwPYi6n4hHujH67Vm1sPL3JlPy2AB7tN8rImldc
	RAp0iykpGOkH3Q6HTWifvgDU5KuRm/yHxpdaqDVejYMMWbgMdwCfFF+Si8uZS44eh+zjX1i1lTk
	UbmfzjzcHKIjiwI6ynl7JtSwZNEm6hjfQU4xJuPvxXxJzceHlaViNA==
X-Google-Smtp-Source: AGHT+IEXLGJhxZC80I6dZhEzixmZFPKOcjX+LixzCOppdHEq1mZk+wbowjRnvFMqjnJz0bgWZJImyQ==
X-Received: by 2002:a05:6000:1888:b0:391:31f2:b998 with SMTP id ffacd0b85a97d-39c2f8c62e9mr810532f8f.6.1743661156922;
        Wed, 02 Apr 2025 23:19:16 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c302269a2sm840986f8f.91.2025.04.02.23.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 23:19:16 -0700 (PDT)
Message-ID: <5463acad-ee29-45de-9d22-16eb7947002c@linaro.org>
Date: Thu, 3 Apr 2025 07:19:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/21] mtd: spinand: winbond: Rename DTR variants
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Santhosh Kumar K <s-k6@ti.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-15-45c1e074ad74@bootlin.com>
 <3ebd53ef-c7fd-4c8c-96f3-32e97b355b6b@linaro.org>
 <871puaqz6m.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <871puaqz6m.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_231920_236916_717C9B14 
X-CRM114-Status: GOOD (  15.92  )
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



On 4/2/25 5:57 PM, Miquel Raynal wrote:
> Hello Tudor,
> 
> First, thanks a lot for the time spent reviewing, much appreciated.
> 
> On 02/04/2025 at 16:19:00 +01, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
> 
>> Hi, Miquel,
>>
>> On 3/7/25 3:08 PM, Miquel Raynal wrote:
>>> -static SPINAND_OP_VARIANTS(read_cache_dtr_variants,
>>> +static SPINAND_OP_VARIANTS(read_cache_dual_quad_dtr_variants,
>>
>> why not read_cache_single_dual_quad_dtr_variants? I see single dtr too
>> in the supported ops.
> 
> That's true, but single modes are literally always supported, so it is

literally, meaning from experience I guess, or is it mandatory that
dual, quad or octal dtr to imply single dtr as well? That's fine either
way, just curious.

Does quad dtr imply dual dtr? And octal dtr imply quad dtr and dual dtr?
If so, then maybe name it by the maximum IO dtr supported.

btw, not strictly related to this patch, but for the overall
architecture picture, why do the SPI NAND flashes need to define their
supported ops? SPI NORs for example are capable of discovering their
supported ops by parsing at runtime some SFDP tables that describe most
of the flash parameters and setting. I see SFDP standard (jesd216g)
mentions SPI NAND devices as well. Have you or anybody else played with
SPI NANDs SFDP?

> not very discriminant, and here my goal is to differentiate the variants
> supported by the dual/quad chips vs. the variants supported by the octal
> chips (which are not capable of dual/quad transfers). What do you think?

I find it fine to differentiate between the variants.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
