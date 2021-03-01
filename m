Return-Path: <SRS0=zfSv=H7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64505C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 13:51:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7097A64D9F
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 13:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7097A64D9F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D4EW1/PI1WshzkhdTfnXFReWzrtD+P08KByopWLGdhk=; b=SKKoIfLv5xBPwvNQM/u+S8ZeY
	+vohEWpSu1MmstKPiw78oYKAsn42tJ5eQB4fIYmwn/7alCus9Nm5cIKLmrHTIY12LSFt5Va90c6QO
	VK9K9CQEYyVAHkhlXxzfeIlNelNmq+TvFsDMk9FmkPnf9kjh5qdCGvEn1RgaWv3BFTc/JeUVa50Xw
	bktzWkQkluvFNqoDm8XxA+r5VamRh00qqxQ8cUGthIUg586wrS1A5ryk8ioPHg7Y2GvzbCciJRrX6
	xHAawtoBgyGW7l6SenVPzCxUbuBihxz6USYfuwDao5fQMTPmx7SLqpaFLNZCx+U4U/o5EWqqGxPk6
	pPPnzmngg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGiwP-0002pK-IP; Mon, 01 Mar 2021 13:50:29 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGiwK-0002ng-QN
 for linux-mtd@lists.infradead.org; Mon, 01 Mar 2021 13:50:27 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id EB31C22178;
 Mon,  1 Mar 2021 14:50:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1614606617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jPbx8KXoBTJ3NYjG34ELFLhkuk0/NN8gQHXye1wJfbE=;
 b=oiPR2ubyV3Hliag7i1rNsM6MFLB41YfhHZCvhikM8EEk/yg/AZYn+RWDu3Bh7nAxhJZASS
 EFFyis0QA7Q7+Taaje1NYd5+lYEP9NuU7LhntRsy5hI6ZGSJITOJCQD2Hn7oxwlWp6TJp9
 CDAsBDPCMAqdzqqs5ULU6MVuYm8qpRw=
MIME-Version: 1.0
Date: Mon, 01 Mar 2021 14:50:15 +0100
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Subject: Re: spi-nor: maxronix MX25L12835F support
In-Reply-To: <20210301133618.rzs4amh5ujwys277@ti.com>
References: <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
 <92b5b932-a672-9fb6-c604-5263a0668eb3@microchip.com>
 <CAEyMn7aMNjKHXhe_hN15XVczombrTnNqASmva_-MT92+qqV8xA@mail.gmail.com>
 <615749fe-52f5-9e07-db46-41e5e03b55cf@microchip.com>
 <CAEyMn7aXXOS3abS=n_8Y6GtN-xYRYyGT3H-AoavWqCqqM01V9A@mail.gmail.com>
 <fb31d09c-d20a-9a42-6ed2-fd74c7699dfc@microchip.com>
 <CAEyMn7bY9CisxoWcpF=zR+DYJpW+=EeWLGE_gAB3WK9hvkcuJQ@mail.gmail.com>
 <9263ef4d-7944-00bb-8e2f-b7d33e5aab87@ti.com>
 <e1901135-0433-d693-56c9-3a9fdaca1d55@microchip.com>
 <20210301133618.rzs4amh5ujwys277@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <99f92851b9ee95d01564ae01c56085eb@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_085026_100716_2F2C1A41 
X-CRM114-Status: GOOD (  10.46  )
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
Cc: vigneshr@ti.com, Tudor.Ambarus@microchip.com, juliensu@mxic.com.tw,
 ycllin@mxic.com.tw, linux-mtd@lists.infradead.org, heiko.thiery@gmail.com,
 zhengxunli@mxic.com.tw
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-03-01 14:36, schrieb Pratyush Yadav:
> I think printing the correct flash name is somewhat important. Other
> than the handful of people who are reading this thread, few would know
> that SPI NOR calls mx25l12835f as mx25l12805d or vice versa. This can
> cause a lot of confusion among people trying to debug any issues.

Unfortunately, this is kind of a mess. If multiple flash devices
share the same id, it seems to be first come first serve. The kernel
will print the name which was introduced first.

This isn't the only flash which is affected. Have a look at
   drivers/mtd/spi-nor/winbond.c
There are all kind of flash names, some of them are not even existing
as this particular string, eg. take w25q64jwm, its actually "Winbond
W25Q64JW-IM or W25Q64JW-JM".

So yes, it would be nice to have such a thing, but for now, I will
take the kernel output as a rough estimation what might really be
used on the board.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
