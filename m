Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33E5C00140
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Aug 2022 05:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kpKiJkNyz4pdTN8d09pbgL4HnHk0SEieDe8K8ja3koA=; b=qALdbz+oqohCZE
	auLKte1WY14w/ZOJ1AF6Cs77+HGtzLquCVBJakrHbRKA9RaxRdn+WJn6Jlaxb5bTHk+xgpGM0ombI
	bfsxYTzeeairiuyYrG4ctdgVgqAYIdJfYfjVZvcACt7ASDocCTMGdiuymXGT2we5HxJeQ+ugt3Fc5
	BifnabIh4ZH4dOJErJmMszoTGUznYiT4B0OMm58yt0EClkJRi4XqPlRLm9WlzAIWss3FSPgDXvoK7
	tTSMCkw8MyRAIWiViae0ai1MZDVYajcBz8XPGlZmkDzTWlJLm7la+uGNCsOPSlgiTW2QDGPL15bdo
	oS+f2Yg+RPvm71egZFbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKvXb-00B1KP-TU; Mon, 08 Aug 2022 05:43:03 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKvXZ-00B1Gv-2R
	for linux-mtd@lists.infradead.org; Mon, 08 Aug 2022 05:43:02 +0000
Received: by mail-pj1-x1034.google.com with SMTP id o5-20020a17090a3d4500b001ef76490983so8092342pjf.2
        for <linux-mtd@lists.infradead.org>; Sun, 07 Aug 2022 22:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=bLd1ssSzEx9WfjA4IxIsW6lFVgHrHD4+2ay+Lk9ZkbE=;
        b=oMlKNCaChoQ2K9nZGcxsUV5WzpbnfLQrgGXFpDAxKO4Ugc+eRGC5xicwXi0BQzWbKV
         ywdXA04nxV51l+J/o/sFDXTtdYEuLBYn1uNUsQcMTtqR3ZMsGpzoNR3spt0uFQCJPSDW
         fG4Iy15/XUalz66c98zknBztzM3aqKIaz5jEDL3YXIaLk8h5QJS6jqNeUZRFaUxUev6O
         ZZ+RGSKfQwrHpcVG2uN8RU4ue6KN+7ZQi3fNa3buv2Q6DTWGpKas1PPxxmRTGUB2yi0D
         a2UfbqKuGL+bHgM5F1E+DB1Y0uY5wYx7SFc9HzWdWroGPy8i6v44PILquiLgM1mGml6+
         JwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=bLd1ssSzEx9WfjA4IxIsW6lFVgHrHD4+2ay+Lk9ZkbE=;
        b=xITQq+C7bPBGxT09P46GQ80rKbZp65ZRf7REckujqFEVXJU3HaZ7RSABbI0KwCRvTG
         SWH23Kz3I/xyCchxaeWcEYraqzr0+NmBH5qByuujwVdlyA4/C3ome6B+ZrXAUWQnZG4A
         sqmlW7pml+mAMRpiq04KlJuRk4G3TTYCbp6UVpgkMrmTYWIZPDrk1uqqjGIJF9TnOBgV
         ZCPVmc8AL7ViD93e+jw9MnMLYBA7ZuFCQKvinFv/lfMS9GN21jmOzixii+g2k5rYMNNx
         dcu6p+khO1jOC5eEtuLRqpiDav5LnBevJNsvyyzMnd8p0k/f6dOu+Z3pQGeKJ/SZbWxa
         VOiA==
X-Gm-Message-State: ACgBeo3qldG3bm16EAtA5El/suUDfQbH/SUA6fvsDNhcNapgKIBfgRJh
	nX5ujBo59Mc8ZYQvtmJwiPA=
X-Google-Smtp-Source: AA6agR4A9x6VQhzc+w3fBCz0hc9TzFKSjLjLFnNrJMMFszWNtobVQCloLNMiEyghgAFnjD3hnNGx9Q==
X-Received: by 2002:a17:90a:86c7:b0:1f4:fb4b:78b4 with SMTP id y7-20020a17090a86c700b001f4fb4b78b4mr27978826pjv.51.1659937378190;
        Sun, 07 Aug 2022 22:42:58 -0700 (PDT)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id p2-20020a170903248200b001635b86a790sm7674739plw.44.2022.08.07.22.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Aug 2022 22:42:56 -0700 (PDT)
Message-ID: <ecf3906e-a3c4-328e-09b8-1e801896ce81@gmail.com>
Date: Mon, 8 Aug 2022 14:42:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 8/8] mtd: spi-nor: spansion: Add support for Infineon
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro.Kuwano@infineon.com
References: <cover.1659764848.git.Takahiro.Kuwano@infineon.com>
 <e47ed0aa3e1a6fdca7689434ce7dea99ff4826e7.1659764848.git.Takahiro.Kuwano@infineon.com>
 <d470b67d-00bb-7065-ec18-ee00616c5b7e@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <d470b67d-00bb-7065-ec18-ee00616c5b7e@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220807_224301_164652_AA9839B2 
X-CRM114-Status: GOOD (  15.04  )
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

On 8/8/2022 1:47 PM, Tudor.Ambarus@microchip.com wrote:
> On 8/6/22 09:34, tkuw584924@gmail.com wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Hi!
> 
>>
>> s25hl02gt and s25hs02gt
>>
>> Add ID, flags, and fixup for s25hl02gt and s25hs02gt.
>> These parts are
>>   - Dual-die package parts
>>   - Not support chip erase
>>   - 4-byte addressing mode by default
> 
> CFR2N[7] CFR2V[7] says that: "For the DDP or QDP devices, if ADRBYT = 0
> only the first 128 Mb of die 1 can be accessed."
> So there are flashes of the same family that are by default in 3 byte address
> mode. You added support just for a subset of them and used a generic name,
> which is not accurate, right?
> 
We added model #15 (3-byte address mode by default) to address special
requirement from a customer who needs to use bootrom with 3-byte addressing.
Anyway, I overlooked model # difference. Thanks for pointing out this.

> Can we instead make an algorithm to determine the current address mode?
> 
I have just found that we can distinguish model # via BFPT DWORD16.
If Hardware reset, Software reset, or Power cycle can exit 4-byte address
mode, that means the device is 3-byte address mode by default.
The questions is can we implement in spi_nor_parse_bfpt() in sfdp.c or
post_bfpt_fixup() in manufacturer code?

Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
