Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE11C61DB4
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2026 09:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=639WmbL52g5cGj8dT+P/e0oMV9H/DSrq3OieK7+96sA=; b=CN3KRZS+D+knTi
	x/GIVXALNzPcNzoSUGGW3H6qNnq8j6O70ShZZQy4wp+jYxI7/zec6bA/f7Ayek/nTMtM/mXgT38EP
	0NpCiWDxAMdYy0TdVVWBDYamoCQJXqKSFtGsWoz+PGoF/WAKdGYt8J6rdM0NRUyZaRUIevHlZuCqx
	EWxsfg1FuxFL+RY8OYQAEE3m6wPrRXJwGRT2u42ALS1Gb9IbpFx3BrXwE8lPn9bKCvxbfdTb39P7k
	tXqaiiGapPW8LTGdR0ctN0zSduLIdPj6ocizCnyZXsF81Pk8gm6cCSIyaBwf1HQZKTjryrer5hlP7
	sRNSY5sTGxCrCgsq33Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynvy-00000000Xig-0IxA;
	Tue, 25 Aug 2026 09:59:10 +0000
Received: from 0001.3ffe.de ([159.69.201.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynvv-00000000Xg4-283g
	for linux-mtd@lists.infradead.org;
	Tue, 25 Aug 2026 09:59:08 +0000
Received: from ehlo.thunderbird.net (unknown [IPv6:2a00:20:d234:bae8:a238:320e:c3e3:77c7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 3D738103;
	Tue, 25 Aug 2026 11:58:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1787651934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1VPB86GX6OCqmQcqxCJL58XknddeyBndznxbchDbXtk=;
	b=aND/1m1fkGnQlGEq2eSJz8Xdlw+pv8qcOa2xuwXgUy8MGEWzW3b0FOIAtbNLTHKoVW0Jb/
	t1JuxpNIYoELb77wivFhNVFNVdsRv0P9+PxXgOsC4rsITMVp5KADG+GS4cyb+FX3xZgIzf
	mH8l9BLwQCHfZ6u5rJmZ+OEyhOMgzFXN/lFPAACo2hxNcyB7GCeGTFBLURrE/Tbd690VvA
	GJnsX9WI0XclOgoVxjb1l/hLHM7QtO5k1tyY4dR5wdMdpW+gEAqnXdgpoN+FdoqJRfKblN
	FUkbLxTLM/A+TZOEuM9ArmROn1C553YlEDjgmtm6bLdqtEr0ozCwayauYMQPeg==
Date: Tue, 25 Aug 2026 11:58:53 +0200
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Takahiro.Kuwano@infineon.com
CC: mwalle@kernel.org, pratyush@kernel.org, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org
Subject: Re: Sashiko to track linux-mtd
User-Agent: K-9 Mail for Android
In-Reply-To: <87v78yimb1.fsf@bootlin.com>
References: <875x38mlk7.fsf@bootlin.com> <2vxz4iismi2m.fsf@kernel.org> <87pl19s7ng.fsf@bootlin.com> <0fe3140096bc48a8e71838362220d9f8@kernel.org> <b224c6938e084763b017c63e0aa3fa3f@infineon.com> <8733xikmb9.fsf@bootlin.com> <8733xhiqyn.fsf@bootlin.com> <87v78yimb1.fsf@bootlin.com>
Message-ID: <10CE8F35-D4FC-4CE8-B687-1154DF9915CF@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_025907_714982_DF9C585D 
X-CRM114-Status: GOOD (  11.59  )
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

Hi,

Am 25. August 2026 11:25:38 MESZ schrieb Miquel Raynal <miquel.raynal@bootlin.com>:
>Hello,
>
>On 17/07/2026 at 17:19:28 +02, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
>> Hello folks,
>>
>>> So I will make a PR for enabling it, but let's keep in mind that this is
>>> experimental and can be re-discussed at any time.
>>
>> FYI: https://github.com/sashiko-dev/sashiko/pull/336
>
>I am partially satisfied about how Sashiko intervenes in my review
>flow, here is my current feeling.
>
>About Sashiko itself:
>+ many interesting findings, worth enabling for sure
>+ most of the findings are correct, but not always worth another version
>- no possible feedback loop (eg. "this is an hallucination, stop
>  bothering us with this")
>- pre-existing issues are flagged at the same "level" as new issues
>
>About our configuration of Sashiko:
>- it takes more time to me to do the check, copy & paste dance every
>  time there is something I find really needed
>- I get Cc'ed on reviews of patches I did not receive (eg. jffs2 things)

Yeah I noticed that, too.

>In the end I would like to modify the current configuration in order for
>Sashiko to act as a regular reviewer, ie. just answer to all recipients,
>including the author:
>
>- cc = ...
>+ reply_all = true
>+ reply_to_author = true

I'm fine with the change. Let's see how patch submitters will react.

-michael


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
