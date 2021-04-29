Return-Path: <SRS0=3Xy9=J2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C48C433ED
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 18:20:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DB2261441
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 18:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DB2261441
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aIcHMdRerR/hIkpz1LwPWs+yWoe3B/yaEcZiYiMc+D8=; b=LK+NAKy1J2bc5ZfYAq3aeMP2D
	abfVubmPf+yvXVz2r9wmxvKbKS5QkIlNmw+ojR+fQxjY05Qh2yOIgx/16ttfNmi/GbJtG3oLqC+YF
	UFyFJbeBxrcztLDYiiQI1+/ezCmMj0Wov5jT4qMHHmR8Ezn53ujBRGJO51IG7qMGK3aBdeqQp1+tQ
	AQmLLL5e3Mclbh9m2g33UqPhM2BJVcb6jdNhx4dmkuDvagEvpMHvT/yb6nnZuMdIOJiE0jH1+9GE0
	Mzjf8QS56boGoflOMEOaRRqpiXd2aqTPpOcIDiasUJ/0Vx8orVLzcH1ytoK7Hl5A9GaLoM5rCVSd6
	W5+yytzuQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcBG0-006AW3-Rk; Thu, 29 Apr 2021 18:19:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcBFy-006AVr-Q8; Thu, 29 Apr 2021 18:19:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qn9kzRdRLypsLGuwsWHINLPGN27LGJ4D1oTG14gSrhQ=; b=VgJZFQGnYH3EHA4m2oZeKUsSEr
 cM3EXn0I2iasx4m/Y78AQ2B5WBMYH4DjQ6mZfIif2ND3pqybdXwzJGVz8DbYOaJFXwRviNE+X3Mdb
 ftVf/sW1I3GdVposx79GBSaCejd5WjY/sCFQB3VkyBOZ/XIPH4f+yRz0gdd4hakOZfCeIs0sBQPZJ
 C2rZAGKasgYPfEdTvPXOIL0ZMxq1s9RkPPPtxS1R15vaqI5JAEVJ+mHPBHhaAZQ/ayyIIEurulPlS
 yC0+FfpOBv6cyqjnZUXo6JQEkrvR9OtgA5Je9v1VlmPMGDNfWIw+FoQbT6rB777QTiMgCEFa3Oa4L
 0NlUuyZA==;
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcBFv-000qYn-Jr; Thu, 29 Apr 2021 18:19:21 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13TIJB2E064801;
 Thu, 29 Apr 2021 13:19:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1619720351;
 bh=qn9kzRdRLypsLGuwsWHINLPGN27LGJ4D1oTG14gSrhQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=XxMhfy7DhE9uwt78+5kErww92qqIjMvt17+diJMmsltgv+9LOtJwyenI4lwnJy9SL
 DBcZyt75V1rWchPr+n4ecd8EbenekLHTf8Qg1CY7jTIT9c2zbhAvCIxF2tIahtcjQ0
 2CGHGv6FbOa4ql+DcvCpP53SmH2zY5TTOYS9Wh9o=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13TIJBdB131020
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 29 Apr 2021 13:19:11 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 29
 Apr 2021 13:19:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 29 Apr 2021 13:19:11 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13TIJAWs025236;
 Thu, 29 Apr 2021 13:19:11 -0500
Date: Thu, 29 Apr 2021 23:49:10 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <Tudor.Ambarus@microchip.com>, <nm@ti.com>, <kristo@kernel.org>,
 <robh+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <broonie@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <lokeshvutla@ti.com>
Subject: Re: [RFC PATCH 4/6] spi: cadence-qspi: Use PHY for DAC reads if
 possible
Message-ID: <20210429181908.bwb45eljn5nxscf6@ti.com>
References: <20210311191216.7363-1-p.yadav@ti.com>
 <20210311191216.7363-5-p.yadav@ti.com>
 <2f26456e-59ff-2625-5d65-c1537052839d@microchip.com>
 <20210312101757.sqeyledbwjnpqdoy@ti.com>
 <ee2b753b16e76ecbede4c1373b6f2d77@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ee2b753b16e76ecbede4c1373b6f2d77@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_111919_946986_9CD46CB4 
X-CRM114-Status: GOOD (  20.65  )
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

On 29/04/21 06:28PM, Michael Walle wrote:
> Am 2021-03-12 11:17, schrieb Pratyush Yadav:
> > On 12/03/21 09:13AM, Tudor.Ambarus@microchip.com wrote:
> > > On 3/11/21 9:12 PM, Pratyush Yadav wrote:
> > > > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > > >
> > > > Check if a read is eligible for PHY and if it is, enable PHY and DQS.
> > > 
> > > DQS as in data strobe? Shouldn't the upper layer inform the QSPI
> > > controller
> > > whether DS is required or not?
> > 
> > Yes, DQS as in data strobe. I need to check this again, but IIRC the
> > controller cannot run in PHY mode unless DS is used. Ideally the upper
> > layer should indeed inform the controller whether DS is supported/in-use
> > or not. That can be used to decide whether PHY mode (and consequently
> > the DS line) is to be used or not.
> > 
> > Currently there are only two flashes that use 8D-8D-8D mode (S28HS512T
> > and MT35XU512ABA), and both of them drive the DS line.
> 
> The LS1028A datasheet explicitly states that the calibration is only
> used for non-DQS flashes. Which makes sense, because it just determine at
> which point the input data is sampled. And if the flash provides a data
> strobe, it already know when to sample it. What I am missing here?

If there was 0 delay in transferring the signals from flash to 
SoC/controller, you would be right. But in practice there is a small but 
noticeable delay from when the flash launches the signal and when it is 
received by the device. So by the time the DQS signal reaches the SoC it 
might already be too late and the data lines might not be valid any 
more. The calibration accounts for these (and some others) delays.

See [0] for a somewhat similar discussion I had with Tudor.

[0] https://lore.kernel.org/linux-mtd/20210312181447.dlecnw2oed7jtxe7@ti.com/

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
