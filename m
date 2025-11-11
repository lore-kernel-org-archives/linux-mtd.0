Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDD3CCFA18
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Nov 2025 08:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cutYl1XchqsfH/UCD6WwOPf0qslZ09AJ+SE+X16UyBM=; b=UROMimSv1ikE3D
	3DW4vx6AweKjkAV2Dl0/6N++piAL79s1gMFA0A4jWTv0iCag2LaI6n1apMzrgK4mDLr+vrni19rgO
	SpNkKsQi5du3PKzHUWJXc4aRgOQo6NK29MP06lmFl7A7YCqIQs9EQAYhA1ss5D0PgwqQM3TEr+SWZ
	i/IpzWQYWqrj9BoKA3QWWwpIWZFFMoB3amE2QX28sEFkE85IJpUSs4BpnC/yW0eIKGv4Mris3rpSQ
	qDeh2fXCYf+QCOPsw9c2ZGEFMm6Grwd0xaavLSEckO7no5ykCqUGb+ILN01Jz6URexV23VtFKf+8z
	AT0QfUhHwJqL6NvcfqNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjkY-00000006mjc-3ZmY;
	Tue, 11 Nov 2025 08:29:14 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIjkW-00000006mjC-1i4G
	for linux-mtd@lists.infradead.org;
	Tue, 11 Nov 2025 08:29:13 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47755a7652eso25636115e9.0
        for <linux-mtd@lists.infradead.org>; Tue, 11 Nov 2025 00:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762849750; x=1763454550; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VN4ssHT4SWqYZ2DLb2tv38+O6ZY23WjOxSeg+Op1aEM=;
        b=Qq3v1y2HEw5DKb4UEbBXyAgPntwmBBbAV2QYxO1Y0co2GF/mb4FWvOxUBefqgmnoD6
         0AR7HDskjqQvE3T/u2+Y85TeJs/tlwev5OqtWpdIbP5nbMp4n0B3Fnhi7j12JP/6ZFgj
         vQ6vtj4piD9JKm4pL3aGgcmiDs8TdB5o3mGcV0k+ssT2GZ/TaaXi0m8LETBsRr6YtFOI
         q8VJWZOpVoFzNM4+/3qH1m6rd13STbCRYKC2IeeJMtfOABKXo17AZY7jli6I6Kgsc+0O
         yh82WujX0EfXBH6VCHGPTq2QWGbob33XjxoZBjsMGy2oDDqgUwc5zFq7pysql/icoeHN
         c5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762849750; x=1763454550;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VN4ssHT4SWqYZ2DLb2tv38+O6ZY23WjOxSeg+Op1aEM=;
        b=mhrTjwLxQdAPYWu+yzaQAKh2LCRbj3MpZGyc35Xji6pLjboP1H42TqWEgpiH1ZkgZm
         51mm9b58MwJzbb/17EL7sXrMDThKUH9A5MVz6EWY5YqkY0abUlteQ/VCro7SmQHil67y
         9IEeJuMAORS6D7Zfl9Rvj6QkmLpOUoRPBBY8y50aXSDaFmmQU9t/UlC0iP/wq0jGsHU1
         T+qeDNFotPt3r4k1Yv3fbEgliMeMxdp/bnZSJwNF/PU2XPJYVvm5S68R5zUSp1VGjxdx
         Kv1qoZ4vEknpz8+modSl4A8CVRfSc3B4YLMqYk9fqbMFGfDv8B/aNDe2sAg8HuhQ1+2j
         Mx6w==
X-Gm-Message-State: AOJu0Yz8aEf/yGBcvXTnMr4Sw5uAYLRM1z4HARfQe5RbmaVcYPq0EQ4E
	3JGo2pK+82drO0wjPQJvJhBQyvT0jgR32t9IFO17ViuNJZM2UiVwvfuOxcIh3pbFEj0=
X-Gm-Gg: ASbGncu0kYfIN9HB4yrSef4Sli9is4LiN7mKwgB+tNbqnR2GZiHXWGMBmbfSQINb3wc
	44cH2u+ZaMQ6o7HzrSeJonJTuEASeXN5BUrnR55l/sb0djOyQXFfxEitjRIEHyeBKQgLNOgCFnk
	f6CnrZi31HqE2RlULKjIHiol2Rxa1BCgtQMc6PWiqjNYe87tV9eXM3pO+w9gNlhNB1dQ3HNQsUw
	dfEDEQKl8BSX2lCAXxOa4n7dTcAqUC5nqjTdk7x6zillGnKoV7mlFT48gAHiPI+4S5Td4O6DKCE
	kvIB8+08ci1ObQ+Sq1JhpPQ8ZHDy+1Qf3n3ERp1Cv+iZ1hDV3ZKeMQcuvmPnz/38082vglvTE9g
	SE6QsMC3GdK1EM7uO2W9GFfLOkA89bja2ZcjyakqS3BU0hxRLr7dWz5ErTOByAG62OuondbxyuY
	+k9YjYRcnjOEMN4mdF
X-Google-Smtp-Source: AGHT+IEjfzQTdf31JT46i170Kox8+e9rzC9EAL1JgWdVxYnSZfKWgA72lGNi/67uAlpLK3cpt/PArA==
X-Received: by 2002:a05:600c:4f0b:b0:477:76c2:49c9 with SMTP id 5b1f17b1804b1-4778049cfe2mr34227345e9.2.1762849750375;
        Tue, 11 Nov 2025 00:29:10 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2f7a0512sm19591853f8f.18.2025.11.11.00.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 00:29:09 -0800 (PST)
Message-ID: <8263aa0b-f223-4e67-9923-9f7882b90646@linaro.org>
Date: Tue, 11 Nov 2025 10:29:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mtd: spi-nor: micron-st: enable 8D-8D-8D mode and die
 erase for mt35xu02gcba
To: Bough Chen <haibo.chen@nxp.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
References: <20251110-nor-v1-0-cde50c81db05@nxp.com>
 <20251110-nor-v1-4-cde50c81db05@nxp.com>
 <7d8b0062-a6ec-43a9-ab00-3e11f0e2fb26@linaro.org>
 <DU0PR04MB9496D24A8424C578C942CDE590CFA@DU0PR04MB9496.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DU0PR04MB9496D24A8424C578C942CDE590CFA@DU0PR04MB9496.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_002912_461194_F3846B12 
X-CRM114-Status: GOOD (  12.47  )
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



On 11/11/25 10:00 AM, Bough Chen wrote:
>> please dump the SFDP data for every flash that you touch, it helps us with the
>> sfdp database
> Hi Tudor,
> 
> I do not have this mt35xu02gcba on hand, I only has mt35xu512aba and mt35xu01gbba.
> I touch this chip because I notice these three chips share one datasheet, and seems only
> has different number of dies.
> 
> So should I drop this patch?

Ideally we don't change functionality for flashes if we can't test them.
If you feel this flash entry does not work okay, which seems it's the
case based on your previous patches, then just add a comment above this
flash entry and tell what should be changed. Then if someone cares and
have the flash, can do the changes and fix it as you suggest. Does this
sound like a reasonable compromise?

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
