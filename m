Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423F9CEACEF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Nov 2025 08:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0FDJp3zqRb0QrkQxkNSyi2GitV6lPKBfkng15/BGYn0=; b=yzs7O97ycTluZm
	3ZgxUmbkufaFilPwnY69d1U4VoXqWKiojKUjA2sZlhLFDGLhmWSWjuafHmLoad90jpU0Zi59XKRvB
	wmEzCgk5KNbj3Ed46wHqyt4fVeSH4vCu8wJvsXtDLbZgwKHEzVH2Ix/5kdzbkjdeh47+507xM+FwG
	62nUTQSehxUrhuG6z8d6nDOHOpa24HRhaS5xXtB+6PStCFU6ZF1TkoCfmnPMHNyBQK6VcT7NddyEu
	sb3XK1hmkFoNvnCqm4lpyJeZ59ytgwUaJ8U2l804F542GLXzwbz8L6oV7/TsMd5ZaJmuO4jrSEZN3
	IFhmZt5hqZ9Pf75ksM2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKuuw-0000000FiTQ-12i7;
	Mon, 17 Nov 2025 08:48:58 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKuut-0000000FiT0-2kfa
	for linux-mtd@lists.infradead.org;
	Mon, 17 Nov 2025 08:48:56 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-42bb288c219so1299725f8f.1
        for <linux-mtd@lists.infradead.org>; Mon, 17 Nov 2025 00:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763369333; x=1763974133; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F9Ekv4DBzf4GNLfu1ymqljCYgkpJi/eGpNLpGvTnMnw=;
        b=UD81S62vnpNoK+tv/BSJOKmQOXJf2YoU5eoLP0liVerVp6/zTuKh87xQsN9llORuds
         HDi5P2urBp5AEc+Jym4o1dbIUpbppfZBF3dVgZi3gMf+8jc+1rB2HTKkZfAowPHVV0ao
         8idkZL4NDSYXAJWc+c+sF8LTJcI8fCi+a/JivlUsyvLYiLZo9vst2mvXFoB/xaq3ClK4
         rf6ISBQlN+Z7hbwB3oCLuWMQGlh5dM0HHXKE28qf4iCfact3RvM//cRVx8OUk47PIoPM
         Byt4ZN9mKbAS95nD3fTFCpVgQH2in183rWLnmrSq5Sm9dLOoAlQrjA0IxSOE77CdyVDu
         Aemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763369333; x=1763974133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F9Ekv4DBzf4GNLfu1ymqljCYgkpJi/eGpNLpGvTnMnw=;
        b=OYE8xg31yXGGCcK+bBqgp9hyb5hTA3mXODVFuzl0EwcoKNLkmcVlCUoNYmbnU+kKGs
         ruL5l9VId5xezHGmATstD4VohLCLyguvkGFJOr2+wODwk7+8OFKNJSC2ROZYK56yrkhO
         q4uIHCKAvv1pKkmnbJJOHcOpC5432WWXYc+9u60UeUZXT8B3BkhLNiIrrWykbADaAs8D
         BprBZyOTWH07F9zPxyr7+QI0rURJ3oTP2CWTaqv3PajoJFiH7lTIal75Ru9A5skfDNu8
         jj4ne/3wRhATiOPuLeoe/+dLho22krGSIBJZ9XtP6V08YNPX18wYilS/PG5pEh6Ta7zm
         XKnA==
X-Forwarded-Encrypted: i=1; AJvYcCXATRQswOY1ut2fn0nJMGDohSrdmtB4iMk0HI5dvw4gvFuBTaSyPnmfy5oJpOvUghsUIlboFGZbOWU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5tIkqhG4cADnDHaQGDA208lqBUATynDo4VxKP7N23Nhp/sROy
	Bx9Ir/QY79yj4YZNaSxFhUfVd+cfV4C5eRxKRfRKzPd6Gh3LfKkZOIB5r2lIQD+VnIk=
X-Gm-Gg: ASbGncvTJV/T9uPJDTaJNXZtsESIU6N3XchEEiDUVBGdPQZJeb3sV4xmVJ+1pHtg6Px
	nSRPXkfVAXZz7j+d7C+z+4iKJOLUglOhg5/Om1n9mwHHHOuumzJoLG/xsNSsgOaxO7N/6BpFiEd
	rLTGKjnCqvmJcjNaAimpd6Xw+EEgDIyiihEP8Ae7wli4//FJYZoyHZg0D7ibYUrMg0tu/dZX1CT
	BmLltbBkpB/J2eNQoC7UjH9IaOSwGBWGqsYhkbCn7/gl/c2cRVSxfHVwC0OSTSFOcMs0rFo7+aX
	W4t1ytSrN0SkIe4LZ/lENTE7+/G01N+EVuH7aPPoYUUZqim+gtCZsmLO1MEW9V1JQtl82m1lRTJ
	ZFjhG1yu7a1djgZLD9RnMVh4Q8oy6gfKtTOLy/gXBrNn1KyImgUHMwNxri3PbCQ7e2HOabp7K/r
	lK2xkl5Q==
X-Google-Smtp-Source: AGHT+IFZGJuqQ6/q2o+84LGJ2B8ZoNwxt6P1gseMtPlf76oAPtK4I5ZXaieDDMq4DAaMvqUZA8PvyQ==
X-Received: by 2002:a05:6000:1ace:b0:42b:41d3:daf1 with SMTP id ffacd0b85a97d-42b59377e6amr10564821f8f.38.1763369333601;
        Mon, 17 Nov 2025 00:48:53 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b617sm24816810f8f.31.2025.11.17.00.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 00:48:53 -0800 (PST)
Message-ID: <3b4445aa-9672-40cb-900a-2853766cff6c@linaro.org>
Date: Mon, 17 Nov 2025 10:48:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] mtd: spi-nor: spansion: Add SMPT fixup for S25FS-S
To: Yasushi SHOJI <yasushi.shoji@gmail.com>, tkuw584924@gmail.com
Cc: Takahiro.Kuwano@infineon.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, marek.vasut+renesas@mailbox.org,
 miquel.raynal@bootlin.com, mwalle@kernel.org, pratyush@kernel.org,
 richard@nod.at, vigneshr@ti.com, yashi@spacecubics.com
References: <20251105-s25fs-s-smpt-fixup-v2-0-c0fbd0f05ce7@infineon.com>
 <20251116135235.1479860-1-yashi@spacecubics.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20251116135235.1479860-1-yashi@spacecubics.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_004855_706214_9A208781 
X-CRM114-Status: GOOD (  11.60  )
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



On 11/16/25 3:52 PM, Yasushi SHOJI wrote:
> Hello,

Hi,

> 
> I've seen the problem this patchset is aming at. I've tried this
> patchset on both the latest and the 6.12 LTS, and I can confirm that
> it fixes both.
> 
> For 6.12 LTS, you need to use spi_nor_get_params(), though.
> 
> Thus, if possible please forward it linux-stable. Let me know I can be
> of any help.
> 

If you already tested it on 6.12, what stopped you on sending the patches
for review?

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
