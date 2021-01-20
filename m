Return-Path: <SRS0=AumS=GX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA881C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 10:51:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54C0B2070A
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 10:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54C0B2070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XKAt6LeEFWyPjVeo6AM82qYFrStYRxTwm8hdO/qL3Wc=; b=mkzPvQfVUcMXuO5h+oRH868HR
	LUZ8AOif5dE6oSoyCoEYbcriHLZj4kx3UrxjOlhio/fk0IwqCewxqQTK6mHjC5YiNXWhatfpURFS4
	x0TpWAOO9mCw71dwhMwOogyig3ap/pd9OnUME2GX2IWv9YkB5DAobESdAO1+uaGS1PuyS/48yptAV
	XM+D62bJr7W9yu+OTSdN3QjngM9buicm/GCz2o/9zhTtMK9JUV3VE1NdTpeG4c5YQqIIYA7Li7TUz
	EFR39xv3qNF3z92k1xE9tRIe1i4cT08Nui9Ror0BCB1y6O1yUv9MU8MbS63I9DS48XUhgcvu+Y0Y6
	pJJS3J6qQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2B3v-0003Es-Cs; Wed, 20 Jan 2021 10:50:07 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2B3s-0003EJ-GQ
 for linux-mtd@lists.infradead.org; Wed, 20 Jan 2021 10:50:05 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 81887181CBDE1;
 Wed, 20 Jan 2021 11:50:01 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 7KSfT-Iu1jtL; Wed, 20 Jan 2021 11:50:01 +0100 (CET)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id xicYdwUnWqyp; Wed, 20 Jan 2021 11:50:01 +0100 (CET)
To: Rouven Czerwinski <rouven@czerwinskis.de>, linux-mtd@lists.infradead.org
References: <875z3tia5a.fsf@czerwinskis.de>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Organization: sigma star gmbh
Subject: Re: Test failures on NixOS unstable (gcc10?)
Message-ID: <ca57d475-2a66-0146-3896-977c77c84e6b@sigma-star.at>
Date: Wed, 20 Jan 2021 11:50:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <875z3tia5a.fsf@czerwinskis.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_055004_666800_BFFD426B 
X-CRM114-Status: GOOD (  11.54  )
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
Cc: viric@viric.name
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 1/19/21 9:49 AM, Rouven Czerwinski wrote:
> mtd-utils within NixOS automatically executes the tests, and those have
> been failing since middle of 2020 [1]. I tried locally and can reproduce
> on current nixpkgs master (latest available packages), I am attaching
> the test-log as instructed by the test output. I think those failures
> are due to NixOS using gcc-10 since then.
> 
Unfortunately, I have not yet been able to reproduce this.

The unit tests seem to work fine on my Fedora system with gcc-10.2.1,
so this might be related to some other change at the time?

I remember cmocka being a bit fragile from the time the unit tests where
added. The "--enable-unit-tests" configure option tries to manipulate the
CFLAGS from within the configure script to make it work. Is your build
system perhaps attempting to set the CFLAGS externally at make time?


Regards,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
