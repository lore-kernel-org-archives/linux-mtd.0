Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9DEC021B8
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2025 21:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GcivLfeLxFu70LEd2tJNExydHwlFrhETFWXbC73OUUI=; b=usrHm9Q+932hPM
	FENN1kkh2SGO1/XGrlorvnWQ3/gCmsMOEpDIo24m+EL9OusT7oiFbcQEk1TPIaouynv6zbtTuvZux
	/aueNxemADEcY9aunk+hSqX7OSpghNSsy97Ypl02NhObFO9CeQwKZ8PjJ+mRkefDHPAz2rj068sNJ
	ZCYXOh/PwT0cMbvxfR8uEmcYw1HtxYsPW4SVfSsBXkAIlaBFa62vYOGDTmbj5rIa1tJYIPEmLUBar
	8MvsaSuyo/O3abaYe9/3/+cs8HvRq6+Aoz/HGzaySE5WW3qsxaRAXJOho2+ZLu43gt1CZZdJ3k4n8
	LJFdLZG/6ZuDiPYH/eFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2iI-00000001b25-0RaA;
	Tue, 25 Feb 2025 21:43:38 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2iC-00000001b0O-1VwE
	for linux-mtd@lists.infradead.org;
	Tue, 25 Feb 2025 21:43:33 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-38f5fc33602so162490f8f.0
        for <linux-mtd@lists.infradead.org>; Tue, 25 Feb 2025 13:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740519811; x=1741124611; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v6VBRIDfPPAuGSOJ6DX9lU3J+goTuMImOESXIUQcXCg=;
        b=lTLR3Ncwtzqz7pNF83TI9mG47JxhjK4KLaE4QD8tKNzZjowepQ5/ZLf2zk5P2JW9PD
         DjD1OZwEiqCT2ZUMT4P0rRxq36BOwUi+z2+qyWUjXak2hQBgSzHLrypip9fuQ9K4PZ8s
         LEdr0SNo5ePanx3ccSpJX+lHx1CaZwI94zpuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740519811; x=1741124611;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6VBRIDfPPAuGSOJ6DX9lU3J+goTuMImOESXIUQcXCg=;
        b=MXzcraR+dP+voQMV/1rY81znMX3tCFIFndcBNEYt/HrWWaz/zf7KaZCGgRaa6xh1Ru
         uJcqYMOjei2lNIABeDq2GSGsr9GAA+lTlu0f7Z9IXVQbtWDUWiSdapo4rjqmbEiBAlFl
         ghkKMmLe8Jop1BClWAMlTyBPhgOVSSRpOGz9vv+VanduHLBzqZZSNcgcjlL1DxYKylEM
         W2dpN5EOcgj/BYUOcGknUK/BBFJHsPkq0vnZHNWuRIG5Blu3JWvOcok4LutvNJgCIW1y
         mgETIpcF5V01axWRxSfMLZo9wZWA23NwWS1k9uf3bYSeXUAUNmpb8eNMG+otIWAQ72Gn
         Zq3w==
X-Forwarded-Encrypted: i=1; AJvYcCWA7ynDZ7TFojb+ashPPSWzYd5sQitHB+8l9SHfRumwzx2o0602CS80G+rhsQlLPOp1z/zPhbvssBU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAyDdQTdeWgJZvL3IXnR/N3sOwmjkT/oRNwkxekpI1+GhDJg9V
	K1F9HnXJQEqOBRxBAs3vjfPvzuJJYtEk4CgextcjD3bRk0Vcp0S7kmrRqX5O0bw=
X-Gm-Gg: ASbGnct6xGTL5N/Bb5ZpMvBO658iE4ZiYZE+P+Xakewx9MKEQxMqQ1fqNQ8p9Gywc3q
	xkLBku3aR5bEnnWHbFbGL8+POIlKWelx74A9FhDmGv2/m9ADGLSIJo6Fj6R+q6VfaOmJDFSD7JD
	8nmLgrLZau+nOH5bJEo+4KzSA10PJ7VLyNPUglKmi12On387N6Q0QxAf+Fcls3DoPODf+YHCc2m
	i2u41a3EnTAg9/mCedalTlu6aFPVZ4Q++ciqyWadgkdQbcdk704MmRbhwpLJY9iqHhkHKloo3Dm
	dWGj6UsTaQrYWByo1bdzGhjO9umteKnGbcnomMC5cGDOBOjTrYH4hohLZvX5jQnZHw==
X-Google-Smtp-Source: AGHT+IHSlhsBYfXGudlA126ARnimf5DJid2NXAt0zMRZRmjxnTP+DlMFj1fR7Dt14yukNzUQAYX1Dg==
X-Received: by 2002:a5d:64a7:0:b0:38b:f4e6:21aa with SMTP id ffacd0b85a97d-38f6f3c50b0mr11926957f8f.5.1740519810679;
        Tue, 25 Feb 2025 13:43:30 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8fcf29sm3520900f8f.100.2025.02.25.13.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 13:43:30 -0800 (PST)
Message-ID: <8052b316-9f72-42c7-9e11-e23e690d80c4@citrix.com>
Date: Tue, 25 Feb 2025 21:43:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: hpa@zytor.com
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 akpm@linux-foundation.org, alistair@popple.id.au, andrew+netdev@lunn.ch,
 andrzej.hajda@intel.com, arend.vanspriel@broadcom.com,
 awalls@md.metrocast.net, bp@alien8.de, bpf@vger.kernel.org,
 brcm80211-dev-list.pdl@broadcom.com, brcm80211@lists.linux.dev,
 dave.hansen@linux.intel.com, davem@davemloft.net,
 david.laight.linux@gmail.com, dmitry.torokhov@gmail.com,
 dri-devel@lists.freedesktop.org, eajames@linux.ibm.com, edumazet@google.com,
 eleanor15x@gmail.com, gregkh@linuxfoundation.org, hverkuil@xs4all.nl,
 jernej.skrabec@gmail.com, jirislaby@kernel.org, jk@ozlabs.org,
 joel@jms.id.au, johannes@sipsolutions.net, jonas@kwiboo.se,
 jserv@ccns.ncku.edu.tw, kuba@kernel.org, linux-fsi@lists.ozlabs.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux@rasmusvillemoes.dk, louis.peens@corigine.com,
 maarten.lankhorst@linux.intel.com, mchehab@kernel.org, mingo@redhat.com,
 miquel.raynal@bootlin.com, mripard@kernel.org, neil.armstrong@linaro.org,
 netdev@vger.kernel.org, oss-drivers@corigine.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, rfoss@kernel.org, richard@nod.at,
 simona@ffwll.ch, tglx@linutronix.de, tzimmermann@suse.de, vigneshr@ti.com,
 visitorckw@gmail.com, x86@kernel.org, yury.norov@gmail.com
References: <3BC57C78-1DFF-4B83-85AA-A908DBF2B958@zytor.com>
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3BC57C78-1DFF-4B83-85AA-A908DBF2B958@zytor.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_134332_401927_3468A76D 
X-CRM114-Status: UNSURE (   4.50  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

PiBJbmNpZGVudGFsbHksIGluIGFsbCBvZiB0aGlzLCBkaWRuJ3QgYW55b25lIG5vdGljZSBfX2J1
aWx0aW5fcGFyaXR5KCk/CgpZZXMuwqAgSXQgaXQgaGFzIGRvbmUgc2FuZSBmb3IgYSBkZWNhZGUg
b24geDg2LCB5ZXQgZG9lcyB0aGluZ3Mgc3VjaCBhcwplbWl0dGluZyBhIGxpYnJhcnkgY2FsbCBv
biBvdGhlciBhcmNoaXRlY3R1cmVzLgoKaHR0cHM6Ly9nb2Rib2x0Lm9yZy96LzZxRzNub2VicQoK
fkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
