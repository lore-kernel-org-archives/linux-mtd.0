Return-Path: <SRS0=I4i7=4T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B86CBC3F2D2
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 09:54:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E75C21D56
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 09:54:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fAD1jE+p";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="n8wx694Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E75C21D56
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v/scysEbg6qw2IZJ3xbsYeYAMUH+CS+Q7Hw+6uiuAZw=; b=fAD1jE+ppq5Zim
	JzyMiG5Fu1kPKJlNHhGGGYG8N0ieaGm/3klrhRphgIZlfGswv7M6VhuaQo7i+MrjUNgD8CD3Wqvq3
	K5V0Ecsct5o/MY5+2CvqhSdR6wZF++Xfry7H4tC8Tx3Izr1DzJRgYvZbIHOJq2jIkxaABkGuFK294
	UUSCRsJEds6jLhSyTh3USJsLfTdiAx88eF3YcCoL5Sct914VsDhHueFV6Q65tP8jrgjfzn1eBQz6R
	EhuU5qTiVXzyOLQgr8Is3xuGM/cERUNeNfAaHaAxt+ji7zqZq+GR8ONHRQ9vZENu0aki3adwHvYMW
	shH/IzLO3AFGB5PZSmVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8hly-0001vk-EF; Mon, 02 Mar 2020 09:54:02 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8hlv-0001vI-Gz
 for linux-mtd@lists.infradead.org; Mon, 02 Mar 2020 09:54:00 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0229rlXE038637;
 Mon, 2 Mar 2020 03:53:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1583142827;
 bh=MaPO+Y+GFt8NojyCTT0VA83fEm+Nn1m3L1ToA+6WYhk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=n8wx694Zu850t8rho+LltUhbikx5WUkA5L6N7d1S0Uxo+N7tAk8V8nj0E6CsXohLq
 V0yjLlqMWSuyTlFVIkSZM5CTsb/W7QhWErbHvvYfpoHA9QJCi4pXF5uPoVfTviXUle
 Sw3XNYzuziw8iYcrh0aXMLK5Yy4mY7Rh06njFALE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0229rkWa040407
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 2 Mar 2020 03:53:47 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 2 Mar
 2020 03:53:46 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 2 Mar 2020 03:53:46 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0229rjSg028864;
 Mon, 2 Mar 2020 03:53:46 -0600
Date: Mon, 2 Mar 2020 15:23:45 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 01/11] dt-bindings: spi: allow expressing DTR capability
Message-ID: <20200302095343.3yec6inur52vx6bg@ti.com>
References: <20200226093703.19765-1-p.yadav@ti.com>
 <20200226093703.19765-2-p.yadav@ti.com>
 <20200227171147.32cc6fcf@collabora.com>
 <20200227162842.GE4062@sirena.org.uk>
 <CAMuHMdWMCDzQm0tjpybJZyHy4imbC9NqRXP5d4C0xgxQx-Pf8g@mail.gmail.com>
 <20200227164425.GF4062@sirena.org.uk>
 <CAMuHMdV_1RfGFgDjJYzAnGd_x57zSwjZd8si=UTPp8ksgdwYGA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdV_1RfGFgDjJYzAnGd_x57zSwjZd8si=UTPp8ksgdwYGA@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_015359_645305_3532F5B5 
X-CRM114-Status: GOOD (  14.91  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Sekhar Nori <nsekhar@ti.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-spi <linux-spi@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 27/02/20 06:03PM, Geert Uytterhoeven wrote:
> Hi Mark,
> 
> On Thu, Feb 27, 2020 at 5:44 PM Mark Brown <broonie@kernel.org> wrote:
> > On Thu, Feb 27, 2020 at 05:40:31PM +0100, Geert Uytterhoeven wrote:
> > > On Thu, Feb 27, 2020 at 5:28 PM Mark Brown <broonie@kernel.org> wrote:
> > > > It's what we do for other properties, and if this is anything like the
> > > > other things adding extra wiring you can't assume that the ability to
> > > > use the feature for TX implies RX.
> >
> > > Double Transfer Rate uses the same wire.
> >
> > But is it still on either the TX or RX signals?
> 
> E.g. good old Spansion S25FL512S supports single/dual/quad DDR, but
> apparently only for read, not write.
> Other FLASHes may support both directions. I guess.

The flash datasheet says under section 9.4 (Read Memory Array Commands):

  Some commands transfer address and data on both the rising edge and 
  falling edge of SCK. These are called Double Data Rate (DDR) commands.

Since the address is transferred in DDR mode, both Tx and Rx signals use 
DDR.

So, unless we have a flash that supports a mode like 1S-1S-8D, we don't 
really need two properties.

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
