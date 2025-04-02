Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D02C3601B
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Apr 2025 15:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BMwHlNQZgQLvX8rdDB8/OHtjacf5LD+DIUt5BQfiYdo=; b=HB96T8fU52WAh8
	Pm/u6N/XPDTaU1EFvxwFIwTWdqmv7ucKva3gI5PaRClsKcEoEiMm98CzM8HEaIsYo7VkTzvNVbvAF
	08mZnpayjEHK0E5Cq0TrxBhcDHGRjKNC4S83UMoFHFoRwUzzMeRBr6NlriwkO4Xo6fl9Rmc48Pzrp
	B3IHKZgkk7ZbCNB0YColjMWaWKjobNohQfEzGoaSm8sRGBjvmXOgLvaRZ9aAhPG5PpKe6JaSLWT9p
	QI2U4PuCLUe65uDsFNF93eaq0ubZqAr7/rNlz6AuWh/3zW/jsVrCg/5m+KIko3A8RCyEgZ9e4o0wJ
	NTgSEwU2RmoaDHiqGcog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u002h-00000006WMQ-3szT;
	Wed, 02 Apr 2025 15:30:15 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzyV-00000006Vlr-3R3j
	for linux-mtd@lists.infradead.org;
	Wed, 02 Apr 2025 15:25:57 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso34018995e9.0
        for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2025 08:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743607554; x=1744212354; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l926G3/GnKMsY91eRIL3ZKQSAklEMXj6F7fRMQUHM2s=;
        b=yiC1N26aOaxjU5yJy7EqBguv1WpNZX5shAG1yMmzNwAzbx0EFsWSUQgoC6nJN61sNA
         EQn57DjjC4GJYGPS4z8fxtftlW7Y3+Iz1ydghf/NpfxB9WtflWUZ+0xJTR0fM7INXQj8
         1VuUJTUIyBBNnpTtyZ/lIYEgcNFnvdRttMPEaI2fJZDCwl4Vk0DsoGVQedI/W6Jj8bnh
         wWGl24PBxM1hidRtTnsUchwtIbyl07skBZwtXq3WwitGNAdDuPm7xbJnauAmgcrTji4a
         yH2T9ddDNtktSGOvYmR1FXNl3sUEBW0t6zUtyjKoXB0BLYqDj1wnMGUPYW02QTa6p7d0
         Y1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607554; x=1744212354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l926G3/GnKMsY91eRIL3ZKQSAklEMXj6F7fRMQUHM2s=;
        b=AkXcMbmE40lYPznDrOWoIyVjiulG+G42srExh2xyru8tc2xiD2cOjvSr/Ae+b7B3DM
         8/0wZoX4p9erig3hwpqHdC7PrMO8XW+bdAGq5b9cpo8WuE9JWGDjrv5xI3/tihqf6+5F
         Lx1qk49+rP557+WuN8o/2C4ngHRfHk0Uz/apDeCVwY03Mfu3VTfBiXsmYrcaBk1bOpDu
         MfrxwB/gDnzCdVcvL9f4g6zN9Zdw4SnHjhrWzRyLO5AkQ5HSLMWwxGSB49K2k4wcL2jf
         7a6EvjbRWG3a0hafYajIRUlvv8vfgkkrQUR2Zt4Ubiv1x7w2ApCk/nkeejdQ9b3qptBI
         ov1g==
X-Forwarded-Encrypted: i=1; AJvYcCX5lWj4yxWgI3/p3DhghgOhaMuH9mYiNgBgd9gbnyE+r9omufAh8eb3ZAhGNYU87SDnklGyz2ztnrM=@lists.infradead.org
X-Gm-Message-State: AOJu0YylnWchBkxVHFsnFhNX+lpTbT8DR9c3qj9eeYvEGnV6Y/W28eSZ
	ac4uAQ4kA5bTRmMcTkqq4mrHhOPosIDIbc9IPQNBJ5AT58/omxCXGs8FH7S8lOQ=
X-Gm-Gg: ASbGncvPvTaBHOzZiSLzH2Sk/el3mru8mx5jwcjlRZlNS6OAnfIXCvrp5uIeGk18eXo
	6YNL5GHjeUEenMbWSkkdxEuyyfiOWp7u7GeAemzMqsjwSVHNgFuwl8ms4E6HMFg8riVDqmxsJVU
	xsQ/5c3c9GvQAYUFAnfJRm7jUYBoD+2fteyid2lJgaG1foL9JCgCaGMbg9/nFf9Lqjv41YJB5P+
	t3IrfrosjLQwlIDXkGMpwuekb+yKJWeWQKoJhHPZ71UpVHGmqmzbNyO0a2mYd0iaOnkTtJS6Xhy
	otJREJ11gVtwDxC15suI+BISg0mD0XDv65qY/cq0kp/MmW+TQOQTwg==
X-Google-Smtp-Source: AGHT+IEegXmVKA09FbeJyOVnobPM7jeiGI/k1Yr7hy3uRUtv8KSbnYS8a+5IfVfK3n5ACyNX1dGU+g==
X-Received: by 2002:a05:600c:8705:b0:43b:c95f:fd9 with SMTP id 5b1f17b1804b1-43ea7c4e749mr79860615e9.5.1743607554183;
        Wed, 02 Apr 2025 08:25:54 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb61b633asm23897165e9.37.2025.04.02.08.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:25:53 -0700 (PDT)
Message-ID: <c41598be-08ba-4417-9fc8-94377d8b1d61@linaro.org>
Date: Wed, 2 Apr 2025 16:25:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/21] mtd: spinand: winbond: Add support for W35N02JW and
 W35N02JW chips
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-21-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-21-45c1e074ad74@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_082555_863678_6C5CE7A6 
X-CRM114-Status: UNSURE (   6.26  )
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

I'd consider squashing all patches from 16 to 21. But not a strong
requirement. I guess it's a master of preference.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
