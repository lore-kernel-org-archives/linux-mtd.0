Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2B4ECAAD8
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Sep 2022 21:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4eQHQ1097IDawySTtPqedKZwWvZDkXhH0Vz9xxnr1wk=; b=n7+Xjq+iU05K+/
	lERdaFmx1suzSEf2WkRP3m0ABbjiSdOk64J6/+kl7qDX8RYJ+ri9PGe/IUgisKiJdc204HJy9nFjn
	ivsnXQBiB5Tq4S3xKzquPjDwlJQQeT3GDAx0SO/gi1/RgEAvu3+p/IGR2w1hm/ZOjGB6typzyggc4
	KYjYKcEcNQlWNslfSMrUwBmjsFpuUCAzfkSjxF0LmbIb7wSIZH55p7/ScO8nmNKPHI8zuVVfkkI/m
	BAWSD6pxaD29YHEBPXfeoW387D6xKsJiqoKn5QerOXbujj8w9EpE/jzhJ2JqpPTZJD/Lpy+mVjiln
	BBrm70sJU92laAljQT7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obTeP-000IcN-Cm; Thu, 22 Sep 2022 21:22:29 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obTeL-000Iaw-Rl
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2022 21:22:27 +0000
Received: by mail-wr1-x436.google.com with SMTP id c11so17456947wrp.11
        for <linux-mtd@lists.infradead.org>; Thu, 22 Sep 2022 14:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=js/5oTRugoQUYKiAkaMc0Wr4v083F951SM+zFeysBRc=;
        b=kOmpyQR0sC0aLPXqU/SaAlZvRiczPLKEvueA69by3IY5Iq3flK830ktzUfIgf4JQTE
         e9DziPS/vdUnv9DtWtr6PROybAMNwm+GP639aoDgYLNMEUpqIke+2n5J6sPXEghstq4E
         VGxzZCDn9V8W8zABUZ+Zm5PAu6AO3oBhXfQ/zjAueeR3MpN5W/TuDexdjNBR7jB3ohKi
         ysvcQy7IHRFS3ZKWztHLJ3RumbkqsL072exPD2C3ZrjlZGXkUjMeIrUlK4IUdqt/2elO
         /+ubFvnkyLhWNCQiy5aRuylFG4FiAwxs4HVzyT20DbJUwurfG1dougBZjdgaS4dwY6JB
         AnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=js/5oTRugoQUYKiAkaMc0Wr4v083F951SM+zFeysBRc=;
        b=BcF0l28cgc8JycIXF28/AQ6iNSN5kqOOddAKNz4JMM9N8d/l5+rFF75SdhPbTcCAYx
         GOCnJj2Tc3q2GHROobRGmxmEIwbwdYBcMNBE/L1yHPL0sul705YQxDNRu7qvwcRNpRXw
         lco7Aw2WypXReClXU79lmAi16Jl2XT3sQIhjFjoL6ggrAIwGwHUNjXo38LHN4QOnb2/n
         FUyyc/m4ROW2KGQKI7QrOMX+uNtAiGAtN45qSQQNNy6oouqyGqL0v4uS/ykqNnFTDlD/
         242zSjmiqPlE9YP3IXdc/KVt+F6aBOSqk4Fb6Z79xD94Wz7oHshNZceVfbaK5PLU+Flz
         +oDQ==
X-Gm-Message-State: ACrzQf1YBNvh/SPt9sdnhBHYjO6D1RnVDExGwfJF4X8dQ6athDXRhjPV
	1JaWOTFWUveeZ95onD0Ea0aIYg==
X-Google-Smtp-Source: AMsMyM7WdWinUK+JlpX9DEv0QsSlne/dIOCkLeNnQqueMPqOPMiLhB+SfIDWl6uCJmTendCxS37cdg==
X-Received: by 2002:adf:e4cc:0:b0:22a:d755:aaf7 with SMTP id v12-20020adfe4cc000000b0022ad755aaf7mr3231150wrm.692.1663881740992;
        Thu, 22 Sep 2022 14:22:20 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id r14-20020a0560001b8e00b0022afcc11f65sm5813935wru.47.2022.09.22.14.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 14:22:20 -0700 (PDT)
Message-ID: <1dca4a7f-f4d7-9fd7-69f0-5b0aec51bdef@linaro.org>
Date: Thu, 22 Sep 2022 22:22:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 00/20] nvmem: core: introduce NVMEM layouts
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Michael Walle <michael@walle.cc>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Frank Rowand <frowand.list@gmail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ahmad Fatoum
 <a.fatoum@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Robert Marko <robert.marko@sartura.hr>
References: <20220901221857.2600340-1-michael@walle.cc>
 <20220921115813.208ff789@xps-13>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220921115813.208ff789@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_142226_013724_89BF165D 
X-CRM114-Status: GOOD (  13.34  )
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



On 21/09/2022 10:58, Miquel Raynal wrote:
> 
> Srinivas, can you give us an update on what you think about this
> series (not a commitment, just how you feel it overall)?
> 
Overall this is going in right direction, there are few bindings related 
comments once those are sorted out it should be good to go.

 From NVMEM side am happy with this feature, which has been a long 
pending one.

We have few discussions on ONIE standard before, layouts would fit in 
nicely.


--srini

> Michael, is there a v3 in preparation? I'll try to write something on
> top of your v2 otherwise.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
