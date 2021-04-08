Return-Path: <SRS0=gt70=JF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F4EC433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 06:57:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93C5661040
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 06:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93C5661040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=greYCKlZH7Ava1yZwBZwfPjomF72gUusd8QKQ6Pko9s=; b=bajpZ/47RDHxqbBQryGoswHhU
	KCQZrRPE6yKGlU5RCeApIOzsRyqSRAcB/DHhYR+Ocm3ie578H98kkPJOyy6NRKocSP3tVDFghwy7Q
	e9XGYhLSFq8q+gdHrex8IB4wXPb2pLb4MOD8QtPcptAmFjey3prcc7jgdogHQLio1xBFJ4y+78URI
	pTnTPPone72FThTJll2YLeXq3M+s9GrBeZBePHWO9p8lQmWufDvMbn+8FjHtET3Z3ncjITWGd8kmg
	+ukiZblBrxboes12XmpcH1kYlqMPvfbHEn/mpy0G3uUem5ZO76v7kv6/LC45uuul+Pm99ZD7excPT
	qCsklcquA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUOa4-0078RH-Gr; Thu, 08 Apr 2021 06:55:56 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUOZv-0078Qw-8b
 for linux-mtd@lists.infradead.org; Thu, 08 Apr 2021 06:55:51 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 8DBAE2224B;
 Thu,  8 Apr 2021 08:55:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1617864945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T/Ib6E1aHyQ0zhhtE0Z7gd1zjY5vFtQFqY5uVvY+Uv0=;
 b=u/vC2TGnRp0P8lItXAZXWGe1sH6DNKY5I6Icz++fuvrfjfZiDtT/MvOWh6SduMAQimbj8h
 Yx0AQQJz1lxWZKonpLYAznp+3VjVw3iLJWq+K96n3Tsj+9mZH75BHtJnYHhXQUsRDNR3vD
 k8QXM8yPUYfIvo/rKPXE1U5MQebbBEg=
MIME-Version: 1.0
Date: Thu, 08 Apr 2021 08:55:42 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-api@vger.kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Subject: Re: [PATCH] mtd: add OTP (one-time-programmable) erase ioctl
In-Reply-To: <c8f6bd61-528e-0353-aa23-aaec2be2b3ff@microchip.com>
References: <20210303201819.2752-1-michael@walle.cc>
 <c8f6bd61-528e-0353-aa23-aaec2be2b3ff@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <904d986fbd6f718cf8b7b9fc54b339d4@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_075547_504141_8DD7BC60 
X-CRM114-Status: UNSURE (   7.61  )
X-CRM114-Notice: Please train this message.
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

Hi Tudor,

Am 2021-04-08 07:51, schrieb Tudor.Ambarus@microchip.com:
> Would you please resend this patch, together with the mtd-utils
> and the SPI NOR patch in a single patch set? You'll help us all
> having all in a single place.

This has already been picked-up:
https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/commit/?h=mtd/next&id=e3c1f1c92d6ede3cfa09d6a103d3d1c1ef645e35

Although, I didn't receive an email notice.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
