Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82347C54E58
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 11:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BpCHvttRdlC29XjMpUxpAWqCm7wXtI3ovCcLiF9UXN0=; b=UjV3hrj214WqdH
	vvIP+1Rx5KI5lkt7U5/r1E/OlrZgHe3fmKlCzoK9UyrwlOHuGuFgXeDxfPGxJI5Jbm/e01NKI+R/d
	PTjwQreWMUUuX4erNVXB1Kzmb1muH6OCDnG5lBJZfttjTRtC/CKRIDMtDZgyowmYNn8HqElQ0AtL0
	p8UKmIfY1aSlxu3CyQbqHn53VMpiF+qjc6uN+F46WVfXNhiNC40GkgnWfWfERnAZDJT9zvxll4Wje
	9PYZbiBrb+ITICh3486MC6MYsEq8XpGxf/fXJQaujLyacaQObIWojU0AcAorXbHVOyImHqGltFr3i
	UT9J5IM1v28dfh6P5p3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiRp-0000000H2Ez-0y1z;
	Mon, 25 Mar 2024 11:25:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rohQV-0000000Ghui-2XYe
	for linux-mtd@bombadil.infradead.org;
	Mon, 25 Mar 2024 10:19:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WHRv7g3CiPKX519Ky5IELZFKVKXY3LsLEia5o8nsqvI=; b=hqh7n+r2cSt4qWlMKLCGwpvls3
	i/EsW4qdo/j28JELPa3Lmx938BWkZdujTawXXuta8BWEZwhU4Cuuw7ibcRgjMWi1fF6tTeEtUGKoJ
	WrtFOoyJ+nCXB64g80WQwnVSlYcVErcX2HprJu7R6TSCgX8EQnBRj9i2vilyM3y8mzs+18On0PjBE
	C3T/5nfefNSJPUlUFkN19ia8a9EiXk/5KeUBvZImkne8ICmylI7vqxyUpuDoU7xWhOrLZ1aBMwtZm
	oaFzfjIOipJ/QP4WQI7A+E456gLU4SPSbsMA4FTbhKAI4hpcLiBjd0yZ0haL6qzfwipeeiSihzdfk
	vRu1x8WA==;
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rohQP-0000000GWUQ-3uKI
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 10:19:34 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2d21cdbc85bso56867731fa.2
        for <linux-mtd@lists.infradead.org>; Mon, 25 Mar 2024 03:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711361965; x=1711966765; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WHRv7g3CiPKX519Ky5IELZFKVKXY3LsLEia5o8nsqvI=;
        b=PhUQL2XlHunFsfRBr0ZuaDsb6uxYMXmR1SIjk/SpWUYPtgqpendyphVpzHn/WoP4A3
         aCRHThKR3Sfk6+ZlZzglX4yziZaRLV89llcjerIm+oZ7H8QzqDIapH+5V/SeNUQyVFoH
         4yotSxx5TRwWPyNjYKTbuqU9kUGGXEWOZJEwrkshEcTiG0LnsoeumKTlobxx576OTU2T
         8y/KAkkIXLCZ4TnIw248xCOIj0rKZNAPr7qhy4VczS2BdnanHWQ1udYix2se5as6yAow
         GZ2ndixkiZTFUbmM5/sKnr4tZqF9EDMXE9cXIUxDnrl0Cc0N4DEpx/wwn6bNV4quMDC7
         fQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711361965; x=1711966765;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHRv7g3CiPKX519Ky5IELZFKVKXY3LsLEia5o8nsqvI=;
        b=roRstRWvsVsoq5ieT3LDgz7BS6jupZE0MXc6pavpa8ZwUhhaaGVsOljz1kFKbtWyP8
         kDqDHYVevVw8HA0UlDgL6tmAl5H2UBUvah/BoBT3arXiZL+x7HCjMneJP89BMOjdL+yb
         O2+pAAsh/qmjHhR1R9i01dfMVqx8dkye4bWscLqLATFI5Ytj4FOWhkNuW7sMwEkubbuw
         HFuS69YuKRO071+UP+EVicS7zyLtls1x4GnC8hZ1NnNd/De/MnmFxvenKDSJaB4eDXSt
         Bsycw36EIw+bs+kZuacQrR2sOrc5I/gTYJEgVZ4vOzvrpTDc1aFxwmE9HRAqxzICZ5/5
         oxkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHqFcq33EHU8R/jVQNSJibwl3uOMa8gv4ZH6t9NWEikgt6LjGTUxwAD48o/ZpFCYZnEyHwdvwrACrL5kze/YJSTcEvIiRajOZKvh84MA==
X-Gm-Message-State: AOJu0YzAOUaww7L1+dWxjMm+U3EoDrcYg4xri6yjgZqGlU9a7tbry4u/
	Tv921Rovw+rJdaL7vmWrNGHEmcTyrxpDzFjUGiAeTJHw3oynT8fy
X-Google-Smtp-Source: AGHT+IGg5wJ2qRptsbAUpuTEIcDJSsOM1PIB+jrxgL/A4nsVGf35/xFZrJb8g4txRn38MH5eXDKUqA==
X-Received: by 2002:a2e:b794:0:b0:2d4:6814:7c98 with SMTP id n20-20020a2eb794000000b002d468147c98mr4026696ljo.43.1711361964560;
        Mon, 25 Mar 2024 03:19:24 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id gw8-20020a05600c850800b004146dd6bfe2sm7935583wmb.47.2024.03.25.03.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 03:19:24 -0700 (PDT)
Message-ID: <66014fac.050a0220.92b6d.5b41@mx.google.com>
X-Google-Original-Message-ID: <ZgFPqANkonYB2rla@Ansuel-XPS.>
Date: Mon, 25 Mar 2024 11:19:20 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: limit OTP NVMEM Cell parse to non Nand devices
References: <20240321095522.12755-1-ansuelsmth@gmail.com>
 <20240321113256.7e66ac0f@xps-13>
 <65fc0d2b.050a0220.102ac.24f6@mx.google.com>
 <20240321141935.1b9f6e71@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240321141935.1b9f6e71@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_101930_594740_4A17E857 
X-CRM114-Status: GOOD (  27.00  )
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

On Thu, Mar 21, 2024 at 02:19:35PM +0100, Miquel Raynal wrote:
> Hi,
> 
> ansuelsmth@gmail.com wrote on Thu, 21 Mar 2024 11:34:16 +0100:
> 
> > On Thu, Mar 21, 2024 at 11:32:56AM +0100, Miquel Raynal wrote:
> > > Hi Christian,
> > > 
> > > ansuelsmth@gmail.com wrote on Thu, 21 Mar 2024 10:55:13 +0100:
> > >   
> > > > MTD OTP logic is very fragile and can be problematic with some specific
> > > > kind of devices.
> > > > 
> > > > NVMEM across the years had various iteration on how Cells could be
> > > > declared in DT and MTD OTP probably was left behind and
> > > > add_legacy_fixed_of_cells was enabled without thinking of the consequences.
> > > > 
> > > > That option enables NVMEM to scan the provided of_node and treat each
> > > > child as a NVMEM Cell, this was to support legacy NVMEM implementation
> > > > and don't cause regression.
> > > > 
> > > > This is problematic if we have devices like Nand where the OTP is
> > > > triggered by setting a special mode in the flash. In this context real
> > > > partitions declared in the Nand node are registered as OTP Cells and
> > > > this cause probe fail with -EINVAL error.
> > > > 
> > > > This was never notice due to the fact that till now, no Nand supported
> > > > the OTP feature. With commit e87161321a40 ("mtd: rawnand: macronix: OTP
> > > > access for MX30LFxG18AC") this changed and coincidentally this Nand is
> > > > used on an FritzBox 7530 supported on OpenWrt.
> > > > 
> > > > Alternative and more robust way to declare OTP Cells are already
> > > > prossible by using the fixed-layout node or by declaring a child node
> > > > with the compatible set to "otp-user" or "otp-factory".
> > > > 
> > > > To fix this and limit any regression with other MTD that makes use of
> > > > declaring OTP as direct child of the dev node, disable
> > > > add_legacy_fixed_of_cells if we have a node called nand since it's the
> > > > standard property name to identify Nand devices attached to a Nand
> > > > Controller.  
> > > 
> > > You forgot to update the commit log :-)
> > >  
> > 
> > Ugh... sorry. Ok to resend or I need to wait 24h similar to the rules on
> > net-next?
> > 
> 
> You can go ahead, but I'll only queue it after -rc1 is out.
>

Doing it right now.

-- 
	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
