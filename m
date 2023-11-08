Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68581C4167D
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 19:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Dv3Z2hVrdRPrw4pwDEu8uAB60I7I2qPjffx+SWxYAU=; b=r0+c3CyZI0w0vq
	s9NezwNUKhu07x90DpFJ3HsxCcyRdB9+8iOwlBpvtPlrxfRNixl0eY/+W/9/UwmVUuxliAiGJnndd
	eSABTHsFD5WE+LbYJtyeWUFtvJXuVXTUB4J4P/q+/eKLDy6eZqkLRzwIWOsj2ir2ZfHak5WLS2MDc
	0LIVHsE/Nrrm66xV4uI8vtM9ZA2OvBk/81FqDWwcSmheK5rKN5ST3MPoqBwdcxVuxGYLpNQTBETiv
	LdhlhwLgqPr+yGWP9Ux3z3irSoEpg3y7rIcBFNo167R+MYps2aoM9eQED/2k3GRLMddTlxKT/N/Ge
	X4DPqP1VpYHBVvQNv5RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0nxd-004aag-16;
	Wed, 08 Nov 2023 19:11:33 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0nxZ-004aZ0-1P;
	Wed, 08 Nov 2023 19:11:30 +0000
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6cf65093780so4435419a34.0;
        Wed, 08 Nov 2023 11:11:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699470687; x=1700075487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1u7VYnOagIS9pU6lT0JPQUPsCHt998/w+J9rxTrBSoA=;
        b=uLgy1dNJZquqkj8eiBhN0g+PGWGZgOqU3LAcXC8d3zOBqJJuTNvs4itn83zATr3KBb
         RGrfrWnblWfQsr2RjfIMwOXOra4yUMhQfSqfOpqbYkihgcgVeBOz6V42Y6AKtMKMVqZT
         if3gQoCFfSkbO/zT5ni3r6IdSiFULZof1tm/f3mctxei1cwwgX8lsSFfEQqWSQ5o0lwF
         SK1I2dq1nQXiOSX3sR0BcKq1yApYM2v1sGFWUcD+RIniYDKytavZv1JsxbzZqwEdrPZ3
         w9QXfh+Y/2M6SQNdJh++uD1/ghN9yB6px5whiv6vB8UBtnqeJcw5ItIQBJ0PlClCz/aU
         QgXw==
X-Gm-Message-State: AOJu0Yyzv3Zc31r6Bukss09yBLKzxz68P72tJYV7MVlowCEpH7Uhighx
	QmtODtG4WvX5gcyx8MddTQ==
X-Google-Smtp-Source: AGHT+IEQxcoP2w100Rf4cT1thURGIfqiKk7j/H0pCBg1+7YdEio2W+/30kOdWF9bH2ez152xfdG2Sg==
X-Received: by 2002:a05:6830:1bc6:b0:6c4:c3ac:a9dc with SMTP id v6-20020a0568301bc600b006c4c3aca9dcmr3256504ota.21.1699470687064;
        Wed, 08 Nov 2023 11:11:27 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id az5-20020a056830458500b006c4727812fdsm1983578otb.15.2023.11.08.11.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 11:11:26 -0800 (PST)
Received: (nullmailer pid 2771930 invoked by uid 1000);
	Wed, 08 Nov 2023 19:11:25 -0000
Date: Wed, 8 Nov 2023 13:11:25 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Ben Dooks <ben.dooks@codethink.co.uk>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-mips@vger.kernel.org, Howard Harte <hharte@magicandroidapps.com>
Subject: Re: [PATCH 2/6] dt-bindings: mtd: Rewrite gpio-control-nand in schema
Message-ID: <20231108191125.GA2754195-robh@kernel.org>
References: <20231108-fix-mips-nand-v1-0-5fc5586d04de@linaro.org>
 <20231108-fix-mips-nand-v1-2-5fc5586d04de@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231108-fix-mips-nand-v1-2-5fc5586d04de@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_111129_470710_D84D5D51 
X-CRM114-Status: GOOD (  10.23  )
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

On Wed, Nov 08, 2023 at 03:33:50PM +0100, Linus Walleij wrote:
> This creates a schema for GPIO controlled NAND. The txt
> schema was old and wrong.
> 
> Mark the old way of passing GPIOs in a long array as
> deprecated and encourage per-pin GPIO assignments with
> the named nnn-gpios phandles.

We have 1 user upstream with only a single commit adding it in 2017. 
This doesn't seem like something that's going to gain new users either. 
Is it really worth modernizing this binding? 

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
