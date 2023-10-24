Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70AB1C07545
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Oct 2023 06:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eeMCMqiiIKLIcSXcxTRIiYKhxzPOxxcGgfnGw14mNV0=; b=hzQQZ8aUbiAu/o
	fUmgxa0CgbUv5pMtf4jt+856tQ39zeQelSP4l+6Rij2JJqoWkr2n7dPngxpcZDishEPWsV93AJiWY
	KMeqlSIjUYl00bH9vrZ9m4XMQji6k4PtJGnloWw6AD4v48NF1dwkcWT7Psz938TE6uXPhSiNFiKj7
	+1eWHlGxORrPDVN1sDsbl7K4OP1BTzHmqQ8APxUGz5ZA9Gy85phUDVg1Ee9pHYnhbQELIhiDsSHiW
	NQmhu2cl9Io1wgEJjsL0SFTYSqlv5ZPCViqeI/g3KvR+ifi59zJJpX74JLgjtbOLtoERn/TWg0J24
	s2OvvITROd1C69ul+jEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvAUD-008wGi-0b;
	Tue, 24 Oct 2023 06:01:53 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvAU9-008wFQ-1d
	for linux-mtd@lists.infradead.org;
	Tue, 24 Oct 2023 06:01:51 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9c2a0725825so600748966b.2
        for <linux-mtd@lists.infradead.org>; Mon, 23 Oct 2023 23:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698127306; x=1698732106; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xoaMNj/aKsBMokn9N8BEd5LlZSQdlahP3q0h2tDpraU=;
        b=yzxARIFH+Ktbiisov2jlDjnZSQrhUEdjvH17z+cncWDPGkn4BJ0XwX2TvcehwewgRw
         XYPIhIrJFm9r+AKPDZuwSJLixVNh9KecZbWe4Hbmbf8ggfMt6ZwbADIq+wp83sWX77Er
         eBnvfI4+R1TyjozVvq3B8rE+gl4/Sn9tl90dt1Xluk0lvyM5/05Spc/lVwI0HDUAvh//
         6NP35oYWxoyFqGIiWrsyhIlajIbxAZndoX5mYk2uZad0AvrcGnujFxKC1ijZKvbOrVLT
         CaIVR7VaYj6gwfZBEyp8VaUaTjojN1XJQoM/jFxUK0OhyX7H47eT7++F43NGoae5Fnng
         xBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698127306; x=1698732106;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xoaMNj/aKsBMokn9N8BEd5LlZSQdlahP3q0h2tDpraU=;
        b=IsFZSCrZH1p8UgSbcd9vYRZothkGGn7K0rlEJMp8Bg9K216H6FVbOyKkvwYonOP5zM
         owv68KrdYIgwnA61NKOMqOEHNj+/dv6Tv7Yb4qPQg/8/eBOCrPBISp7+3nuqXI44YBwA
         Zo1bHMBYuOxXNmEkL++ujAOXi64dglk/BmHzdBnIB7VFxUGUQj2+eo78w3h/Zu/RaKmP
         ZC1ob+ZY+u+iQ38klrwkXdXEh9hp0D91NhNSxP9YU4h1OxzfOeHPmU2U2+JYKxGGrET3
         pdROCHqYLwIRHCnmTrF1mRg61N7hoZlGa+DG9VnG8uxMKhGVrmGcpR6rn27NHRkasCmx
         +f/g==
X-Gm-Message-State: AOJu0YxS0yeIKlD7jq8wlGHmzEyAoj/DzMtP89afZwbcnXx5rLA2Ih6P
	syuC6E66jtxyQOyo0d3M95jsWw==
X-Google-Smtp-Source: AGHT+IHAsOQgflKaoP2v7XXbQ37O5Lus4k0e3RL7+CR2u0QgIkFvHpTXXnrXnqfbpoGlc4IQm0vcog==
X-Received: by 2002:a17:907:841:b0:9c5:158e:f61e with SMTP id ww1-20020a170907084100b009c5158ef61emr8871213ejb.34.1698127306503;
        Mon, 23 Oct 2023 23:01:46 -0700 (PDT)
Received: from [192.168.2.173] ([79.115.63.76])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906218a00b009c0c511bd62sm7627056eju.197.2023.10.23.23.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 23:01:46 -0700 (PDT)
Message-ID: <eb48c493-f585-4acf-83cd-e2466e1a4d40@linaro.org>
Date: Tue, 24 Oct 2023 09:01:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Add support for mt25qu01g
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>, michael@walle.cc
Cc: pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 Fabio Estevam <festevam@denx.de>
References: <20231023213800.2599704-1-festevam@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231023213800.2599704-1-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_230149_553587_FF66BB82 
X-CRM114-Status: UNSURE (   7.53  )
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



On 24.10.2023 00:38, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Add support for the MT25QU01G 128MB Micron Serial NOR Flash Memory
> model.
>     
> Datasheet:
> https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_u_01g_bbb_0.pdf
> 

Hi, Fabio,

I see this is a dual die device. Do both dies work correctly with the
current software?

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
