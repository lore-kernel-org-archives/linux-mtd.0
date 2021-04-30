Return-Path: <SRS0=4jNj=J3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64317C433B4
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Apr 2021 05:43:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0061F61362
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Apr 2021 05:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0061F61362
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z9r/q4IBNQYJvvRMUKwkjQVCXZErkabd8jbPaDMa3gc=; b=mb6HQJFxrs0JwiNgZ8PbLipc3
	df4YQfiwoD0DvpC6EGW0bEsjX/3GLKc7H8lhVut8GsFKmJ0eOsqCXx3mR1sMPGWXHY9b1mL3Btaor
	aAMMpVytz5fwtzxq5jZ0LNq2+PY8UYLU46LL9iutRjjMy046EYZcBh/r4PoULdc3qC2lIu+YfNRdq
	RhxVvapdXPOMyBZ87hJkaQ4XeqxzsaI/fjT2xpKBJEEbuDMcDh2LIOC+ZWq6vyMZyd/YSRKSuVOFm
	TDIQglA3yXVaBWh7QbH6tUAPCkTgcUsf3b2jEXudNfgWjTlmBqaSn8IUeptKHMQYg42WRtYr+gotB
	2cvdhMy5Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcLv0-007F01-AH; Fri, 30 Apr 2021 05:42:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcLuv-007EyN-0y; Fri, 30 Apr 2021 05:42:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=GU3XCSNVHhrz0byCodnolDUzfyAhgWLfmDqWa9yFTCg=; b=BsDPwEZoq545wYrSEzwLs15S2l
 bB5Fd/dIEyewglvlXPapQb9lCzOYuta/D1USFWyWjJ3zWzHEHMXch+HDb2ZM7cgqHXzJZVpXrTjsh
 9i3+SBjjuavx6fDjSpSFBvD3N63fYeqNXek30I/SdYSdaQMHoOCn/WaH9qZJI2tJq9rWYKkkIYffg
 PiOtBCNO2J4HdDRQCU6/+AvJhVfNpZHIGono0Je8kNG4ZSVWBzugcthv6NWf/e3IdYFTw3uWJVo2E
 /26f7A+bepCJsCXvfb+BQ7CzDc5pJoPzLUx6U7V22K8CsRhAAml+dWgRN5SPMXTl5HjGtH6bEOxgV
 lqmyuIXg==;
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcLur-0018Jr-Bo; Fri, 30 Apr 2021 05:42:19 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13U5gBwK061470;
 Fri, 30 Apr 2021 00:42:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1619761331;
 bh=GU3XCSNVHhrz0byCodnolDUzfyAhgWLfmDqWa9yFTCg=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=CJERJ7+lqAer2TSuJFXKSmzB4hvQjvFFt2dY8TSUbuRRP/567f4w633Dh7oVe47FD
 KysV6VsxUAEiapzv5TvK/NVU/+WiCIhz1Sgpu8lL221tjf7fKsWEB3h2x8Sgm7ABVW
 gO1ViMcpyPiWgdH7TvlZ9wg9+sQorl75FpyZLx04=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13U5gBej116963
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 30 Apr 2021 00:42:11 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 30
 Apr 2021 00:42:11 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 30 Apr 2021 00:42:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13U5gAVf094450;
 Fri, 30 Apr 2021 00:42:10 -0500
Date: Fri, 30 Apr 2021 11:12:09 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, Lokesh Vutla <lokeshvutla@ti.com>
Subject: Re: [RFC PATCH 5/6] spi: cadence-qspi: Tune PHY to allow running at
 higher frequencies
Message-ID: <20210430054207.gakq7evf47igzcm4@ti.com>
References: <20210311191216.7363-1-p.yadav@ti.com>
 <20210311191216.7363-6-p.yadav@ti.com>
 <143b24c61109823f6e616cf91d28d16c@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <143b24c61109823f6e616cf91d28d16c@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_224218_308884_CCE3E598 
X-CRM114-Status: GOOD (  10.27  )
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

On 30/04/21 12:48AM, Michael Walle wrote:
> Am 2021-03-11 20:12, schrieb Pratyush Yadav:
> > +	if (of_property_read_u32(np, "cdns,phy-tx-start",
> > &f_pdata->phy_tx_start))
> > +		f_pdata->phy_tx_start = 16;
> > +
> > +	if (of_property_read_u32(np, "cdns,phy-tx-end", &f_pdata->phy_tx_end))
> > +		f_pdata->phy_tx_end = 48;
> > +
> 
> I didn't see a dt-bindings patch for these.

Right. Will add them in the next re-roll.
 
> -michael

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
