Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F566C33CA9
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 23:41:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5D7D2080D
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 23:41:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gLzfxYzu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5D7D2080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3lMsxbovFZ4mDAfSx3cL3e5uUuJJGvkOgRChfM6FDBI=; b=gLzfxYzuVa7YVX
	fwCb8QbIzz62S3m/oaH1+6DM98LwDAll0X/yilL5OlJq0Vf6Eo7MmbDFUQEmsi4rXs+GkNvAiAR+4
	rCgaMP3lzWwObnhoEqPNdczD4Hs9zhsTXezKrHqSUDVJVsPI3YX3amMNkszurz5tbnxn9TzVyOXPW
	bN8m03VI4y/IazhzEgpn6YV0z57Bgc9jTjfkADGzEAqceEH42Db5RA8/khTVa5Y5h1STcZPi7ime4
	NVuUU78dY/88TllVZGm7x6sIjASHJN1nmDMbilV9iIEMkSGudzMyoqZ3hyXjuODj8YFqQ5n6CGAw3
	SqGVFkudQEJsphlPc2OA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir9L2-0004LL-EG; Mon, 13 Jan 2020 23:41:40 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir9K0-0003SI-Ad
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 23:40:38 +0000
Received: by mail-oi1-f195.google.com with SMTP id 18so10070777oin.9
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2020 15:40:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oyL/JS9B7rUgj8Iql4HM1FyxI7CsxZnIzSDjO8scpzY=;
 b=fZIVS+mRmV1fsok/xxRDcFU/N+aBv7mp9xf+ZeaW58ndlHQTJqyqoP5yqek3b0k0/7
 CB7JOijlUH0LmaAXbqcGtlxQSi2uk4o/k9/mnjjSYMyuNuqGVzTa+mLpCxr/hILJeEKx
 xFiHp+iWoMWGOYYG9Vp+6lAjYVdDHEWMnLaA7nKNnyVystKF7o1Esy6o5owMuYlox+rI
 1JpinCjd4HH/sryWbI3ffIM7or0UtRH6vRvipFH4scISSF3ce+iJFFjpvGdz50lzUVoC
 kWtszpPDnkc6eW7KIggKgmluSoRA9YpE49bpAxyjY3/sMTpWdddVQAophIoPezzqw34l
 0TJw==
X-Gm-Message-State: APjAAAUFvii+hxxxnxfzkPZ6CtWlusge7jqiF4oNgjUa+t5d80o4U2BO
 NlgnQCQ1ukNsGdePWjR8fRAW0fw=
X-Google-Smtp-Source: APXvYqyEc3KMTTZR6TdRoB10Z7KY7L5YzVX/4P3F3WgixmE1VcOBMZ9omoC6jG0gjdWnm7eTis6+FA==
X-Received: by 2002:aca:5588:: with SMTP id
 j130mr14060793oib.122.1578958835581; 
 Mon, 13 Jan 2020 15:40:35 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p16sm4661863otq.79.2020.01.13.15.40.34
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 15:40:35 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 221a32
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Mon, 13 Jan 2020 17:23:23 -0600
Date: Mon, 13 Jan 2020 17:23:23 -0600
From: Rob Herring <robh@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 03/17] dt-bindings: atmel-can: add microchip,sam9x60-can
Message-ID: <20200113232323.GA31125@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-4-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578673089-3484-4-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_154036_389889_9614E84D 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, alexandre.belloni@bootlin.com, vigneshr@ti.com,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, pmeerw@pmeerw.net, miquel.raynal@bootlin.com,
 lee.jones@linaro.org, linux-rtc@vger.kernel.org, lars@metafoo.de,
 richard@nod.at, ludovic.desroches@microchip.com, wg@grandegger.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 tudor.ambarus@microchip.com, radu_nicolae.pirea@upb.ro,
 linux-can@vger.kernel.org, robh+dt@kernel.org, mkl@pengutronix.de,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, a.zummo@towertech.it,
 richard.genoud@gmail.com, nicolas.ferre@microchip.com,
 linux-spi@vger.kernel.org, vkoul@kernel.org, knaack.h@gmx.de,
 dmaengine@vger.kernel.org, eugen.hristev@microchip.com,
 Claudiu Beznea <claudiu.beznea@microchip.com>, jic23@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 10 Jan 2020 18:17:55 +0200, Claudiu Beznea wrote:
> Add microchip,sam9x60-can to DT bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/net/can/atmel-can.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
