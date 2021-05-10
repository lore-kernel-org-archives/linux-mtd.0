Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A229AC433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 11:56:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E970460E09
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 11:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E970460E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pBI6NJunpNAaPtFFxecLSjXgONyYWbgULuqSCPKpJbw=; b=XCRLipaJ0lsxuVAHZ7+fnlf/n
	dgIj+bmYIhZHyaEPJDNhe1Uz9TfkrkXyE/39Tji+bLTNSXuzj+tcmOrFBOhMAlWRYCpdXrmApMmMF
	907JcnC8Xzwi4gaK+0kmveua/4hww5UEdjWCgDeMekRan5yhxNVqiYXI4j9/4C/21gm5rJyuCC/Hw
	Tt9/3q1LAAq70aGVv8h9B9Gv7nrEbL8hQQDKM0c+oTjIWrWek5bDDGP9F6gm4Yff0y7tdYF9XKKkP
	QF+DIv7rTxcCEgkC6WLu2qPmjF4HmJLItQai8B8ex8ZG2I02gB6fRp6C8L3h0IVoIeJe3sIFbSRuk
	nq+O3NYgA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg4VX-00E9vo-Qx; Mon, 10 May 2021 11:55:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg4G1-00E7Cd-8s; Mon, 10 May 2021 11:39:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=gETgHZ5jeRjeZNAOjDn4ZoH956iUzOSYPpFRThSr55s=; b=NKUbxqOJtrZpAPWl2Sk9dv3q7l
 Z+ETB2WzCkblYJqYuwMbgyeItWzA9vzPQw5PxHF8Euz59+mJRvU0ckjVpSOFfBW3+Eo5FqdNi3iBs
 jCWb+Vebudz/ntgTbWKB3zCsB1VzJdXCgMkH9NuRTYKlKIQm5bZZa9KuP0SDrVR4cJhySuJ9uqQcE
 /YIu2aDXQ4LlVP/zxiMjqZ3PonF1rvBi7mJTsbll8trI5vDE//R4N9gAukYRPRWhf+44kCEW9taZJ
 sKv4oFbpcQgX+bOQNp0p1rbTqnIEItiLh49xj3yDAItL3kBq/rR5R3jTC/q/HgvlBSUVDOXJy8w3D
 4jUvoVuQ==;
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg4Fx-008d4O-Qc; Mon, 10 May 2021 11:39:27 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14ABdArH113218;
 Mon, 10 May 2021 06:39:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1620646750;
 bh=gETgHZ5jeRjeZNAOjDn4ZoH956iUzOSYPpFRThSr55s=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=YLb3ty6YRg1lTSLxEUEmqXIFE6B7Mi6GAvx9n+KagbEscefDpAX2SejoVRBi83+LB
 ihjZBx95kWB8SBdLKqTHTdRv9BU92+zCYjog5eu0Wu6RvDZVYvJ/5ONNN0yY5j35me
 H+rHgF7FFQAx4XNMZyIDy6o3l8iqJr68iOWt0zow=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14ABdAAU119001
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 10 May 2021 06:39:10 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 10
 May 2021 06:39:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 10 May 2021 06:39:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14ABd98E061711;
 Mon, 10 May 2021 06:39:10 -0500
Date: Mon, 10 May 2021 17:09:09 +0530
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
Message-ID: <20210510113907.75mkhuby74yoinkp@ti.com>
References: <20210311191216.7363-1-p.yadav@ti.com>
 <20210311191216.7363-5-p.yadav@ti.com>
 <2f26456e-59ff-2625-5d65-c1537052839d@microchip.com>
 <20210312101757.sqeyledbwjnpqdoy@ti.com>
 <ee2b753b16e76ecbede4c1373b6f2d77@walle.cc>
 <20210429181908.bwb45eljn5nxscf6@ti.com>
 <e17722c30deb7f2dcb94a9aa43bbc6dd@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e17722c30deb7f2dcb94a9aa43bbc6dd@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_043925_971904_E9656237 
X-CRM114-Status: GOOD (  43.47  )
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

On 30/04/21 12:20AM, Michael Walle wrote:
> Am 2021-04-29 20:19, schrieb Pratyush Yadav:
> > On 29/04/21 06:28PM, Michael Walle wrote:
> > > Am 2021-03-12 11:17, schrieb Pratyush Yadav:
> > > > On 12/03/21 09:13AM, Tudor.Ambarus@microchip.com wrote:
> > > > > On 3/11/21 9:12 PM, Pratyush Yadav wrote:
> > > > > > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > > > > >
> > > > > > Check if a read is eligible for PHY and if it is, enable PHY and DQS.
> > > > >
> > > > > DQS as in data strobe? Shouldn't the upper layer inform the QSPI
> > > > > controller
> > > > > whether DS is required or not?
> > > >
> > > > Yes, DQS as in data strobe. I need to check this again, but IIRC the
> > > > controller cannot run in PHY mode unless DS is used. Ideally the upper
> > > > layer should indeed inform the controller whether DS is supported/in-use
> > > > or not. That can be used to decide whether PHY mode (and consequently
> > > > the DS line) is to be used or not.
> > > >
> > > > Currently there are only two flashes that use 8D-8D-8D mode (S28HS512T
> > > > and MT35XU512ABA), and both of them drive the DS line.
> > > 
> > > The LS1028A datasheet explicitly states that the calibration is only
> > > used for non-DQS flashes. Which makes sense, because it just
> > > determine at
> > > which point the input data is sampled. And if the flash provides a
> > > data
> > > strobe, it already know when to sample it. What I am missing here?
> > 
> > If there was 0 delay in transferring the signals from flash to
> > SoC/controller, you would be right. But in practice there is a small but
> > noticeable delay from when the flash launches the signal and when it is
> > received by the device. So by the time the DQS signal reaches the SoC it
> > might already be too late and the data lines might not be valid any
> > more. The calibration accounts for these (and some others) delays.
> 
> DQS and the data signals are trace length matched, so for data reads
> they will end up on the IO pad of the SoC at the same time. This is
> also mentioned in [1] (Fig 1.1, point 4 and 5). So while there needs
> to be a delay on the clock line for the receiving FF, the best value
> for this should be half the SCK clock period.

In the explanation below Figure 1-1, I see:

  The DQS and data are edge aligned at points 4 and 5 in Figure 1-1. DQS 
  must be delayed by the RX PDL to a point inside the data eye to sample 
  valid data at point 2.

So the RX delay is being used to tune exactly when to sample the data 
lines. From what I understand, the delay is not set to SCK / 4 because 
this delay might change with temperature. This calibration algorithm has 
been designed to be reslilent to temperature changes so it performs some 
other heuristics to find the ideal delay for the DQS. Plus, part of the 
delay comes from the time taken by the controller to sample the data. 
The algorithm takes care of that delay as well.

To be completely honest, I'm not very well versed with the internal 
details of the calibration. I only have a high level view of it. I hope 
my explanation was clear enough. If not, I can spend some more time to 
understand how the internals of the controller work and get a clearer 
understanding of what is going on in the background.

> 
> Does this work without DQS? That should be the main purpose for a
> calibration, no? Because in this case, you'll have to determine
> the delay between SCK and the data signals (for reads).

It should, but I have not tested it without DQS.

> 
> Btw. I can't get my head around how the TX delay search would work.
> Basically you shift the SCK to the command / data to the flash. So
> the flash will either recognize a valid read command or if the delay
> is too short/too long the flash will (hopefully) ignore the wrong
> command, correct? Might there be any misinterpreted commands which
> might be harmful? Are there any flashes which actually need a delay
> between data out and SCK?

Yes, it is possible to send an invalid read command. Section 2.1 says:

  TX min and max (side walls of the passing region) are formed by the 
  setup and hold time requirement of the OSPI device. TX delays outside 
  this range cause command and address bytes to be latched incorrectly 
  by the OSPI device, resulting in an unsuccessful read.

Currently, the TX limits are hard coded such that this does not happen 
for the two flashes I have tested with: Micron MT35 and Cypress S28. If 
later the need comes up such that the limits are not enough to encompass 
all the flashes we need to support, I can look into setting the limits 
via device tree.

> 
> Of course, the calibration might help with broken hardware where the
> SCK/DQ/DQS traces are not length matched.
> 
> -michael
> 
> > 
> > See [0] for a somewhat similar discussion I had with Tudor.
> > 
> > [0]
> > https://lore.kernel.org/linux-mtd/20210312181447.dlecnw2oed7jtxe7@ti.com/
> 
> [1] https://www.ti.com/lit/an/spract2/spract2.pdf

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
