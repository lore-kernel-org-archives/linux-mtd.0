Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B950C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Dec 2021 23:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6ucGuAa/ksjVeYdTj2KPAH68qE3H71qLQCXGrvlbX0=; b=sirSTPj5UaPLIX
	hm6k13KRtMMpJOz8JAaeBcL1q0FiIo1HlShmQkCNxI+b0B/U0ETpTHp9bNqI39Pi5QVhILM6TknwB
	/dENBT02dl7YJ7EEWyfj1GV+zZwhsukPjJz7nF/txdcXFgnSJoq3SOsR95JIacPYleWxWd/zMGRnN
	whMwfJBOVwM6UEtfnKbJbEq884tbiEQLsaXdy3q4Q7/hcLkCCfuTPwBxHFi5yksve1S+zn/GUxG7X
	C0bIgBOuWSd+nw5giFLIQYs7NzktPt/fYXbzOvi16geaR5igciZ1ycGMjp/ZhmayipDix5qtEHqz1
	xnhNimtcJxwYYM71mvKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msZTY-00AM9Y-NR; Wed, 01 Dec 2021 23:57:24 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msZTV-00AM7j-G2
 for linux-mtd@lists.infradead.org; Wed, 01 Dec 2021 23:57:22 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 v15-20020a9d604f000000b0056cdb373b82so37603896otj.7
 for <linux-mtd@lists.infradead.org>; Wed, 01 Dec 2021 15:57:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GdYKlP0LT1ahpmU3oI3bcKznEMIHXNXlW8Bp4/Ld1E0=;
 b=4lv7mFVT2/qtq4qzA4RJnq2txYLOpjojSCcJMNNwQPIJ6RWYf9t7R4a6ymV4aJ2vA2
 ohrkDwYHLwl/5NatxQuB370/rrTa0lfEVzm1My4wSO3yu3cFtykeDSQ97Ji3cQi+0T0b
 M6Phf+UiXsVzcTywLGuPIw3tOeHOVTEQtomMLdPmcNem1QyVccgg2LPevd096PUXvk2M
 qatVnD9H0Dtm0zZDq2ne9zlt+DaznSNi3zNU8x1dS5b53v0rNGZKLunvGeNuR40FhCy6
 hum8riOe2FwfewL+BdkERZIh5DhbsdONfMlbsbl0Prpa4SV90X51P1jQKglNg26juJAF
 3fEA==
X-Gm-Message-State: AOAM532JD55VXeqV0QpqOo7SUMRCr2RshTaS7RP4GqRsuAOVVrVJOf9y
 5xaECpyHXOTzD78bPq4nvQ==
X-Google-Smtp-Source: ABdhPJwhY5Y9vM8+vyvH88bL0iQ5cXqMc9aDFA0LrcfcMs5twctjw4Ko3C1J0hX0jjaI/4xsm859ZA==
X-Received: by 2002:a9d:77ce:: with SMTP id w14mr8835797otl.252.1638403037263; 
 Wed, 01 Dec 2021 15:57:17 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id o10sm455435oom.32.2021.12.01.15.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 15:57:16 -0800 (PST)
Received: (nullmailer pid 3253597 invoked by uid 1000);
 Wed, 01 Dec 2021 23:57:15 -0000
Date: Wed, 1 Dec 2021 17:57:15 -0600
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-spi@vger.kernel.org, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>,
 Michael Walle <michael@walle.cc>, devicetree@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, linux-mtd@lists.infradead.org,
 Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v2 5/5] spi: dt-bindings: Add an example with two stacked
 flashes
Message-ID: <YagL29VKiKZcu7KQ@robh.at.kernel.org>
References: <20211126163450.394861-1-miquel.raynal@bootlin.com>
 <20211126163450.394861-6-miquel.raynal@bootlin.com>
 <1638054802.100671.1973542.nullmailer@robh.at.kernel.org>
 <YaO0ahOhM3XwLqND@robh.at.kernel.org>
 <20211129102319.1efe1841@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211129102319.1efe1841@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_155721_561007_BCD937F5 
X-CRM114-Status: GOOD (  20.40  )
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

On Mon, Nov 29, 2021 at 10:23:19AM +0100, Miquel Raynal wrote:
> Hi Rob,
> 
> robh@kernel.org wrote on Sun, 28 Nov 2021 10:55:06 -0600:
> 
> > On Sat, Nov 27, 2021 at 04:13:22PM -0700, Rob Herring wrote:
> > > On Fri, 26 Nov 2021 17:34:50 +0100, Miquel Raynal wrote:  
> > > > Provide an example of how to describe two flashes in eg. stacked mode.
> > > > 
> > > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/spi/spi-controller.yaml | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >   
> > > 
> > > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > > 
> > > yamllint warnings/errors:
> > > 
> > > dtschema/dtc warnings/errors:
> > > Documentation/devicetree/bindings/spi/spi-controller.example.dts:40.23-45.15: Warning (spi_bus_reg): /example-0/spi@80010000/flash@2,3: SPI bus unit address format error, expected "2"  
> > 
> > Unit-addresses are based on the first reg entry.
> 
> Yes, I believe this error is expected since dtc has not been yet
> updated. Below the patch for adapting dtc to this new situation and
> keep the robots happy.
> 
> How should we proceed?

No, I'm saying you have this wrong. A unit-address is composed of 
different fields, not different entries of the same field. For 
example, an external parallel bus has a chip select plus address, so the 
unit-address is '<cs>,<addr>'. If you have 2 SPI chip selects, that's 2 
entries of the same thing. The SPI bus is not 2 address cells, but 1 
cell with 2 entries.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
