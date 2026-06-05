Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8607BCD6E6B
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jun 2026 07:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bwv9tEwIpUMR+QuZVTfsn0q8Y8qqY5/uLfdRV5dNdm8=; b=yQtv4wY7OQCS9q
	JbFx+FpNGaMCRBdjFsb23Sm6JRtye3vfflRHOoQQcADH0/TqKYSs5TrvqUc80pbufyPo7PMi4/BIy
	K2j6/okjLvczJjNPb19wrsDwFu0ewT4TZKMb5JtMzCLW2lU1WCoDfeXaQLdjaKVHvJXsJ9G841mKO
	amFIwxSeIYM8k01uQaRhPoR+crN93jp6R45eCpxptrcse43dN6oF1Fb/ekFaFs3wEoixvMzgsTIGN
	jlQnwiWLcyQ5llclfyEbKQ+xkvOdt7NYxD8aKZn4Bmq1m6wXQthkqngP0pkmLMnEMNSQDMWZhxlhB
	P5kBze0hoBr3kgVRGV9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOwn-00000000ES3-0W9S;
	Fri, 05 Jun 2026 07:26:29 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVOwj-00000000ERh-3h7U
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jun 2026 07:26:27 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 86F2C1A08EE;
	Fri,  5 Jun 2026 07:26:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 575225FED1;
	Fri,  5 Jun 2026 07:26:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9A214106A1E65;
	Fri,  5 Jun 2026 09:26:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780644381; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=dJs1UXUNkLhBR/S0VALc0PkMzbs22zwOjldoT+MQiOE=;
	b=1HExFZQ71mYhu9loC8vT9RuOdU20EdrN8UjyVoOTSvyDNV0zdifjoy/HtaTQyrefq/5Arf
	34MwRdSYY4s2W9yEviPjziQyYRjT3DqYpyQgoNPSF28Hd7EXzr17OCWdNlXWXqdrwpy8Kp
	XJv40cpGmgtEmbfe3xkZPsklXTAZHo6BmR/sJHisgg/WaL8IjT2v5i0eJA2jpLHE9xAmHq
	JujoPbzRynWgqH61lZ7FStVew0vxVV7a4om6JdkI+DLjMOfAR6aHFSNeJ/J2sFuKllFsyW
	b/JYDCDCCP2vpn9BBQnu3thwMxcC0PwCniHNtSu2YPt5Cl92fEbWvkw+iDPf4A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>,  Santhosh Kumar K <s-k6@ti.com>,
  <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [PATCH v3 01/13] spi: dt-bindings: allow spi-max-frequency to
 specify a frequency pair
In-Reply-To: <20260605-regulate-crawling-253c6d6bd971@wendy> (Conor Dooley's
	message of "Fri, 5 Jun 2026 08:17:18 +0100")
References: <eaa75113-2b89-468d-aca8-932bc7e33a7d@ti.com>
	<87cxy92llq.fsf@bootlin.com>
	<20260602-aptly-bunkbed-1bd3a8d63d54@spud>
	<875x3zzkji.fsf@bootlin.com> <20260603-neatly-twine-e89b923f5cb6@spud>
	<87o6hry4d4.fsf@bootlin.com>
	<20260603-balance-encounter-94f69e1577f3@spud>
	<87ik7yydyv.fsf@bootlin.com>
	<20260604-shrunk-acclaim-25368d7ad63e@spud>
	<87a4t9wl7r.fsf@bootlin.com>
	<20260605-regulate-crawling-253c6d6bd971@wendy>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 05 Jun 2026 09:26:13 +0200
Message-ID: <87tsrh4fe2.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_002626_057795_460F4300 
X-CRM114-Status: GOOD (  23.63  )
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

On 05/06/2026 at 08:17:18 +01, Conor Dooley <conor.dooley@microchip.com> wrote:

> On Fri, Jun 05, 2026 at 08:32:56AM +0200, Miquel Raynal wrote:
>> On 04/06/2026 at 09:36:49 +01, Conor Dooley <conor@kernel.org> wrote:
>> 
>> > On Thu, Jun 04, 2026 at 09:14:16AM +0200, Miquel Raynal wrote:
>> >> Hi Conor,
>> >> 
>> >> >> >> > Right, and this I guess is what scuppers letting the controller driver
>> >> >> >> > sort the configuration out itself and leaving the property as-is.
>> >> >> >> > It could be that the speed in spi-max-frequency is lower than the "base
>> >> >> >> > speed" of the controller but because of board routing or device
>> >> >> >> > capability that the tuned mode is still required, right?
>> >> >> >> 
>> >> >> >> I do not actually expect any tuned mode/frequency to be mandatory.
>> >> >> >
>> >> >> > I think you misunderstood my use of "required", I meant that the new
>> >> >> > property/information was needed in the scenario I described, not that it
>> >> >> > should be a required property in a binding.
>> >> >> 
>> >> >> Yes I misunderstood the term indeed. However I still fail to catch what
>> >> >> you meant here, I'm sorry. Would you mind rephrasing?
>> >> >
>> >> > I was talking about a scenario where you want to use the tuned mode to
>> >> > achieve the maximum rate because of the device and/or board configuration,
>> >> > but the rate is below the point where the controller would need tuning.
>> >> > Say the controller needs tuning above 8 Hz but the conditions require
>> >> > tuning to achieve more than 5 Hz. In this example, if the device can do
>> >> > 6 Hz, spi-max-frequency (in the current form) would be set to 6 Hz, and
>> >> > the controller would not enable the tuned mode, leading to problems
>> >> > because the inflection point determined from the controller compatible
>> >> > of 8 Hz would not have been reached.
>> >> 
>> >> I don't think this is a real situation. If the "conditions", as you say
>> >> (ie. PCB routing, mostly) require tuning above 5, then spi-max-frequency
>> >> should be 5.
>> >
>> > Then tuning mode would never be used.
>> 
>> Well, this is exactly what we propose in this series, a way to indicate
>> two maximum frequencies, one that just works (like before) and a higher
>> frequency that is only reachable after an extra tuning procedure.
>> 
>> > Remember, this is a theoretical world
>> > where spi-max-frequency would contain the tuned frequency and the
>> > controller was using compatible-specific speed thresholds to determine
>> > if tuning was required.
>> 
>> That is not what we are proposing. I don't think indicating the "after
>> tuning" frequency in a property that has long been used for an always
>> reachable frequency is wise. Hence either the use of an array (the
>> second entry could contain a higher frequency) or a secondary
>> spi-max-frequency-whatever property.
>
> I am/was trying to come up with a scenario that would justify the patch
> man, stop trying to interpret it as what I want done.

Ah :-) Sorry the intention was unclear to me. So what is your preferred
take in the end?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
