Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BC6C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Feb 2022 10:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gQ+NVI6W4EbZOXD+P28ndogI9XxsDr+7JpoXuImkzvc=; b=1jtFDVLBXrKkM1
	Ow88Xw7gl4+nBcC0IsUjPDGCJVJq3Tv1Lrj3AwnJPbFqgED+Sq02YnGHTAa2Bvaorriukk5dLWyut
	JtVY2Kjyo7YRPvmmhjs1BEF5B/QLUCnjBhTlfeDm3zoN4TC1RkE1buKPx2ijAdBR2zhqYXn7SQFWZ
	+cS7hPDVimT60p2S70PGVFmNchHXPuu7AcWxYdwk2iUcxBNlRp7n/Cfx135piKRwAg/Ve8LeJmGP7
	8yaA4VU1cmF6vsIGe/jAN8TnQBho8rGz/yK7mU+P5UJbq8pkn8ED1WYKTaOKPSPYNMG+/M6PQm6XJ
	Q5S9pzAwjAAn4zmH+OOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEqhL-00BmAJ-1z; Tue, 01 Feb 2022 10:47:43 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEqhH-00Bm9N-5F
 for linux-mtd@lists.infradead.org; Tue, 01 Feb 2022 10:47:41 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 211AlUrU118559;
 Tue, 1 Feb 2022 04:47:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1643712450;
 bh=pGKyHfWX15eh3qo2QXJ8np7UoCYvaSlxF+7QvjQhaQE=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=hVVcvR9kgztinH1mrkm+VoL1HfIBLNNXiuv2qoH11LD5P+DklIIXVcJy4CWomO1Jq
 UPwNPvZkjXJeOPu/FVts8NC3csau92OcVl/i8P6Xe+aOiVSDgUi4VmJZoIZpfh0jbI
 qMeKUuYESTDIjkP6NQ2p3F30m0Tkgoyry9MHS8LA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 211AlUIk046516
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 1 Feb 2022 04:47:30 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 1
 Feb 2022 04:47:28 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 1 Feb 2022 04:47:28 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 211AlRLd017809;
 Tue, 1 Feb 2022 04:47:28 -0600
Date: Tue, 1 Feb 2022 16:17:27 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Christophe Kerello <christophe.kerello@foss.st.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <robh+dt@kernel.org>,
 <srinivas.kandagatla@linaro.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <devicetree@vger.kernel.org>, <chenshumin86@sina.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 4/4] mtd: core: Fix a conflict between MTD and NVMEM
 on wp-gpios property
Message-ID: <20220201104727.7xvcyexf3yucegcb@ti.com>
References: <20220131095755.8981-1-christophe.kerello@foss.st.com>
 <20220131095755.8981-5-christophe.kerello@foss.st.com>
 <20220131144309.0ffe7cc8@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220131144309.0ffe7cc8@xps13>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_024739_353281_3D1CDFC9 
X-CRM114-Status: GOOD (  30.82  )
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

On 31/01/22 02:43PM, Miquel Raynal wrote:
> Hi Vignesh, Tudory, Pratyush,
> 
> + Tudor and Pratyush
> 
> christophe.kerello@foss.st.com wrote on Mon, 31 Jan 2022 10:57:55 +0100:
> 
> > Wp-gpios property can be used on NVMEM nodes and the same property can
> > be also used on MTD NAND nodes. In case of the wp-gpios property is
> > defined at NAND level node, the GPIO management is done at NAND driver
> > level. Write protect is disabled when the driver is probed or resumed
> > and is enabled when the driver is released or suspended.
> > 
> > When no partitions are defined in the NAND DT node, then the NAND DT node
> > will be passed to NVMEM framework. If wp-gpios property is defined in
> > this node, the GPIO resource is taken twice and the NAND controller
> > driver fails to probe.
> > 
> > A new Boolean flag named skip_wp_gpio has been added in nvmem_config.
> > In case skip_wp_gpio is set, it means that the GPIO is handled by the
> > provider. Lets set this flag in MTD layer to avoid the conflict on
> > wp_gpios property.
> > 
> > Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> > ---
> >  drivers/mtd/mtdcore.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> > index 70f492dce158..e6d251594def 100644
> > --- a/drivers/mtd/mtdcore.c
> > +++ b/drivers/mtd/mtdcore.c
> > @@ -546,6 +546,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
> >  	config.stride = 1;
> >  	config.read_only = true;
> >  	config.root_only = true;
> > +	config.skip_wp_gpio = true;
> >  	config.no_of_node = !of_device_is_compatible(node, "nvmem-cells");
> >  	config.priv = mtd;
> >  
> > @@ -833,6 +834,7 @@ static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
> >  	config.owner = THIS_MODULE;
> >  	config.type = NVMEM_TYPE_OTP;
> >  	config.root_only = true;
> > +	config.skip_wp_gpio = true;
> >  	config.reg_read = reg_read;
> >  	config.size = size;
> >  	config.of_node = np;
> 
> TLDR: There is a conflict between MTD and NVMEM, who should handle the
> WP pin when there is one? At least for raw NAND devices, I don't want
> the NVMEM core to handle the wp pin. So we've introduced this
> skip_wp_gpio nvmem config option. But there are two places where this
> boolean can be set and one of these is for otp regions (see above). In
> this case, I don't know if it is safe or if CFI/SPI-NOR rely on the
> nvmem protection. Please tell us if you think this is fine for you.

Why does NVMEM touch hardware write protection in the first place? The 
purpose of the framework is to provide a way to retrieve config stored 
in memory. It has no business dealing with details of the chip like the 
WP line. That should be MTD's job (which it should delegate to SPI NOR, 
SPI NAND, etc.). If you want to write protect a cell then do it in 
software. I don't see why NVMEM should be dealing with hardware directly 
at all.

That is my mental model of how things _should_ work. I have not spent 
much time digging into how things actually work currently.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
