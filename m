Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F47C3601E
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Apr 2025 05:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:Date:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o4KcRiSaZyfVXEpwhp4JEfNygHDu/c0c7TwCaVDFVFQ=; b=SAI4Pn0aMM7ciB
	D9sVBxK8yymvdkVnXaO/KlAjGCEK2R66Fbf0XAfkUbuLb7eer1u7D/mmmZHBPRGU2W+57RGDrwjYZ
	qG3CAPyYVtqkasvB+kJtxhuqnkIFZvB9a0YvjFrPL/9ImFGx7YdygpTalItRy4tWqMa4UioNLibWR
	2Sh5ckZhBg5ssuOS3XhVjVi2UaJ9fxvzQQjE/iumaiyq75MqcjPVFiisaoq9vPrAv2diPff3v04+w
	fT0X3QDVWRo6TVMVb8+/9FgrL9hIuSnviR3jVKssyGefl+wKeprN57NLDrKrQ8YflgZsvbbnKQTZA
	e7NzXFhqbf47qBrn+m+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2kAE-00000009FfS-1aj0;
	Thu, 10 Apr 2025 05:09:22 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2kAB-00000009FeK-0iQ2
	for linux-mtd@lists.infradead.org;
	Thu, 10 Apr 2025 05:09:21 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-2c77a5747e0so216939fac.2
        for <linux-mtd@lists.infradead.org>; Wed, 09 Apr 2025 22:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1744261757; x=1744866557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G16oVcschOk1bCBWwdD3ZsJUcsex2zjDzFXRZC7O9eo=;
        b=bTezc2QKtdq3GOWrybi50OtrZ1hXPGEbx1gt4p/0L8Ke0mZxwKp7J5xLcO7OZbOHvZ
         0oxbYgHNkdmGNkQOpcKYnOcq0QFYoOe6kGsgvyNeZntYd360beG21a4DufSaS4Hco6jI
         gLC8F32k5W1COxW1TGksMk38b3z+vGMBmL1sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744261757; x=1744866557;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G16oVcschOk1bCBWwdD3ZsJUcsex2zjDzFXRZC7O9eo=;
        b=tp8tQIONGwr6m5o6Mfn0iQmldn/BuCzL4qwt8Fv53Scl7BcgZ3Uk2X6mEreV0gtgFu
         wVU1LBI+GyowTiO1s98Rkkn4cF122oB3Ed7DUgao0w+mtupXuM7gdQUiKxKNMhzM340M
         hrNCovr6VL1WXAT4ywpEsUSMATT3pb9M20T8yZnnRc3NBh4cf7e9NWgumZIrPoRoYQsM
         t49bcd3SeJZhcoLBPi6bQ2uUMXn/qUsXzm6Z6WWrgKiM28lmUMIuttg6Me6fSrM3cwz1
         lq9Dd8tUSZ2wu57O5BPQ0SnHjUb2R1RII5+qJvUq7kcB6TSA8iZiYlriiXO1ehWZTxqZ
         smBw==
X-Forwarded-Encrypted: i=1; AJvYcCUgWcDy4jpTc1gJClUygIMX03JhLnb2NGl4dqQSdrMR2M6b4rxIFuBnHk4L60NquM0vjWqGlMsYQas=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx8YbiSDTCIi6R3S7a+8TFpmOC80tTD2TK74t0Xwyvu4yNzSJE
	BCwNVb6qiuhagsYDw59mwUZMbtxswRj78BSDrv1Ahn3lBygiMMfVec58p9tcvw==
X-Gm-Gg: ASbGnctZxuOWEU9+SqaUd0P7HPIi8wO8d1z6MiVEGRp/5XO6UfKhutuFeNPZlG1iiZ4
	lAWd/IceES9MCRm/q1kYrYfb4V0h2jjPtomM4o5UvY3cIVT82ruqlfOidEXRp69MN2AzfYJDUAV
	GOjB0+YfSdS4V4hhAxql6FRRj8vRHbbDxJlJtdPEul7013hJBmzNhww+OM56TpbZF0PP9K1WVS2
	o830R7A23xiB9WVVeE7dHRFp5Tb3Cmt27o5yjB15/Al310gXAnFsF9QM68fJr61QNYIc4V0kJMl
	PvtjBKCxQ9g0Kthxcrrl51vu+b6IAasWwpPVWS1l8HNVq8t5GinSOZZH4LnTTCW7Z973nq796yv
	biqU=
X-Google-Smtp-Source: AGHT+IHf2dIBsgMwlqUxzHqfg0izmCh/XeIh4+y37IHWa4xRZwCt6+2s0H2VCnvp55v7eCTsGxhXjQ==
X-Received: by 2002:a05:6871:3320:b0:27b:61df:2160 with SMTP id 586e51a60fabf-2d0b383616dmr840067fac.31.1744261757422;
        Wed, 09 Apr 2025 22:09:17 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d096cd3764sm534917fac.31.2025.04.09.22.09.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 22:09:16 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>, "Kuan-Wei Chiu" <visitorckw@gmail.com>, <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>, <jk@ozlabs.org>, <joel@jms.id.au>, <eajames@linux.ibm.com>, <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>, <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, <dmitry.torokhov@gmail.com>, <mchehab@kernel.org>, <awalls@md.metrocast.net>, <hverkuil@xs4all.nl>, <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>, <louis.peens@corigine.com>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>, <parthiban.veerasooran@microchip.com>, <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>, <yury.norov@gmail.com>, <akpm@linux-foundation.org>, <jdelvare@suse.com>, <linux@roeck-us.net>, <alexandre.belloni@bootlin.com>, <pgaj@cadence.com>
CC: <hpa@zytor.com>, <alistair@popple.id.au>, <linux@rasmusvillemoes.dk>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>, <kuba@kernel.org>, <linux-kernel@vger.kernel.org>, <linux-fsi@lists.ozlabs.org>, <dri-devel@lists.freedesktop.org>, <linux-input@vger.kernel.org>, <linux-media@vger.kernel.org>, <linux-mtd@lists.infradead.org>, <oss-drivers@corigine.com>, <netdev@vger.kernel.org>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-serial@vger.kernel.org>, <bpf@vger.kernel.org>, <jserv@ccns.ncku.edu.tw>, <Frank.Li@nxp.com>, <linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>, <david.laight.linux@gmail.com>, <andrew.cooper3@citrix.com>, "Yu-Chun Lin" <eleanor15x@gmail.com>
Date: Thu, 10 Apr 2025 07:08:58 +0200
Message-ID: <1961e19ee10.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <740c7de894d39249665c6333aa3175762cfb13c6.camel@sipsolutions.net>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-4-visitorckw@gmail.com>
 <25b7888d-f704-493b-a2d7-c5e8fff9cfb4@broadcom.com>
 <740c7de894d39249665c6333aa3175762cfb13c6.camel@sipsolutions.net>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [PATCH v4 03/13] media: pci: cx18-av-vbi: Replace open-coded parity calculation with parity_odd()
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_220919_242994_15F6AE6D 
X-CRM114-Status: UNSURE (   7.96  )
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

On April 10, 2025 12:06:52 AM Johannes Berg <johannes@sipsolutions.net> wrote:

> On Wed, 2025-04-09 at 20:43 +0200, Arend van Spriel wrote:
>>
>> This is orthogonal to the change to parity_odd() though. More specific
>> to the new parity_odd() you can now do following as parity_odd()
>> argument is u64:
>>
>> err = !parity_odd(*(u16 *)p);
>
> Can it though? Need to be careful with alignment with that, I'd think.

My bad. You are absolutely right.

Gr. AvS
>



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
