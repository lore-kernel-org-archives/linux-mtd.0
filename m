Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04049C021B8
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Feb 2025 06:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:Date:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RXD08Aepmy9l5Z15v9zyZQXFjUa1Uu1H26mZXI7JV5k=; b=D2ttSUG6BLZ2fv
	wueAjmNn49Z4eGYpIZMSrPZc1H2+h2cG25my3syAqabsfMWR4UpsxdQ/K28wbZXcOY61a56j7COnD
	4eL4R07q/Gec5iEKloanufmNk9lvL555ic0QkDsSDPAWg71u8J1P5o7eR3hl1H/eV59uQwwGrfeXK
	un+9QyYWvzJ4JrKdlPYVz+31aT29kjwsxQggCnK1rSuMqotM2KaxvxwVtYFF8sbQYh1c/kD+E2/WQ
	nb/qGnUep4BJQqrru3L7OedNt4t1xl9kaOzJR8U0HiT0Xc7Eu8Du03Z2jbzhsCBGz2+bTdg7Fjba/
	QdytGtirlhiyyWE79nlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmoSJ-0000000G6IA-3u0E;
	Tue, 25 Feb 2025 06:30:11 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmoSG-0000000G6GW-2K2o
	for linux-mtd@lists.infradead.org;
	Tue, 25 Feb 2025 06:30:09 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3f408052bdcso1815784b6e.2
        for <linux-mtd@lists.infradead.org>; Mon, 24 Feb 2025 22:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1740465006; x=1741069806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+mBAQq6Mkez/2/DMWHStf85qnBYyGFLVJqfvqnbkxk=;
        b=K08DIs5HRMBeRdcKtjUp7QU/PHMVLXvZFDbTeUkxtNrGtmvOE5z9dzfyBGdb3Hq3PE
         7hWS2zLridZNv/95I3v2la1DIiV3xaVSCjqpjRb9dNrWFjTt7vyX6WBg9UPpDDFnu/SA
         M/uuVvKrHdPPQdikESIUSd7YmUO7DMSm1WQgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740465006; x=1741069806;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+mBAQq6Mkez/2/DMWHStf85qnBYyGFLVJqfvqnbkxk=;
        b=kGWlWV60MSagZnd/bPUFkZaynIp/F4DGIrPpN3vTquL5K9mzj4BbQaT/kqAHmItGuc
         4VuvM9kkWeYQqpp5jRWzCO4n/e1kC1jsebMsxPxsf/aROsHoXNmcfjM86+nNf6IxMQAi
         Rs/P8t3yg5K8tRdBHzBH2W5VkF02I0ry+/xzKq2dsc/eyVjUhxlT8YxmulnP7fR76fyd
         JO9bkEy6Q9xMm04shHUZIfg5D4FS08bKkGQBqfs+RaEyXkhUqmNI8cKcyRDd0R6jWcIH
         WdSoUkH55h3IrLxeeCF+Y1uVSqQXwpO3iJmWvOQz3rjqONftG758PA4CW4ASx87809xz
         2prA==
X-Forwarded-Encrypted: i=1; AJvYcCW13+0Q2kQ+uD8iS+S6NMRs3a6Fzi6fYw+22RXIqu7i+HFyNpJ5/LMUeBnJTMC6YwhcFQRryZ+8UHc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/cL0Ash03PDJdy4lu1zcfmvMF8b6W99WmC62Tq8frfDolYuOw
	4+RH09+mWiHJcNI+SZLjOv9LKk4M/nS5qXvb/ZTO4lOxFW6GjFAY5+A09L/9ew==
X-Gm-Gg: ASbGncsUfB1Hjr0oZuU3spC59CePkXROizqix1xwZUGgk7mV76sZxdfpux8Q86NhbRI
	UgnqNezdS/dqnMOZntUL99m7E9osJM9KHTnxB2xLyWwVJHTtSJLRBaX2dtwdTgn6zeiirmSZLFf
	XOHJWwGrH4C6ZWhE5l0pVjPN9C8/N8URT+EPNiznYz+FRL8OXu+CS99EGoh5lh4j5pDBDiWyWAx
	JQyuXL3VVJq9rjwEjRufEggi5Gl0AnHzOTBkUu6Y69ci7ti25qH6jOF2JsxTriCV+U8c+DAD+Me
	hfkz9lcjg+vDNelfshEgTxNzWTlRLVXVUKnousmrhFJa/2OafaloaZxwkIkcYIuV
X-Google-Smtp-Source: AGHT+IFdXMbhGx7fP9GFKGlpguOITWaZZGOBzMRAt9OnDAJpr0Tf6LoZNYE9WcUj4WMJOinaxdWK7Q==
X-Received: by 2002:a05:6808:3c8f:b0:3f3:e8e7:2001 with SMTP id 5614622812f47-3f424777eb0mr12305946b6e.26.1740465004283;
        Mon, 24 Feb 2025 22:30:04 -0800 (PST)
Received: from [192.168.178.74] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f541bd992bsm190300b6e.16.2025.02.24.22.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 22:30:03 -0800 (PST)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: "Kuan-Wei Chiu" <visitorckw@gmail.com>, <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>, <jk@ozlabs.org>, <joel@jms.id.au>, <eajames@linux.ibm.com>, <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>, <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, <dmitry.torokhov@gmail.com>, <mchehab@kernel.org>, <awalls@md.metrocast.net>, <hverkuil@xs4all.nl>, <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>, <louis.peens@corigine.com>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>, <parthiban.veerasooran@microchip.com>, <johannes@sipsolutions.net>, <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>, <yury.norov@gmail.com>, <akpm@linux-foundation.org>
CC: <hpa@zytor.com>, <alistair@popple.id.au>, <linux@rasmusvillemoes.dk>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>, <kuba@kernel.org>, <linux-kernel@vger.kernel.org>, <linux-fsi@lists.ozlabs.org>, <dri-devel@lists.freedesktop.org>, <linux-input@vger.kernel.org>, <linux-media@vger.kernel.org>, <linux-mtd@lists.infradead.org>, <oss-drivers@corigine.com>, <netdev@vger.kernel.org>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-serial@vger.kernel.org>, <bpf@vger.kernel.org>, <jserv@ccns.ncku.edu.tw>, "Yu-Chun Lin" <eleanor15x@gmail.com>
Date: Tue, 25 Feb 2025 07:29:46 +0100
Message-ID: <1953bcc1790.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20250223164217.2139331-12-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-12-visitorckw@gmail.com>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [PATCH 11/17] wifi: brcm80211: Replace open-coded parity calculation with parity32()
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_223008_620709_F9C4662D 
X-CRM114-Status: UNSURE (   7.62  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On February 23, 2025 5:44:54 PM Kuan-Wei Chiu <visitorckw@gmail.com> wrote:

> Refactor parity calculations to use the standard parity32() helper.
> This change eliminates redundant implementations and improves code
> efficiency.

While the dust settles on the exact implementation from driver perspective 
looks fine to me so...

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
>
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> ---
> .../wireless/broadcom/brcm80211/brcmsmac/dma.c   | 16 +---------------
> 1 file changed, 1 insertion(+), 15 deletions(-)




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
