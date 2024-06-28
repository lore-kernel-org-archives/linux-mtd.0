Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9269C2BD09
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2024 17:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNOxN7YL4ZgAh0Dt1i1pS7oW8I/nnV3Xqmxbw7Vz/vc=; b=CMsYn33+R5qPQF
	2TpHXx/WUVKbL+5NqFFwhroD/P26lHyXAqbTr/W25uTXc65oW5DDoefcj1t893ewh9aQwX2ZGiOwb
	SvUmCZnzzJEYIZyR3xy+O7t9GptuWJRB2f3izVP4XUSpA6PqCFva9fwE3fJq7O+Y3TqXcUQoDrIIO
	ulolC6PocWgFuNnCq0kZmSRpn9hxX3cj/6elrSe1Tt/apFwfT3frzrZEVOOoJYCskvcaZAlJhuOrA
	Hth0l/zw8LYL0hpHhZdPqqwKYzgi/Cg0tvwC7V3j1ngKS36bVolxlZu+r7bNEuV8FLd4ko8jVDlSK
	WTdslJtOE5FQkor1gIDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNFEw-0000000ETpI-0WC1;
	Fri, 28 Jun 2024 17:18:26 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNFEs-0000000ETnj-35KL
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jun 2024 17:18:24 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a725ea1a385so105006166b.3
        for <linux-mtd@lists.infradead.org>; Fri, 28 Jun 2024 10:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719595100; x=1720199900; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o3nvsIkFRTprl2veHnwGjNIAA2Gwnu2oo8W5vdGeBr8=;
        b=jV2/vlEflqClamFbrHKkc2otVgcnpn7MaysZFymiXn3zhB4aS+6l6r6H5shPrj/0u/
         7K630cVUuu+tVLXbOJDBD7vKxCm8d58XB/MKgXlmp6ifnu0Ox/pcEv+/yKKORDSsGe2k
         RHa8RDpNEKSMCb52G6Da44RCVE6kPDiVsb9TBtGI5J4xrmvs8F1ienOQ0vPhXV5oV7No
         rapIebOcjH+Ne8S9VhsKk7J/5md1GNBle84gKvX2u6yp3boc1eYOpoyjQvLfUONQqJn+
         Ad72mhV3VVzieUrDl2QOXgZZyJUDJYHhEATUNJksA4Xnr3iqZoUYph7stGccOY4mnD32
         FnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719595100; x=1720199900;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o3nvsIkFRTprl2veHnwGjNIAA2Gwnu2oo8W5vdGeBr8=;
        b=rv3PucaNo/cqrtCmPGEnwq7X9PgHFvaFjMSLhnPPSX8yS84CravNtErlfYLaWj9daW
         /OU57oOlLljvz1SVwmU6kO1osPo57boR2d5JKZpTKVWjFPwRuPZhWuEbvaEhGvGfcqJy
         fk9qx/gBxr76X9iRSCGHLdtCPDpYZSTy+tWDg19feCfEMCJ5iPMQFX63VEuwA/r9EkJy
         wrb57MRcHRkc2tFkmUJFv8EwcOKqelmbOvJZ0Yv97Pg6ybG5+6fW37WJx40k0jqk/+MF
         PfoCi84Bb8iItPBqVhK8RNa0tOIYfdz0PjibzGCoMtN0ag73oTTjUqZDs0xTgDtGdwrT
         cvdA==
X-Forwarded-Encrypted: i=1; AJvYcCWgfSZFS1HTuht/aYk5zm13CfYrxQWnnLT8RbRzgRA90FZr5hHSbH7dGGF4TKXUs6nyogsF/pdsCjkXNBa/9WrAtBUSHfSM6gFwC7GNhg==
X-Gm-Message-State: AOJu0YyCrR/gJikoTJl/3oMqIBO/QdcaQLOJYJPXo1bSWngyUB48Gj+j
	b/uyaiGMML3zgwlG+54OiSZWDiXddMq0brjQ44tR+TFb9on+501rU6hOR7vsb9zKc0IYwKl6cDw
	9e8vYRClijxBaNPzdsDtf9JTO8w==
X-Google-Smtp-Source: AGHT+IFTZVskAjk2l5yWcH1+gZhoO6yQpm6ONFChSoLYbpKIhZVBVjX6P7gzsYaRUL4jBvTsbM8BFPkV4wxIIQ+MkWQ=
X-Received: by 2002:a17:907:c78e:b0:a6f:bc02:a008 with SMTP id
 a640c23a62f3a-a7242c4de49mr1349695666b.4.1719595100397; Fri, 28 Jun 2024
 10:18:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240628140328.279792-1-erezgeva@nwtime.org> <20240628140328.279792-4-erezgeva@nwtime.org>
 <20240628-refuse-actress-b76985aa020c@spud> <D2BS0YMA48BG.1PEPFC3KMFV8N@kernel.org>
 <CANeKEMMrXK=mw=n=9DuTnprkTs3ct446oaC2QTJyst8Nd+D6rw@mail.gmail.com> <D2BT0DT9UQ66.2L497FSY7GMAL@kernel.org>
In-Reply-To: <D2BT0DT9UQ66.2L497FSY7GMAL@kernel.org>
From: Erez <erezgeva2@gmail.com>
Date: Fri, 28 Jun 2024 19:17:42 +0200
Message-ID: <CANeKEMO9hBhBs91nZkZRht9J29iRC2Tgf6ucWq=nbO7XAqzzng@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: mtd: macronix,mx25l12833f: add SPI-NOR chip
To: Michael Walle <mwalle@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Erez Geva <erezgeva@nwtime.org>, linux-mtd@lists.infradead.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_101822_795891_AE481A41 
X-CRM114-Status: GOOD (  18.39  )
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

On Fri, 28 Jun 2024 at 18:51, Michael Walle <mwalle@kernel.org> wrote:
>
> On Fri Jun 28, 2024 at 6:30 PM CEST, Erez wrote:
> > I do not know why they decided to use the same JEDEC ID for two chips.
> > Your guess is as good as mine.
>
> That's a common pattern and we try hard to figure that out during
> probe time instead of hardcoding it. E.g. by looking at the SFDP
> data. Have a look at various fixups in drivers/mtd/spi-nor/.

That's a good approach.
The obsolete mx25l12805d does not support the SFDP table.
The new mx25l12833f does.

What is the kernel policy regarding obsolete flash chips?
Macronix annonce on end of life of mx25l12805d in 2010.
Perhaps we should remove mx25l12805d,
 and leave the mx25l12833f configuration in mtd/spi-nor/macronix.c?

>
> compatibles are really the last resort to distinguish flash devices.

I totally agree. Use JEDEC ID a lot better.
In this case Macronix decided to reuse an obsolete chip ID.

>
> Next time, please mention such information in the commit message,
> please.

Thanks for the tip.
I did write it in the fourth patch, but I can add it in part 3 as well.

> Also please have a look at
> https://docs.kernel.org/driver-api/mtd/spi-nor.html

The new mx25l12833f supports SFDP, the obsolete mx25l12805d does not.
I did manage to read the SFDP, though I do not have a copy of it (I do
not have the hardware any more).
To my best knowledge SFDP table do not contain information on OTP,

Thanks
  Erez Geva

>
> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
