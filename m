Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2364CC2D0F8
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 18:47:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC8B820673
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 18:47:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TtCfy7ad";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GTrAAg1h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC8B820673
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kE7Kf6Kvq/nnSDpztuBviFqvucclU75tCFiBKm2mN2g=; b=TtCfy7adskNRE3
	LaEfN47UFPpA47SUp+UhtwXiwNMxnJo+QauWp6JrGS5UX+wn9k7Y2T7bajoA6PE0BlA+Z+eD3yIWD
	RFwHEcK66lNvvsMLa2+vujujb9GAg5lW10goaxLoDiT1rwGFDWYiOExvj2VipDojVr/LahQ4xSoh4
	7k8W5O38joIw0BE4dXx10wHqcRib+5qOQqTPB6FWoNR98gPepu8EliLQ/tvQ898Kregs7Jnrj1S6Y
	ZLpgVyaI4P466NQQdGKF76fSAgqAXygDCkxW8fGdfu6Jf27ryqLNPY+MqUmtqytf9wPIN9LlSllW2
	Otmw6VtcUHr2FhD00M4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYZw4-0004d3-PL; Tue, 12 May 2020 18:47:24 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYZvq-0004RI-D7; Tue, 12 May 2020 18:47:12 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04CIl0aH042905;
 Tue, 12 May 2020 13:47:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1589309220;
 bh=gdpZbVGnmu82Ltylj7zMGAjghfqs8C0XbDqrJcvjIUw=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=GTrAAg1hJh7itOcW4SLu7lNpvXjddphXZysRjzEGFdlWjJXVRzwSncAD1hGESqoOq
 Yqx1WqS6Om6TRq4h94nigWX4VYc7/sUadEfEmgQ1OEUYxPV/nkFZurLYx+A6PIN0DO
 aB9Jjte/G2GkHBhyp1KqKrwyEGu8J6jJxMvMBxdg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04CIl0WC011391
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 12 May 2020 13:47:00 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 12
 May 2020 13:47:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 12 May 2020 13:47:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04CIkxg4112061;
 Tue, 12 May 2020 13:46:59 -0500
Date: Wed, 13 May 2020 00:16:58 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v4 00/16] mtd: spi-nor: add xSPI Octal DTR support
Message-ID: <20200512184656.ksudjyeqbwv6jze6@ti.com>
References: <20200424184410.8578-1-p.yadav@ti.com>
 <144878625.o7txgtY6sz@192.168.0.120>
 <49abc8f3-5bb5-bc6d-b2ec-f14b115c58dc@ti.com>
 <2352513.UHBGRE98Z5@192.168.0.120>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2352513.UHBGRE98Z5@192.168.0.120>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_114710_567965_85999352 
X-CRM114-Status: GOOD (  18.40  )
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
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com, richard@nod.at,
 broonie@kernel.org, nsekhar@ti.com, linux-kernel@vger.kernel.org,
 Nicolas.Ferre@microchip.com, Ludovic.Desroches@microchip.com,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 12/05/20 11:29AM, Tudor.Ambarus@microchip.com wrote:
> Hi, Vignesh,
> 
> > > The software reset procedure can't protect you from unexpected 
> > > resets, but
> > > the hardware with its optional reset pin can. Pratyush to confirm.
> > > 
> > > cut
> > > 
> > >>> Not recovering from unexpected resets is unacceptable. One should always
> > >>> prefer option 1/ and condition the entering in 2-2-2, 4-4-4 and 8-8-8
> > >>> with
> > >>> the presence of the optional RESET pin.
> > >> 
> > >> Totally agree with you on that one, but we know what happens in
> > >> practice...
> > > 
> > > What I proposed is to condition the entering in the state-full modes with
> > > the presence of the optional RESET pin. We would introduce an optional
> > > device tree property for the RESET pin. If hardware doesn't implement the
> > > optional RESET# signal, then we will not enter in the state-full modes.
> > 
> > Are you asking for dedicated SW controllable reset line or just an
> > indication from DT that OSPI reset line is connected to board level
> > soft/hard reset lines?
> 
> I don't see a need for the reset line to be SW controllable, a simple 
> indication from the device tree should be enough.

We already have the property "broken-flash-reset". Should we re-use it 
or should we have a opt-in property instead of an opt-out one?
 
> > 
> > Mandating SW controllable RESET line is bit of a stretch IMO... Board
> > design may not allow wasting dedicated pin due to lack of GPIOs perhaps..
> > 
> > For eg.: TI EVM has OSPI reset line connected to board level reset out.
> > This ensures any soft/warm/hard CPU reset will trigger OSPI Flash reset,
> > but there is no SW control that allows OSPI flash alone to be reset.
> > Isn't such a reset mechanism sufficient?
> > 
> 
> I think it is, yes.

-- 
Regards,
Pratyush Yadav
Texas Instruments India

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
