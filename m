Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B36C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Dec 2021 21:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rFODUXkKoi1uao0tLaCG0Z4NbGaHLULicsC3y4e7Y9o=; b=3xPT0ayaNFs4tR
	LjeM50PjVD8FPwBEY+eCfDmj5POo7o+XI4Tm0mAabAon79EMuaokvK67RPEOXKWbF29P/LWxLmGYT
	CzfiWqpeT50ZoQtQosm41NK/7MJyj6MK1fWEzK9CurQdPUmkrUmzms9ti/dXWMRs+dQJdyfJgn3sw
	1FH61IedM0kQfhO1HXA04N+1SMsPABJRKiBmHVITSx3nYgDEjZcPYszrPRD14xfM38FrbpERnDDok
	LC7PFvZuvMO+F99QSnZ2GV7fVWiCcuhxZenWcF93ik6MC8tV4VaqbpZpzCF4CMhzHLfIgPStKjJA7
	nFlAhoB7Mfyixx5BfwdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muLc5-005v21-5p; Mon, 06 Dec 2021 21:33:33 +0000
Received: from mail-oo1-f46.google.com ([209.85.161.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muLaC-005uAm-Q6
 for linux-mtd@lists.infradead.org; Mon, 06 Dec 2021 21:31:38 +0000
Received: by mail-oo1-f46.google.com with SMTP id
 w5-20020a4a2745000000b002c2649b8d5fso4766872oow.10
 for <linux-mtd@lists.infradead.org>; Mon, 06 Dec 2021 13:31:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zGVMocxzrwSJvpkLOikrjLjUvyP1cbBTRtuBKh0+UVo=;
 b=KUDr1n6EEMoZ0X2luoXfwlfdqqbOA1Zr8PRMTxtK9ZHN3uZTVzZ9G2db4V8pCd+wI+
 ZgymoIljTodJIJqNrDfck6klwsHjJLX8+2MR9qY9jdk/JdyOpvyFZI/JDjjAVEXfxmaP
 xPFi1/koZmtphKco9AcA2dHIbIkqpeS+fPswLW7IucvDsq9vKqUiZGWmbwHeVYjlZdcW
 0rE7nwbyURz3Jm97VH+b0oRuYe1oIg7HH9qZv8ZXpLYHsCP/7vbJE+USBt1m10Gvurye
 TI+Lp6BR41rWSB6RA6Cxs1H6kqk9E1sSkJz0Qbo5hLOIXcX0+3pHCV/VkdkI0HRlnC5S
 UBiA==
X-Gm-Message-State: AOAM530hgzKWPnkLbLh6wp8QwAsOQI3l0M42I31kG+gI5MAOBIXwAL/d
 P1JN4ZFEszj6zpoyZH1W+A==
X-Google-Smtp-Source: ABdhPJyKYQSIcGqPHmeo2t8IF2UE+YqzQpYLD8znNuCAHu6fH6Goz2Df3ODuTf5jffRIALOa3oXogQ==
X-Received: by 2002:a4a:96f1:: with SMTP id t46mr23892589ooi.53.1638826294284; 
 Mon, 06 Dec 2021 13:31:34 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id i16sm2865342oig.15.2021.12.06.13.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 13:31:33 -0800 (PST)
Received: (nullmailer pid 2619328 invoked by uid 1000);
 Mon, 06 Dec 2021 21:31:32 -0000
Date: Mon, 6 Dec 2021 15:31:32 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>
Subject: Re: [PATCH v3 0/3] Stacked/parallel memories bindings
Message-ID: <Ya6BNGHhflkXOItV@robh.at.kernel.org>
References: <20211206095921.33302-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206095921.33302-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_133136_883276_9F56EA06 
X-CRM114-Status: GOOD (  10.73  )
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

On Mon, Dec 06, 2021 at 10:59:18AM +0100, Miquel Raynal wrote:
> Hello Rob, Mark, Tudor & Pratyush,
> 
> Here is a third versions for these bindings, which applies on top of
> Pratyush's work:
> https://lore.kernel.org/all/20211109181911.2251-1-p.yadav@ti.com/

Mark, can you either provide a stable branch with this or apply the 
series? Note that there's going to be some other patches needing 
spi-peripheral-props.yaml, so providing a branch might be better if you 
don't want to collect the patches.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
