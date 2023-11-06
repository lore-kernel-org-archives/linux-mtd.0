Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C66C4167B
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Nov 2023 14:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J3fiM4oOcDMJO6Q/qvGDOEEZemeH/ZvwT4KRtmEtcO0=; b=1cx2fszJVGjXIJ
	K4WEvh9moBbd4rXm2ODOAuS0NaoQ8CHrZ5OZv06oc13l+z862YNFldpGd40631OBqzUQKxCHFrTrs
	epcQf4ppwevO0HyXM6CgWD7kDehhDirR0vhNnm6l3xlXpSVC06BiN1d+IBoDc1x1XpL0lNwKTUd9M
	q60esdaUmALaEr2BafTXpwvcOAVYVhiAFEZ9/cQyVOpqymu9zliRjaCygEeWWyL7horgiCX4GYcJ2
	Uo4/0OV/WbEgdC+HlTHtuSuiiOID091zBUSampWtc/wnpvkHN0QorfD+Z7tgHBcNv6I2GbISYVRAx
	X6baO4XftgV3zV2+9JaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r012E-00GvEb-1o;
	Mon, 06 Nov 2023 14:57:02 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r012C-00GvD4-0u
	for linux-mtd@lists.infradead.org;
	Mon, 06 Nov 2023 14:57:01 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c5028e5b88so63819771fa.3
        for <linux-mtd@lists.infradead.org>; Mon, 06 Nov 2023 06:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699282613; x=1699887413; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N5ElBJmoDa2KyWiRWqcqXPBjLvImYVOsdvelSuO+b2k=;
        b=jJVWpG2Imy2cpmU9byRmYXru2OvjNEPa39UoH6PSfJ/y2XY4J8pf8EFHxbds3Fouuh
         d9skNBqjHfC9pMHx9EfzVHkWoXxtoEkQ2FisTuPBNIUA4nqxNHc4BdoKsalf9GX5TvgD
         NMgugG1WMKn1aP/vwtPtSczJNM+qi15WN0nUPdwSNuoaBFHLCvSDDGXT1t4SpVd4ZQj3
         VKlIxpvWFjlS4AKLwcCnw2u39rkE4Bg4TADHsEd3nAR2Gaxh4DuGAXHs9kggN2ScGypi
         zt3wd5j4ZkIMAGOWOFJgyzKTOyLH/M6FwxZ+hJC9R99eiJCCt6TMnm8Ub8Ij5jikPWq8
         94Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699282613; x=1699887413;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N5ElBJmoDa2KyWiRWqcqXPBjLvImYVOsdvelSuO+b2k=;
        b=Sf5G1UYAbrS6ytQI2L31r4+OYvVTz5rKpNCLzS/QuR+LJvd86O48CCubnvEdEu3pti
         b7dHdBYqRsdb13MfnXiualFT+ZsDiJVtOdLYmu3YdyAJWW+G/ekR8hyq/xsfph6Jue1G
         P41qIOwPS5EYqSAq2PhWgdAMODL79HYK9Ve1Yir+7vv4RI+QuTkqhiD/wpqLDajp4rtf
         bN4bcfCh9PP9x4nEU8t9RDx5a9i0uM+lC6hdM+EvpyTCm54AKvC5cJUJhoclEtpQkbRl
         M+pxlE3e6RVCuozGUI6lV+ktAj8T/r5KKQWUXImbDU+ee0SI0Jjlkhot5F9F/DauHftI
         6BjA==
X-Gm-Message-State: AOJu0YzPIl82XAgNVnI8kfVsdYC7T3Rwgzq0fg8a4/6eFRagsP8qy7Rk
	ghSv39joxUFmmXMXXRiX4XqzDA==
X-Google-Smtp-Source: AGHT+IFy5hrlyMqZcdrYuUSBz+9xuopgyx3dPjoNQKi3Z2qqXE1OY+MDdhor1c7CzTkPKKR3CvR3ww==
X-Received: by 2002:a2e:9952:0:b0:2c0:9bd:c6f with SMTP id r18-20020a2e9952000000b002c009bd0c6fmr24688804ljj.41.1699282613179;
        Mon, 06 Nov 2023 06:56:53 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.12])
        by smtp.gmail.com with ESMTPSA id u6-20020a05600c210600b003fe23b10fdfsm12176156wml.36.2023.11.06.06.56.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Nov 2023 06:56:52 -0800 (PST)
Message-ID: <cc342337-1f74-4720-885a-c75664f66a1a@linaro.org>
Date: Mon, 6 Nov 2023 14:56:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Michael Walle <michael@walle.cc>
Cc: Fabio Estevam <festevam@denx.de>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, pratyush@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 bacem.daassi@infineon.com, miquel.raynal@bootlin.com, richard@nod.at
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
 <a7bee4f0-8591-411a-a105-0284df22c464@linaro.org>
 <632457ed6b022856496537bdf8a738ba@denx.de>
 <aa123456-7ec9-4bdc-a521-66c9582d5d45@linaro.org>
 <c26f6623-2d58-43ed-95bb-957870890a02@linaro.org>
 <6f1aa670-b3f7-4ea3-bc80-773a57e46c36@linaro.org>
 <968ba4c249926e986b02440ad0421e98@denx.de>
 <f2141a88-13d4-47b8-8382-5df8cc1bc42b@linaro.org>
 <cf0e4284f2e3193ddd57b715196ca202@denx.de>
 <25ca1a4c-683c-4b6d-938b-07323b211815@linaro.org>
 <c3f2b8a6-8b23-4a33-948e-62ff64db9a2f@linaro.org>
 <5872f7233bc0dc4669aa1324f3ae3cf0@denx.de>
 <95c16eb0-a785-4a8d-bb42-c5a09b034d0a@linaro.org>
 <e665266fc1565f9d346c95215df39f12@denx.de>
 <085ba0f9780b1f8b34bc9e1037fec5e7@denx.de>
 <b5c1d4d7-1583-4469-a604-dcf5bb3f96a4@linaro.org>
 <9004acceea77d2f06aaff0ca5f916cd7@denx.de>
 <a3ccb98e-b8bd-4ea3-98c4-df429602a7ef@linaro.org>
 <ea846bc8c214836c40c06fd875aee575@walle.cc>
 <5c048899-f8ef-43bc-a488-daf4c157f34c@linaro.org>
In-Reply-To: <5c048899-f8ef-43bc-a488-daf4c157f34c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_065700_326316_C83E59BC 
X-CRM114-Status: UNSURE (   5.48  )
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



On 11/6/23 14:23, Tudor Ambarus wrote:
> it had some contents, but not different than 0xff
*not all different*

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
