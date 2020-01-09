Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D78C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 20:06:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05A202072A
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 20:06:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MeoZbbGF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="YNmnQe3l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05A202072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WpwTjxTxa5FTqyGJ1xJUNbvP/XYeKEbDAA3K0gZeRuw=; b=MeoZbbGF/ObBBF
	M6L06ElpeQ/yqT91nTbR2bGyNBPwquW+jE1Ua2HWZAKHbHvNXLkNN3pHixQ+O4mLXJ8gmDpd4GyZw
	SFi9doQseLAW4mXM9XQxXVAk6N1YD/GW7L0cnUhSZccLQJt9p5IT/x42zcTnns33h7ck+VL7n2HDO
	618uqYJTsdmI33rfrkwv06fmk+iuff26eJCytrwPw/t/GnYgsLGUTIRnjRj/DP4UP56UQYBrsrl8b
	PgchGNT1Recl0786XzeJ8nDarxklbtMhDHMplz6Z6gvL5NHqrhjiBK85O0+awutBq6suKHmghDA6e
	hS6iA6DlBcA1zpScwQQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipe4P-0007x2-D2; Thu, 09 Jan 2020 20:06:17 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipe4L-0007wK-5l
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 20:06:15 +0000
Received: from localhost (87-49-44-45-mobile.dk.customer.tdc.net [87.49.44.45])
 by first.geanix.com (Postfix) with ESMTPSA id 6CE09C1D;
 Thu,  9 Jan 2020 20:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1578600340; bh=JaB1eLjsLFXS4Bw5ZnorAPh6OPd6x2/+HvHsJ3LP8ns=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To;
 b=YNmnQe3lcH+JzGJMTUYH/MXNRwySzrgLolkxKVpcq8x/MY7R/RSyviDuRFR6/b6aP
 0wdRck4AJC9tD8jp8VlyJFfcVVRTmmIYOjzxP1ZkZx6BF5fUD7W1ytMV5PGG1ZrRlG
 ijbvXPpATkUErqldO9L8Cd9fpNdRyqfOtKrxHnUlQ6qaFAj/U7ZJs5mdr8Y4UJ45eO
 4Z9n2sDeam9yBqQCyjbF5xD0RG+7l3vd5sQwbMJDaAi1h7xZ87ox8fCffhmA4KYNv7
 MZkM5/D4SfT83+RefCzQJ4kinpG1et3M0O+BSHnsJ/XEUxm3hCQ7x4RsSaqJZc3B0K
 cpFKgSTeowEgQ==
From: Esben Haabendal <esben@geanix.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: fix the suspend/resume issue
References: <1578589556-683-1-git-send-email-han.xu@nxp.com>
 <20200109200127.0ace18cb@xps13>
Date: Thu, 09 Jan 2020 21:06:07 +0100
In-Reply-To: <20200109200127.0ace18cb@xps13> (Miquel Raynal's message of "Thu, 
 9 Jan 2020 20:01:27 +0100")
Message-ID: <87v9pkmm34.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_120614_082254_42351E2D 
X-CRM114-Status: GOOD (  10.51  )
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
Cc: vigneshr@ti.com, richard@nod.at, s.hauer@pengutronix.de, sean@geanix.com,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 martin@geanix.com, Han Xu <han.xu@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Miquel Raynal <miquel.raynal@bootlin.com> writes:

> Hi Esben, Han,
>
> Han Xu <han.xu@nxp.com> wrote on Fri, 10 Jan 2020 01:05:56 +0800:
>
>> fix several issues when system suspend/resume,
>> 
>> - leverage the runtime pm for system suspend/resume
>> - enable the clock before register access
>> - re-apply timing settings
>> - set the proper pinctrl state
>
> Esben are you fine with this patch?

It sounds like something that should probably be 4 separate patches.

> Or maybe Han you could take over Esben's patch and extend it?

I don't see why my two patches, which covers point 1 and 3 in the list
of issues covered by Han's patch, should not be merged.

Han, would you mind re-spin your patch to two separate patches covering
the remaining issues

 - enable the clock before register access
 - set the proper pinctrl state

/Esben

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
