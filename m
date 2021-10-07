Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC90C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 07:38:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFC1760F22
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 07:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EFC1760F22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTD+wmfSEiwpe8T7tfLp6/JVa6vFsHgcCxGc/QYsQkw=; b=uygWoI+rQUI7CSDFP3nDOuFQwX
	lz4xNAVEkXvwRyIi27Hf42oTtoUbkEUjRqpjS94f/DASopA/52UlgEMyqvX8wCOluH8I7rHi9Q7T8
	QD7VrFKU1q1fDQWgn5GrkWBeNHgsbLcL4Qcb4ENJr53vyKQs6uuKnMdhutgmjaAeKytXLGoDl8pCt
	n061wpml+hZx5fcd1KoyOby66i0RXPhjAWHTWnGtkrnZJTVk8o593VNBTJjYPgExV0qC7rOwRpsE4
	yB/sCO1vL28ORmrb1SsL9FT0u9MFxOtYS/7zUwuD6IYA2Uc4OoKsRpQNXWKT25dWPwhW5KlDwmvKT
	3xcU+wSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYNy9-00GRn3-Ag; Thu, 07 Oct 2021 07:37:33 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYNy6-00GRlx-AA
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 07:37:31 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id BD00322234;
 Thu,  7 Oct 2021 09:37:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1633592248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XjCSY4XhccjbtaclWk/3U2lD3pRMWvVvTqTn+9l+6po=;
 b=WXlwBRgzZcy5UO+kZECN816WJnCfTYuwc9asjo694LCh6Y5thB033LNI+dj7v87/02kc5Z
 9/UBScEaIiDw4K9KkHP1HJ4BNniIdeS4Urb3DZ20uqPA0qZhRuZQcAJWlUPR0xAwEg2qaa
 6nsflXPbPtGQeElflFOwUeUMU441QIU=
MIME-Version: 1.0
Date: Thu, 07 Oct 2021 09:37:27 +0200
From: Michael Walle <michael@walle.cc>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (EXT) Re: (EXT) Re: [PATCH 1/2] mtd: spi-nor: micron-st: sync
 flags of mt25ql02g and mt25qu02g with other mt25q
In-Reply-To: <0e2ad27b00d85c1dfa489d91b54d2a3af41f5edb.camel@ew.tq-group.com>
References: <c7b6c666aef9a8a2195acabe9954a417f04b6582.1627039534.git.matthias.schiffer@ew.tq-group.com>
 <f3dbab898e9f1946129e5733095bdf3c@walle.cc>
 <3258026683c916a3a42e98ba76628228cddacb23.camel@ew.tq-group.com>
 <969e9169b77bb314aaa2e97789c76c00@walle.cc>
 <0e2ad27b00d85c1dfa489d91b54d2a3af41f5edb.camel@ew.tq-group.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <6ea1852ddc390cf18db0ae927b88b2b9@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_003730_541848_D0702D4C 
X-CRM114-Status: GOOD (  24.84  )
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

Am 2021-10-07 09:18, schrieb Matthias Schiffer:
> On Thu, 2021-10-07 at 09:08 +0200, Michael Walle wrote:
>> Am 2021-10-06 14:32, schrieb Matthias Schiffer:
>> > On Tue, 2021-07-27 at 09:09 +0200, Michael Walle wrote:
>> > > Am 2021-07-23 13:27, schrieb Matthias Schiffer:
>> > > > All mt25q variants have the same features.
>> > > >
>> > > > Unlike the smaller variants, no n25q with 2G exists, so we don't need
>> > > > to
>> > > > match on the extended ID to distinguish n25q and mt25q series for these
>> > > > models.
>> > >
>> > > But why shouldn't we? What if there will be another flash with
>> > > the same first three id bytes?
>> >
>> > How do you suggest we proceed here? At the moment there are entries
>> > matching on 0x20b[ab]22 (ignoring the extended ID) with the name
>> > mt25q[lu]02g.
>> >
>> > Should I change these entries to match on on the extended ID
>> > 0x20b[ab]22 / 0x104400 instead when I add the bits for the features
>> > specific to the variant, removing support for other 0x20b[ab]22
>> > variants that may or may not actually exist? Keeping both entries (with
>> > and without extended ID match) would preserve compatiblity with such
>> > variants, but this approach seems problematic to me as well, as I can't
>> > even give a name to the more generic entries (and there is no natural
>> > extension of the n25q naming scheme to a 2G variant).
>> 
>> Mh, what do you think of adding three entries and make the last one,
>> the one with the short id, as a fallback so to speak. This should
>> retrain backwards compatibility, right? It should probably have a
>> comment because the order will matter then.
>> 
>> -michael
> 
> Is it okay for multiple entries to use the same value for the "name"
> field? In the existing definitions I couldn't find any example of
> different ID matches mapping to the same name.

You're right, thats probably not good. Ok, if there is no objection
from Tudor, I'd say we change the entry of the mt25 variant to the
longer one. If there is a flash chip out there which matched the
shorter one, but not the longer one, thats probably not a mt25 anyway.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
