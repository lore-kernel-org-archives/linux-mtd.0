Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB269C4345F
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Apr 2024 04:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jEY2K883ark11mPFPXeTi7KrgsuwkwtanflZ/sN4E50=; b=bYQgJ4aqV67rXx
	tYm1IVN9k1EqxKzlTEr8/EfBoMQvO+cSztwErrWR5kNPs6InA4eMzguhg9GOjdQb3CwFy6LfvQ0yK
	arjYZSk1xNw5JKoQHTjI+O0nmeMQ8w99ArpUH9ccNQH9wqWRFXzwEBEI0f9HaDmJuwVIuC8uPoCPV
	uKLfQEgMtcGOi8E56Z4Jb4AO8tL22ILF/gaUKykyV2pG4Ma9/OuBVr+k6pxXmYTJm7Uq0XXeZgSCT
	VDEl4ZxjcWrcsdqpsUOr2rkPaYpmc2GIW1CECAuiwsxp24BCOwDnDmXVwQ3GE09u8ObqlQ1ZrNPF6
	R2HtGU1YpfKhM18KVwLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwaj5-0000000ArBL-2dWh;
	Tue, 16 Apr 2024 04:47:23 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwaj0-0000000ArAt-1ywC
	for linux-mtd@lists.infradead.org;
	Tue, 16 Apr 2024 04:47:21 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4185e80adfbso8786745e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 15 Apr 2024 21:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713242835; x=1713847635; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0w0mf2HuAmek3bCovjiGQQ6gYiZiYEwkgAq9bMWHoBs=;
        b=d7T5sCKqd/5QobfRuHL7bFgHJquo5NsJr5z2VHdOnAxoC8qR14gfUSYE/2ow8GC2k7
         +E5/8x9zXJPZr5E4kuRy2D58cA1eQN607kIsVPlGwAhOJS9g4EplALRHAyaTDPIThqdh
         iofgMqizd1qGbmiCSUdMeGQxDmGARxOTTq+juktwCRGnm4eVXIzVg61lVWLgsCgYEtAC
         1qjejGKxBbdu6xVc7WuWTFxhaA0B2vAMNuI3WqRUPOCybTIqxO78SikZ0V31jIQHrLpC
         v4Kd1wAGLI2Is4yIsnWTBYp1j0c8gh6WpUrCfwtlwdc1xbsMU2a5Dz5MO9ZyGw8NwcSz
         5cFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713242835; x=1713847635;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0w0mf2HuAmek3bCovjiGQQ6gYiZiYEwkgAq9bMWHoBs=;
        b=j4XYQZmdmTsT5HcKIv02C+6v3AjGVRzQ2zpMEF2mSY6X88BXUO4mbij+iOXHVrD5Lt
         tQYiyRzwphOtItSoBPXRZkD4XyVw5nhY2/qOUe+bak4j4fP7oCIBf4wk4cFF/tVl992x
         b7JfV7ua78OUFn77Hq7M9PbsQBxRk/BBht68mu2l8k3MUbiCfETdHnBd4Vew/FiktgxG
         Uf8v/m+oouEyt59Jy0tqYE7OXkwg3IA75Reo5zzq1koURDQKzr0Ai7clHlKv0swKh5r6
         NxijJ8NOz87py6MYg9IMteU1EqZorzMZd+On3PsSEBJru9ag3UeBw1hPGE6MR5GT6dhS
         Z83A==
X-Forwarded-Encrypted: i=1; AJvYcCW7crNdeLNO4C7KTt4dJ2F/K75wW0bfkdJ6Xqo/QZNVwy/KPokGWBQotz4eAkHXo/BhqJMemfX4wCVPSmJ6POiy1N3osa3NNxo33VyuYA==
X-Gm-Message-State: AOJu0Yyon734xOphcWByRxyUArQXEZkM13FgnMjxstRMhT4hXdSb4L+n
	KQ14ZpD/h9LEcuut1A1fBkL8t8CBbaUDHx0qe9PZvoqE/UmwwTguuav3a/wVnT5iM09YUE6qbSx
	Q
X-Google-Smtp-Source: AGHT+IFTJnCHKKst1QLHRIOiskMT6H9/QReA1U6iXuuZ7myHNQ1vA0TtGoj7popqPST4uGN8uz9oFA==
X-Received: by 2002:a05:600c:5246:b0:417:f6ce:3353 with SMTP id fc6-20020a05600c524600b00417f6ce3353mr8047829wmb.11.1713242835539;
        Mon, 15 Apr 2024 21:47:15 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.35])
        by smtp.gmail.com with ESMTPSA id e22-20020a05600c4e5600b00418980a1ce5sm527668wmq.7.2024.04.15.21.47.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 21:47:15 -0700 (PDT)
Message-ID: <33e8e9c1-9b96-4b46-ac63-2827924ccf83@linaro.org>
Date: Tue, 16 Apr 2024 05:47:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/6] mtd: spi-nor: get rid of SPI_NOR_NO_FR
To: Michael Walle <mwalle@kernel.org>, Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20240412134405.381832-1-mwalle@kernel.org>
 <20240412134405.381832-4-mwalle@kernel.org>
 <14726a74-d54a-432d-a547-3b07ac97d413@linaro.org>
 <D0I77YRZ2H9K.3P77J7WK3UTZ7@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <D0I77YRZ2H9K.3P77J7WK3UTZ7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_214719_667020_9119B1D1 
X-CRM114-Status: UNSURE (   9.78  )
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



On 4/12/24 15:03, Michael Walle wrote:
> On Fri Apr 12, 2024 at 4:00 PM CEST, Tudor Ambarus wrote:
>>
>>
>> On 4/12/24 14:44, Michael Walle wrote:
>>> The evervision FRAM devices are the only user of the NO_FR flag. Drop
>>> the global flag and instead use a manufacturer fixup for the evervision
>>> flashes to drop the fast read support.
>>>
>>
>> Don't we want to get rid of FRAMs from SPI NOR? Why the dance then?
> 
> Yes, but it isn't that easy. There are (three?) in-tree users of
> these chips. But we can already move all the special handling out of
> the core.
> 

Okay.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
