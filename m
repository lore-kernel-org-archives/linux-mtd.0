Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB285C2BD09
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 05:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wzlFYFeLHqy/WVe9Ba30r2YDsP8a6SWycCE6GvU/B9E=; b=cJrcb1TVD3HQpF
	WO091b/rWD76NKTPPaZCLSx9WAKffUPM4m6sONlFLJz5K/hkLjqaTmqAOQ2PU/94VwL1hSp0NG1C7
	ZaxRargCy+pTNfQn8Xt0l1K0lGbQRMvjLc9RIvjSn3i+OD5Ij2VpbMr1U8MAjedQCprIg2gvn7EIK
	Kjm1ozyDHQj7XMsB9b6N0M3YgweBV894N2nVAtSceJDbq+qV4PmPVyOOTUsi1LGGm6q3Puy+hlstz
	5Swv3sdwUN+Vd95kvGtWkK5g4U9fv8QD2xQm5lbKDsP3WHBp/KD8e23Hb2XWgf4Nvl6WspuF5IUHE
	T+TLcoT0t4tEUtrjGOjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sO9W8-00000001joJ-0cr5;
	Mon, 01 Jul 2024 05:23:56 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sO9W5-00000001jn8-1dTu
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jul 2024 05:23:54 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-42565670e20so20736885e9.0
        for <linux-mtd@lists.infradead.org>; Sun, 30 Jun 2024 22:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719811431; x=1720416231; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ZPrvTX1LlCOARG8zADhUY6Yra+UeWC6LQybo1XCNjI=;
        b=UFz6N8flYNb9pfkD3h2GLzuRMJQPyjHxoMUt8o3vpT3JozhfH5OvGXELsWv1vg26qI
         D9KtqKMV9hedQ9+/6CcQN+Z9VPYYR8l2UTjsD/BRnD86d/haYFZCRQI8nclBN/IwN49N
         3Z+4pmpefMWaNuhuOgwN3TwjHwqRMEuRkEUQN9Gl9zDkQSSSXMBJ3Pspmn8f9rCoSby3
         L1aVG5/sy4tbONtUi1wqYUWuSr1JwEn9rEYPk5i/V0XkbVpkt1FDGCfC+MRx+rIs9EfW
         4ndkv3FV/pvoVbbuB7+NIOCbzUaPDjAGJrdlzXS7wMOcwbTuLK83loV97YWbHfkAcqBq
         +i0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719811431; x=1720416231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZPrvTX1LlCOARG8zADhUY6Yra+UeWC6LQybo1XCNjI=;
        b=vu4wnYD+q/vUgn1ZjwHuMD4/mKxBK4WtWj2zBNjdAUob7hjheddfX2TNpc0g/Pu/l2
         ep5t1p8c0e3nMa8u+Vve0iwIy5ixZvCkWM9SmHwHJVjTIK8oxttb17jcEa+H7KqoTkxV
         KVpaz5Y8+wUiE7/J/46FrDmylPGx3wkDKjV+V0a9FLiQfgLeOXGCoHO4CrmjLbgAv0xm
         ZasnhI4tiCzqyALQ4lUGCWObM1RfIc/kTIWpISgrJlWgSxVFYP91qG7QorcBLI0KNFzB
         Q/U9HMYkKW+K5x7SB30YMQE+fD0GrU4on0EYbiZhjX/QSuPlmedZqkbcHQ0GOz/lel8J
         la4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/3BkKUTPmJFu9ZRhKIfAZUNr6yugCrX9yn/xXh+8IAWya/P+n38G8OyydvoApl1Bd+bE+RVUVLOnL/u9n8fO1ze0RRfcIIWOVtit/xA==
X-Gm-Message-State: AOJu0YyklaT0qKMtC3kl86wuKvB091SZFNU7qKEJg3xjr7ifKaED28Qg
	ousDY2akXwJfqeWqVdC2G6EOKrYh7/WQLug2GUzlfrO3c+KtwP9eZMRx/8Mvah0=
X-Google-Smtp-Source: AGHT+IF9MRIx1wSh67nqdVTfzQyiTLHhWk7kRj6SC+p6KSXYmfU40pPYzAfvgbGb4Ez6x7V9WMYD3Q==
X-Received: by 2002:a05:600c:48a2:b0:421:7ab8:59c with SMTP id 5b1f17b1804b1-42579862523mr43337155e9.10.1719811431050;
        Sun, 30 Jun 2024 22:23:51 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b0c18cfsm138130885e9.45.2024.06.30.22.23.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jun 2024 22:23:50 -0700 (PDT)
Message-ID: <1c457520-07b7-4bde-b040-e8bca959a4f5@linaro.org>
Date: Mon, 1 Jul 2024 06:23:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] dt-bindings: mtd: macronix,mx25l12833f: add
 SPI-NOR chip
To: Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>
Cc: linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Erez Geva <ErezGeva2@gmail.com>
References: <20240629103914.161530-1-erezgeva@nwtime.org>
 <20240629103914.161530-4-erezgeva@nwtime.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240629103914.161530-4-erezgeva@nwtime.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240630_222353_478401_F63049FE 
X-CRM114-Status: UNSURE (   8.31  )
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

Hi,

On 6/29/24 11:39 AM, Erez Geva wrote:
> From: Erez Geva <ErezGeva2@gmail.com>
> 
> Add Macronix SPI-NOR mx25l12833f.
> 
> mx25l12833f uses the same JEDEC ID as mx25l12805d.
> 
> Although mx25l12833f is a new chip that support read ID and SFDP,
>  users might want to specify it in the device tree,
>  to differ it from the old mx25l12805d chip.

As Michael said in a reply in v1, we try really hard to don't introduce
new compatibles and instead rely on the generic "jedec,spi-nor". In your
case you can differentiate between the two flavors of flashes based on
the SFDP presence. We won't apply this.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
