Return-Path: <SRS0=3Xy9=J2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 995C8C433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 22:21:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC81A61464
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 22:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC81A61464
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X0VLwb+w+ZN8AjUc4YGWONSIe2HcWteDPFrbTDNmOvM=; b=nGz3U/jUNbo29lkG3v5pfB9p8
	7h42CG9p60qrz15xlQQX/+UGkxtfvv3ldG3jqZ1vbkw+WAPFG8cL84ESjurj8pCxOK121uOMMrz5U
	N+DAAPLHVr0GHwQZEnIF2WPN/S0qClTFQY/tjw/Ftyvs/SrJr9GGKh/B1MpmJzHpFqC39APz+13vl
	jrkla4XH+yoai1G+JHx6psDu2hDVFgDSHamQZoGk92np9ZtfzLlOxCIRJqGkgcyuAg/4h3MOrPGKg
	8HGLrmmLPZEzvA62KqfiyMyVJfpasRASwxyIFy37+/iNaxeGgRQeUOBwaMN1hvENXTn+Fo2P1a8jM
	tpntzmAFg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcF1Z-006czR-Kj; Thu, 29 Apr 2021 22:20:45 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcF1J-006cxh-Hd; Thu, 29 Apr 2021 22:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=la6VLsxOJVtAExCAynbfZPh1rnm5vHPZ1THtd/hTHcY=; b=KaoXApZGIOqFtlf8Y2rigyfaa9
 kQLbpXcbJRwwwBTFadbzBoU3W7qACBh3TJMCP74cTjuelnHavB9UoH54JPmFBl8YpfTQETm6P2YXf
 +/x+ZHNNFlkviepukseFmyDMKLag3u1B1L/7JOn78bcQ8JaWEnifIorBSyVdv64ZdBr/SD02U+LB7
 3+pqeZMHWBjDrhudoGxqeTrhUnPehvCw/TUXW2kcMSQLQj/AcgG9Nifxk8kcNjX3Lrh5zpE3pMjA9
 gycqHOYZAaWswFvSiRHBjYFp4Tr1dy6C84EJnophI2353ylKSSLzM2/dVemagylObRNQGJD4qBqXK
 y8KF0sLw==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcF16-0010PZ-FY; Thu, 29 Apr 2021 22:20:18 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 741622224D;
 Fri, 30 Apr 2021 00:20:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1619734813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=la6VLsxOJVtAExCAynbfZPh1rnm5vHPZ1THtd/hTHcY=;
 b=U1hNdI7EaTGjYM4poaPfhkmA5c76axn4jj3YiAyBX56MOJQoXCvwx/44i8od6G5H/YKUum
 lHdmylGQ99VQvHC/vqZj3663T77p2LReCJzpgTtY8fHUJWF8AEGfuccJwg5sklLtzTuXgy
 hUu31FWHRAF9cKaEdUhINy1f5hlLAnI=
MIME-Version: 1.0
Date: Fri, 30 Apr 2021 00:20:13 +0200
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Tudor.Ambarus@microchip.com, nm@ti.com, kristo@kernel.org,
 robh+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org, lokeshvutla@ti.com
Subject: Re: [RFC PATCH 4/6] spi: cadence-qspi: Use PHY for DAC reads if
 possible
In-Reply-To: <20210429181908.bwb45eljn5nxscf6@ti.com>
References: <20210311191216.7363-1-p.yadav@ti.com>
 <20210311191216.7363-5-p.yadav@ti.com>
 <2f26456e-59ff-2625-5d65-c1537052839d@microchip.com>
 <20210312101757.sqeyledbwjnpqdoy@ti.com>
 <ee2b753b16e76ecbede4c1373b6f2d77@walle.cc>
 <20210429181908.bwb45eljn5nxscf6@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <e17722c30deb7f2dcb94a9aa43bbc6dd@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_152016_703881_E670C5AC 
X-CRM114-Status: GOOD (  29.06  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-04-29 20:19, schrieb Pratyush Yadav:
> On 29/04/21 06:28PM, Michael Walle wrote:
>> Am 2021-03-12 11:17, schrieb Pratyush Yadav:
>> > On 12/03/21 09:13AM, Tudor.Ambarus@microchip.com wrote:
>> > > On 3/11/21 9:12 PM, Pratyush Yadav wrote:
>> > > > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>> > > >
>> > > > Check if a read is eligible for PHY and if it is, enable PHY and DQS.
>> > >
>> > > DQS as in data strobe? Shouldn't the upper layer inform the QSPI
>> > > controller
>> > > whether DS is required or not?
>> >
>> > Yes, DQS as in data strobe. I need to check this again, but IIRC the
>> > controller cannot run in PHY mode unless DS is used. Ideally the upper
>> > layer should indeed inform the controller whether DS is supported/in-use
>> > or not. That can be used to decide whether PHY mode (and consequently
>> > the DS line) is to be used or not.
>> >
>> > Currently there are only two flashes that use 8D-8D-8D mode (S28HS512T
>> > and MT35XU512ABA), and both of them drive the DS line.
>> 
>> The LS1028A datasheet explicitly states that the calibration is only
>> used for non-DQS flashes. Which makes sense, because it just determine 
>> at
>> which point the input data is sampled. And if the flash provides a 
>> data
>> strobe, it already know when to sample it. What I am missing here?
> 
> If there was 0 delay in transferring the signals from flash to
> SoC/controller, you would be right. But in practice there is a small 
> but
> noticeable delay from when the flash launches the signal and when it is
> received by the device. So by the time the DQS signal reaches the SoC 
> it
> might already be too late and the data lines might not be valid any
> more. The calibration accounts for these (and some others) delays.

DQS and the data signals are trace length matched, so for data reads
they will end up on the IO pad of the SoC at the same time. This is
also mentioned in [1] (Fig 1.1, point 4 and 5). So while there needs
to be a delay on the clock line for the receiving FF, the best value
for this should be half the SCK clock period.

Does this work without DQS? That should be the main purpose for a
calibration, no? Because in this case, you'll have to determine
the delay between SCK and the data signals (for reads).

Btw. I can't get my head around how the TX delay search would work.
Basically you shift the SCK to the command / data to the flash. So
the flash will either recognize a valid read command or if the delay
is too short/too long the flash will (hopefully) ignore the wrong
command, correct? Might there be any misinterpreted commands which
might be harmful? Are there any flashes which actually need a delay
between data out and SCK?

Of course, the calibration might help with broken hardware where the
SCK/DQ/DQS traces are not length matched.

-michael

> 
> See [0] for a somewhat similar discussion I had with Tudor.
> 
> [0] 
> https://lore.kernel.org/linux-mtd/20210312181447.dlecnw2oed7jtxe7@ti.com/

[1] https://www.ti.com/lit/an/spract2/spract2.pdf

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
