Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF13EC19F32
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Mar 2025 15:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cqFNzUeHCe3LtPY5yJk1oGj+HVbZ0TuYpkiwtJ71+DI=; b=pOTGlX6Ko2NqGx
	s3iZRckRC+NMIxWAO38xIoW3O+Z/k1oLjXeIgTAL0vJJMwBE/PCp+vYm8zq5FjmGsdo++rkK517Il
	A8Dxd4DV1Dm7CFatdVU59l5SkriDyDJwZjdUoHUCPwX/lDzLQK2FbZbSOZyMehWS0toKfeSRJhXq2
	hBW8k1uYTM70A16gN+z7VFM4z8eKcm9RZHlnvCDGYoF7wZDTHCyUkh2opxi0PV1CGUk0ftl53Qqzt
	ZtU3EKbI5vfeJCkXhO9Hht/qMg/hBfp00FMpMiuIVrKM8xlCrtbvfsf7irEPTSm9HplBz3gmaClFw
	qA+jWrvIEqDfqHY4mq4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tolXg-0000000GFs4-0DOc;
	Sun, 02 Mar 2025 15:47:48 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tolXd-0000000GFr5-1bR1
	for linux-mtd@lists.infradead.org;
	Sun, 02 Mar 2025 15:47:46 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-6f9625c0fccso32353177b3.1
        for <linux-mtd@lists.infradead.org>; Sun, 02 Mar 2025 07:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740930464; x=1741535264; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CCT1sTVFptoP0GXpHD4z8aJ9CCOqcWh1+88rLPDB2Qo=;
        b=SJYTaRtiq/nrytAn1BX9UbpWZ/PMbuWwHoTe/Pf2ccnOFgVh6q13TbZaA5HDTyra4H
         jw9yFDTjwTqvTg/gdAr67n/X6fWswyGm8x9S/W/9PukMr3/MCLszMlMWkW8eiomjyMs0
         2GHvVOnNLtQU7pRudnbc4h9Ab9hNboH6LWo7rvpf+XAWwMOkF7C43aCdIwM5gA6VFJqQ
         azItlaFcKq6F167GAuolcJ3mzMHJo9yi0NtF6+lNCJ7gOCoLY7X6gMqn3yiXsE0gfz7g
         WZe2mMIuZabOsea4jzIWXrnh1RqUyNG0okeeULPgpn7yH1pRxpSlKVWI5tOHqd1XhV1Y
         hizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740930464; x=1741535264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCT1sTVFptoP0GXpHD4z8aJ9CCOqcWh1+88rLPDB2Qo=;
        b=DHJFh5S+hrs3SjB7l8Ee4vVEHT0YzuwPIh3l9FuTpYKppvLP1V/kc0ArJbUZhaWmvt
         P6MLlIARhlOKiMmuP6F6yqnR4t2eGS2xe0HzHVTlOQrJCi8QO2kpy7aYLOc1nSY+KXrK
         zDbs3p8G5j9ZoyZMcli8ld7gb2hn5nGbkomoaqTwfYq2lgi5kns2giErcF0ZL9Ad8IY8
         GM7ERhlZjvXLr11GTwUxCyM+0EoUnG/aEH4VcTSG1ssDrJZ8IkEyInQa2WkGaruc0jOF
         mhboE5gEQGvY95alBw1eb6JCapMMSdhS/vI8003L+vIj9sTE05eTj/2eV47PKcVQthpT
         WoRw==
X-Forwarded-Encrypted: i=1; AJvYcCVL9gld2MColbyoy2WQ9sJloyWhVkx/ifZbN17Ub/OHS9H4Vkmx2NtjT8WDM20a+dR9nDboTyS7Vec=@lists.infradead.org
X-Gm-Message-State: AOJu0YzRW9+4/3xJLjwZ0y1zuQcvCpsu5+Y5s3U7mLVESHCJ+XrFe3pq
	amTrt/RysMbTPpO8fq/85EhFy+M/8jQWzdirzeonYFmqixmzzZcR
X-Gm-Gg: ASbGncsNoa9goteAi5jRNhxzCI82NfIMjyMGVfCkiufBM1Ojy5fTK/pw2NVhJbmAtBX
	1hgXawLfIWSYkcQU3bV+a+H2DwlSNYUhPaYCoNCBQc++UtWkgO2j5/eiD8inoppWwilNGUv1efJ
	7MuSC9BBO0PUSJLU8wrh/b7iz5rQpa3H96o2Gx1cD4/6FfFRez2aOAELzOSynD7K9oXZkC+X5pL
	yiyrOutntdCghaRYrJNtTicaty3++woddOTTZf/aAK04ZRZtOJ4+xKSPt5KGkUGMH3kypkicaKS
	YSpqfRnp4BrPTHv/iD6btf3PJx8mZt61Kr3HojYJeKTC5IU8j0cz9/ddUVfW7+k4Z34a9Wtrgi2
	7Vvoa
X-Google-Smtp-Source: AGHT+IEfQ39kTql5XsYDhHYJ6TV6j9haA6dlCxpju/Rqc4ygrtquBMosdzic0x4c9/qeMrvSjUoEBQ==
X-Received: by 2002:a05:690c:6301:b0:6fd:4485:9255 with SMTP id 00721157ae682-6fd4a122c2amr115575717b3.24.1740930464153;
        Sun, 02 Mar 2025 07:47:44 -0800 (PST)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6fd3ca41e81sm16218887b3.29.2025.03.02.07.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 07:47:43 -0800 (PST)
Date: Sun, 2 Mar 2025 10:47:41 -0500
From: Yury Norov <yury.norov@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
	eajames@linux.ibm.com, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, akpm@linux-foundation.org, hpa@zytor.com,
	alistair@popple.id.au, linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH 02/17] bitops: Add generic parity calculation for u64
Message-ID: <Z8R9nQmfeVvfDiOn@thinkpad>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
 <20250223164217.2139331-3-visitorckw@gmail.com>
 <Z7zIBwH4aUA7G9MY@thinkpad>
 <20250226222911.22cb0c18@pumpkin>
 <Z8CpaaHv0ahHFVuK@thinkpad>
 <20250227215741.1c2e382f@pumpkin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250227215741.1c2e382f@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_074745_419584_8226E2F2 
X-CRM114-Status: GOOD (  12.84  )
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

On Thu, Feb 27, 2025 at 09:57:41PM +0000, David Laight wrote:
> > It's still unclear to me that this parity thing is used in hot paths.
> > If that holds, it's unclear that your hand-made version is better than
> > what's generated by GCC.
> 
> I wasn't seriously considering doing that optimisation.
> Perhaps just hoping is might make a compiler person think :-)

David, can you suggest only things you're seriously considered to do?
Random suggestions distract my contributors and make them doing unneeded
work and experiments.

In the other thread you asked I Hsin to try your approach to GENMASK()
macro, saying you're lazy. I don't think this is the right way to
communicate, not mentioning that if you're lazy to try your own
approach, it doesn't sound nice to ask someone else to try it.

Thanks for understanding,
Yury

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
