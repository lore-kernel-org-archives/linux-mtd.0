Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78459C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Dec 2021 21:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J50N7qB/asgJFKSvk3B2Fc5mUP7hmZKN9t2lNKb2rFI=; b=l8A67wSt5EPBPk
	AyOfdcj+uSvBnNgMQWe/myQt4ygxwGeoqM+TZlyB+KsXdEM4+xcGbacGgtQVQTXZJe48Qj928o2Ix
	kkaQZQiL5Elgd/fGvKqh9vLkoJi4BdRiGve59I3NuNU0+QIPZsZfvmb9EiUMzMmqNAOi6+wF4hhW2
	8WXA32u0ddtEiWI2yYeP92F2SbGxYVYuAJPAVBqGw2MVM4zRpXeFL2MER4P9XwD9ByXPZ4FfbaofN
	i62FtPkceDbjgmd0kzGQ/5zYgr9uxaZPC2Vy+XPTBacYUVqeSgpTVcy/NGfawhyO5MQ5RvD/3sHG1
	pmq8hJB2bB1nCCb2sRIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muLe0-005vpP-Mw; Mon, 06 Dec 2021 21:35:33 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muLaR-005uIw-2x
 for linux-mtd@lists.infradead.org; Mon, 06 Dec 2021 21:31:52 +0000
Received: by mail-oi1-f171.google.com with SMTP id m6so23946286oim.2
 for <linux-mtd@lists.infradead.org>; Mon, 06 Dec 2021 13:31:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FCMMUJ0+HiyKmUIwYyAGcz9h/aDXGAPpZdZ0VwD768U=;
 b=XI4/NqrW11TO9XIt+UmaFxS0yFihJ2pSHpKBJ/Pv9zpACb/nV68IDq4S/+ddalVycq
 aGEKcd7kH612KhzLKdbHbVYOGKsVFHyxOp1JVnkz3VVQq293JJ3MmtU92aS7UVkeqzRw
 pJVKTaGts3hMe4NYgVcYc/dmg/+yKC3/Uejvq2KNwou0FB1wCQhbX9AR6RVEuKFQ+P9g
 Ox9NHyJkri/3S5rqxpJ0iwoMMEZhyACbtBOrPq19m2i54zc6e/3wQ8kuGWadY47YcGhi
 opbJzWypLKvlprVGgTfJbz3JM7OIx263XY6akTYvgQ7H8fp0GPR+5wGd8mT9uiWS+6Xe
 rnLA==
X-Gm-Message-State: AOAM5305d5oGhk4o4gq3FAipETxaVsZe3JUxVOa8Kcin0KTvmD5/xU/4
 AXVj5pqGmKd7GaCB3nqkuNsc3a6L4Q==
X-Google-Smtp-Source: ABdhPJwYnhC4hQgC55Mgltgr4tT72tEnDjU8lmBzX2mIzTWoUa3wMrCLM0xJjMjQHnzZUqJ7XRjCIg==
X-Received: by 2002:aca:44c1:: with SMTP id r184mr1245726oia.15.1638826309611; 
 Mon, 06 Dec 2021 13:31:49 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bj8sm3135561oib.51.2021.12.06.13.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 13:31:49 -0800 (PST)
Received: (nullmailer pid 2619775 invoked by uid 1000);
 Mon, 06 Dec 2021 21:31:48 -0000
Date: Mon, 6 Dec 2021 15:31:48 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Pratyush Yadav <p.yadav@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-spi@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Michal Simek <monstr@monstr.eu>,
 Michael Walle <michael@walle.cc>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] spi: dt-bindings: Add an example with two stacked
 flashes
Message-ID: <Ya6BRHLcElZghQRb@robh.at.kernel.org>
References: <20211206095921.33302-1-miquel.raynal@bootlin.com>
 <20211206095921.33302-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211206095921.33302-4-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_133151_166342_8221BC86 
X-CRM114-Status: GOOD (  10.09  )
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

On Mon, 06 Dec 2021 10:59:21 +0100, Miquel Raynal wrote:
> Provide an example of how to describe two flashes in eg. stacked mode.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  Documentation/devicetree/bindings/spi/spi-controller.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
