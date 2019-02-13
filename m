Return-Path: <SRS0=N2Dg=QU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E35C282C2
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Feb 2019 09:15:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8144A222BE
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Feb 2019 09:15:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TBjbT1z5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8144A222BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HMGxQbeWbr+oCgKtgJn4ylm3zPkn5mO8KARaXHrKO0k=; b=TBjbT1z5dqXIDQ
	+o5dd1NO+JHDv/GymRGRtj981zSV1WgHzrdpkB4qjtGFwDjfBm23I1BVP8DYxVZa3F+iVqDACzUdo
	KsxhGlxcuUyYqX6ba+zCe3UYUNDlEiwFmmThrOXuPErGe1nChd3ETsF5RK7EtwMs3Fq43eV8xJTdT
	3NiXwObTwmg12OQAC6hYzJfmyvQaJJysa6Bis+EVwK5E6ZlG+kqTbBvmI5jEjzjuGOQ9LhA4LyONG
	wJyaQI3uvqJWBkI95+zR1ZYJrAanXoeSF8F+OHDVQkXgvzShRDmN55llNqc0n4Z8hl4Wi0ZLfxtVa
	WasdEWE3uKrGNu++fjTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtqdZ-0001Gy-9f; Wed, 13 Feb 2019 09:15:25 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtqdV-0001GN-CB
 for linux-mtd@lists.infradead.org; Wed, 13 Feb 2019 09:15:22 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8F9FE26DAB4;
 Wed, 13 Feb 2019 09:15:17 +0000 (GMT)
Date: Wed, 13 Feb 2019 10:15:14 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] AFS move and OF support
Message-ID: <20190213101514.7e61b8d6@collabora.com>
In-Reply-To: <CACRpkdbbRsdoryeUNAnFi94qH8JaEaW=fND6Rs4C05O72XY4QA@mail.gmail.com>
References: <20190123122910.19024-1-linus.walleij@linaro.org>
 <CACRpkdY5andeJnYJdNhTfQTbwjxBbXceBnOyBk7HWdgzqN73xw@mail.gmail.com>
 <CACRpkdbbRsdoryeUNAnFi94qH8JaEaW=fND6Rs4C05O72XY4QA@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_011521_546811_CA0653CC 
X-CRM114-Status: GOOD (  13.21  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Linus,

On Wed, 13 Feb 2019 09:40:11 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> Top posting to Boris' kernelorg address, sorry for using the wrong
> address, maybe this is why the series was missed in the first
> place :/

Nope, it's on my todo list. Just didn't have much time to dedicate to
MTD lately. Sorry for the delay, I'll see if I can review/merge it this
week.

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
