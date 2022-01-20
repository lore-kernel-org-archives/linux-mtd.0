Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E90AC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jan 2022 08:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNtfD8KHl9iQCYr4Dw1juABNz9CAHqelkRjt81bjz/4=; b=MA6xpxdF6LPkSL7rMZPNUr2aU1
	2P8fFAaYINlUNpvMt4wf6+e/ipWAma9gBKBPFXG2TQdJJl5NXM44gkYGKa7mt8OrV6g7xKexxncCB
	cFI8u9JJxDEnTa28znpVALx6k44S2uxbADMIEG4CSAYdbFXIClewouPWagEHnyl82k/lE4lklip9F
	a1PuIULRn7ghDUbdmeUgBYZGLCb2Yzm2CRumlXG6m6GyyHslL0TDzXMcshbN1o1orIMVViFhhl1v8
	17fe7UPmSfHP4UxKJLyVPNPMk6T8zJTt2FOXsXgFK1G/lZcZ9Nz7sZmjih1JyPkgFyNNnqsxVlPAL
	2+03+9Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nASVW-009cyL-J5; Thu, 20 Jan 2022 08:09:22 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nASUQ-009c7J-5v
 for linux-mtd@lists.infradead.org; Thu, 20 Jan 2022 08:08:16 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id C636C22247;
 Thu, 20 Jan 2022 09:08:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1642666091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/+vH3Wwc8Lp21zZdi/9twt8f8dnIqFnq/9eYnIq/2tc=;
 b=PvuTcP77Zh3ny8IEhmFEjIKL4zc4XouUACJI/8VdOufptrwvQlLuK8l+0u6pH1tcnKURHE
 pOpEJqGW2jm7F68o0qxkNYkIJRMa57XIIbkGtH3mJAAhOB6UOfPJgYw7SRhlvkKWDbINNW
 5GiNtvhGglzT/m369Nep53bFhfkMk3U=
MIME-Version: 1.0
Date: Thu, 20 Jan 2022 09:08:09 +0100
From: Michael Walle <michael@walle.cc>
To: David Bauer <mail@david-bauer.net>
Cc: Nick <vincent@systemli.org>, Tudor.Ambarus@microchip.com,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] mtd: spi-nor: disable 16-bit-sr for macronix
In-Reply-To: <8d578f8e-9cfd-58a0-940f-b085074c5d30@david-bauer.net>
References: <20211227091638.177917-1-vincent@systemli.org>
 <20211227091638.177917-2-vincent@systemli.org>
 <0db13110-ee6f-2e02-abf9-d5b9eecafcb4@microchip.com>
 <a187ec1b-3bae-659d-86c5-4e2b3403eca4@systemli.org>
 <22bd791798d15d74060c44f65620921c@walle.cc>
 <8d578f8e-9cfd-58a0-940f-b085074c5d30@david-bauer.net>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <3d2837220261f2ba51569bb54ef334c7@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_000814_977967_62972A80 
X-CRM114-Status: GOOD (  17.90  )
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

Hi David,

Am 2022-01-19 21:36, schrieb David Bauer:
> On 1/19/22 16:49, Michael Walle wrote:

>> That being said. I'd prefer to have a sane default for that
>> flag - which is to _not_ set it by default. For now, we can
>> just remove the flag from spi_nor_init_default_params() and
>> move it into the manufacturer default init. Then we can
>> go through the flashes and remove the flag there.
> 
> I was working on a similar series in parallel - and i just want to
> confirm this before i submit it. [0]
> 
> Your take would be to remove the flag from spi_nor_init_default_params
> and place it in all vendor init-calls, right?

correct.

> My current take would be to add a new flag which denotes flashes that
> only have a single 8-bit SR, no second SR / CR.

but that new flag has the same meaning as the current one, no? In fact
I see you are just clearing the 16bit flag if the 8bit one is set.

Therefore, you have to bits for just two states. We want to
use less flags and IMHO this isn't good for readability.

Also it doesn't fix the bad default. I doubt anyone adding
a new vendor/flash is aware that the default is a WRSR with
16bit SR. Eg. I just had a quick look at gigadevice and it
doesn't seem to support this neither. Now depending on the
SFDP content the flag is overwritten anyways. But still.
I'd really like to get rid of this and just identify the
flashes that doesn't have an opcode to write the second
status register/configuration register.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
