Return-Path: <SRS0=CeWw=7D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9697CC433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 May 2020 09:15:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 633DF207D3
	for <linux-mtd@archiver.kernel.org>; Thu, 21 May 2020 09:15:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TEHy5gjM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MaaiESZ6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 633DF207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V8PM4JQYVs6jgkvTXq4sdbvFnegQgfK7CKMXi3X+1ko=; b=TEHy5gjM9K8AvE
	nwU6GoidzNC0cVqNg/V0s24R5+IxNfp8mWEXWzfunwk4pK9s4GCgdimNjjMahkaNh3Y0rkyiZABWj
	ElRtc+WYSiC/0FEZcVxJZBviuz+iRcu6Od1sxGMSG/B03xvHGXGoGlmEO2QRMC5Tbvf6z7N3DI9T+
	NkNC8exChLtHQTIRqjX3WweeaLq9RUAkMaMWv/VMC2nNL0qX2yocLfTMzgKUCF2VZOsLvA/ZN16GF
	0mhiHJa5xH6Daj1TdYqoZV+qQ3zL5/QmAKMkAvcMbUP+vUNdk5m7nTR0v3IgRl6Tb9JwAz5m32EPL
	WlvqIRQZXegvPWYhl5Mw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbhIL-0002GI-MC; Thu, 21 May 2020 09:15:17 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbhHu-00084Z-CH; Thu, 21 May 2020 09:14:51 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04L9EdMR013665;
 Thu, 21 May 2020 04:14:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1590052479;
 bh=6TWapEuxg8nAckEhBpE445YKmDj0TJ/xlqg6Fj94UN0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=MaaiESZ6aMqcrpmJHO1mfIi6xcBPy89FLOWsTC7LaSKeRbpKblQVGffGtUkHPmsGz
 KtTJ6G2zE9wgGcvBYU37tyagCvHpizRCMMgOcroPyoWwWwrT8AucyU/I2e2Pw/IwO9
 c3yoOkpPkfW2mWbh18+Ej1+oCaJOw0jBQh2uczPA=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04L9EdvO010693
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 21 May 2020 04:14:39 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 21
 May 2020 04:14:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 21 May 2020 04:14:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04L9EcT0062434;
 Thu, 21 May 2020 04:14:39 -0500
Date: Thu, 21 May 2020 14:44:36 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v5 09/19] mtd: spi-nor: sfdp: parse xSPI Profile 1.0 table
Message-ID: <20200521091434.rigqlyuwszyyikj4@ti.com>
References: <20200519142642.24131-1-p.yadav@ti.com>
 <20200519142642.24131-10-p.yadav@ti.com>
 <OF83616464.480FA751-ON4825856E.002A4483-4825856E.002BE6AF@mxic.com.tw>
 <20200520085534.yra4f5ww5xs23c4j@ti.com>
 <OF98344913.4BF4C313-ON4825856E.0032A810-4825856E.00352141@mxic.com.tw>
 <20200520103728.jtbslowdfrv3o5yz@ti.com>
 <OFF5A6BA99.395182B5-ON4825856F.002B2F98-4825856F.002CD973@mxic.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OFF5A6BA99.395182B5-ON4825856F.002B2F98-4825856F.002CD973@mxic.com.tw>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_021450_517525_5FDE6658 
X-CRM114-Status: GOOD (  22.65  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, juliensu@mxic.com.tw,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Sekhar Nori <nsekhar@ti.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mediatek@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 21/05/20 04:09PM, masonccyang@mxic.com.tw wrote:
> 
> Hi Pratyush, 
> 
> > > > > > +   /* Get 8D-8D-8D fast read opcode and dummy cycles. */
> > > > > > +   opcode = FIELD_GET(PROFILE1_DWORD1_RD_FAST_CMD, table[0]);
> > > > > > +
> > > > > > +   /*
> > > > > > +    * Update the fast read settings. We set the default dummy 
> > > cycles to 
> > > > > 20
> > > > > > +    * here. Flashes can change this value if they need to when 
> > > enabling
> > > > > > +    * octal mode.
> > > > > > +    */
> > > > > > + 
> spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
> > > > > > +              0, 20, opcode,
> > > > > > +              SNOR_PROTO_8_8_8_DTR);
> > > > > > +
> > > > > 
> > > > > 
> > > > > I thought we have a agreement that only do parse here, no other 
> read 
> > > > > parameters setting.
> > > > 
> > > > Yes, and I considered it. But it didn't make much sense to me to 
> > > > introduce an extra member in struct spi_nor just to make this call 
> in 
> > > > some other function later.
> > > > 
> > > > Why exactly do you think doing this here is bad? The way I see it, 
> we 
> > > > avoid carrying around an extra member in spi_nor and this also 
> allows 
> > > > flashes to change the read settings easily in a post-sfdp hook. The 
> > > > 4bait parsing function does something similar.
> > > 
> > > I think it's not a question for good or bad. 
> > > 
> > > 4bait parsing function parse the 4-Byte Address Instruction Table
> > > and set up read/pp parameters there for sure.
> > > 
> > > Here we give the function name spi_nor_parse_profile1() but also 
> > 
> > But the function that parses 4bait table is also called 
> > spi_nor_parse_4bait(). 
> > 
> > > do others setting that has nothing to do with it, 
> > 
> > Why has setting read opcode and dummy cycles got nothing to do with it? 
> > The purpose of the Profile 1.0 table is to tell us the Read Fast 
> > command and dummy cycles, among other things. I think it _does_ have 
> > something to do with it.
> 
> As you know I mean this function just do parse parameter of profile 1 
> table
> and keep these value data for later usage.
> 
> A device supports xSPI profile table could work in either 8S-8S-8S or 
> 8D-8D-8D mode.
> It seems to setup these parameters somewhere out here is betters.

As far as I know, the Profile 1.0 table only describes 8D-8D-8D mode. I 
see no mention of 8S-8S-8S in JESD251 or JESD216D.01. No field in the 
table describes anything related to 8S. In fact, searching for "8S" in 
the JESD251 spec yields 0 results. 

Anyway, you should set up 8S parameters in SNOR_CMD_READ_8_8_8, not 
SNOR_CMD_READ_8_8_8_DTR. 8D configuration is independent of 8S 
configuration.

PS: If you have any more comments, please send them now. The merge 
window is getting close, and I'd like to see this make it in.

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
