Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C984FC44539
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2026 15:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sfTgmj/UmUpjI3Vs4J8RC+Fyk6Znce9BPcr2pRZtKYY=; b=Uiop1SDMW3rLIG
	A05UcG2HSr+W6xgTvNkQJyYAgv8SQb1KHAJLEMptrBwoAiBVy3jw36GEPhYObgXSLIkPHmxsOsrk9
	2kCw9QxnaL7LXfx5M+0CwMR2jfSnSNXMsbiYeCYXQJabiPQCiLWm5mjfgFweHz8y625Xg56pu7eQt
	d6ODUDEC2v4CBIl6lDcsNQ6wj3YBV1WoiSNEY4rsYXD7mxXPLC2h1cWdqCYaUH4XtXyc63zt8RY8H
	qZ8HJ462SzPjAKxIGdX4LI1il/pSygOmyyTmeFA+aPdvo9aC2BC0PwF/8kNmShXwEuhWzXg3jrP2b
	xgTjwgWZ+tJsKMi6q76A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYjn-0000000C8XN-14wS;
	Wed, 22 Jul 2026 15:19:59 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYjk-0000000C8Vo-44WK
	for linux-mtd@lists.infradead.org;
	Wed, 22 Jul 2026 15:19:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 493254E40ED4;
	Wed, 22 Jul 2026 15:19:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1733760388;
	Wed, 22 Jul 2026 15:19:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 82FD911BD2234;
	Wed, 22 Jul 2026 17:19:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784733593; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=4AtK/QMggaWIJppHcimsREGdYEKGXbtDT2MVjp8qhwI=;
	b=AW0bpR7tUkZhucA0dI/s38f6DpI1Z8ysbli9g2hv0BrcyIM+nIunEVL5qOfZsiqxL84Gxf
	u6eLe19TRefLg3VKLdARRudGqvjoeHbXdDgB9YC936AR41hXNF3b2mJw8xD3L3+frp6B7V
	BcGpKoVNStskjPN6DhvgCwj45L8kj/2I7RUnPgy1b//wpgf1YLQs1n9JcigOqDM/yuzqoQ
	tXMGPGvDyQPmc9BSyl8JrcuAYBc0iGosh5bjzCYIDJ+PHJPz8DZczmGsr2o46SqXXTHckA
	WvipzNxuikKjW81p+mP66raXyp1jrJLUKaqIyRk99WV5wF8kP8Cg4iJjp4SjkA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 02/30] mtd: spi-nor: winbond: Normalize names
In-Reply-To: <DK54G4EE7DDC.N91PU5M9S6PP@kernel.org> (Michael Walle's message
	of "Wed, 22 Jul 2026 15:07:46 +0200")
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
	<20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-2-87e5d3122244@bootlin.com>
	<DJRJH8H54BBB.9ZNM5OJBFG47@kernel.org> <878q73jif0.fsf@bootlin.com>
	<DK54G4EE7DDC.N91PU5M9S6PP@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Jul 2026 17:19:50 +0200
Message-ID: <87a4rjhx0p.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_081957_153011_2E6EC10D 
X-CRM114-Status: GOOD (  15.08  )
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

On 22/07/2026 at 15:07:46 +02, "Michael Walle" <mwalle@kernel.org> wrote:

> Hi Miquel,
>
> On Wed Jul 22, 2026 at 2:52 PM CEST, Miquel Raynal wrote:
>>>> As a result, W25Q01NWxxIQ is irrelevant and would better be named
>>>> W25Q01NW-Q, W25Q02JV is irrelevant and would better be named W25Q02JV-M,
>>>> etc.
>>>
>>> OTOH if you try to search for that name on the internet/datasheets
>>> you don't find anything, while the xx somehow indicates that
>>> something is missing here.
>>
>> The datasheet is often the same for N/Q/M variants, a table close to the
>> end mentions the differences. The intermediate letters have no useful
>> meaning for us and IIRC they number may vary. The meanging is:
>>
>>         - W: Winbond
>>         - 25Q: SPI NOR family
>>         - 02J: Density
>>         - V: Voltage level
>>         - Useless information for software support such as the package
>>           size or some ratings which have no impact on the software, the
>>           absence of lead, etc.
>>         - And then there are subtleties such as features available or
>>           not, enabled by default or not, which can be disabled or not,
>>           that is carried by the last letter.
>
> I get that, but still, that part name "W25Q01NW-Q" simply doesn't
> exist. I've argued with Tudor years ago, since he wanted me to use a
> similar naming (w25q32jwm). I mean I don't care to much. It's like
> I've said, you won't find anything about that on the web, as the
> name is made up by us :)

I get the same results with the two names. I know it is not
fully deterministic since I must have a history in searching for SPI NOR
datasheets on the internet, but both copy-paste in Google search engine
return very similar results.

"w25q32jwm" looks like an exact name, whereas with the minus sign it
indicates a potential break in the name, no? The problem with the 'x' is
that you don't know how many you need.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
