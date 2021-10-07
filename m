Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE31BC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 07:09:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C098B61215
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 07:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C098B61215
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rd1NV2R51OY72oyq+hYGWaWIbcp7+Cp1NRkGVqgKJx8=; b=wntFNBdVM5asJ5DrTe8dhkor5R
	85XL5P/o4IRZysfL/edAEc17Ffb2hhcTqM/lXiwxq1Nz9vq+UpzeYsTDhYvNnaRg35dsxz06vs1cP
	TlicCbqj8i5OmpaAGJa/1xDcIBqKrBOl+HZi2bb+TlXJqZrdBRGN4Fhhl+lIZE7zwnduFefgaBQfD
	E9mMInb6p33zB4Gnm/CQsQk+80tdIdiZI7cmAfevq7azwGrY6/KgtUifncnLUwKoY3nAl/CMoh19z
	7EBI3E6CYXdbVLdjHBWNmIGSJsUBt6aKt3iZyvH8LTCJbPmE0HiJNgDtRJSaVjVz5158JFrxpewSy
	xtFeMpeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYNW1-00GN46-SF; Thu, 07 Oct 2021 07:08:30 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYNVx-00GN1S-NP
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 07:08:27 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id E4EB322234;
 Thu,  7 Oct 2021 09:08:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1633590499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UFkVEvCjAWNe1QtX4/ziCIztrpKNnKkz4actHzZezx8=;
 b=aKYH/nVwGDBvOfZBOVnT/4CPDNcJAjCrkss/MEKFfo5D91kH5o8NzBK19NbygfDvyetIgE
 9sC5gFj7rWjfscWxkfICQstMZCbryJpSLEVV40cvKKHuVGDnfO9ZJTeVa+/D4zNLrB/z+v
 UVN3+u1Jf3G7P0G+yUurU0gBdIk6FrQ=
MIME-Version: 1.0
Date: Thu, 07 Oct 2021 09:08:18 +0200
From: Michael Walle <michael@walle.cc>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (EXT) Re: [PATCH 1/2] mtd: spi-nor: micron-st: sync flags of
 mt25ql02g and mt25qu02g with other mt25q
In-Reply-To: <3258026683c916a3a42e98ba76628228cddacb23.camel@ew.tq-group.com>
References: <c7b6c666aef9a8a2195acabe9954a417f04b6582.1627039534.git.matthias.schiffer@ew.tq-group.com>
 <f3dbab898e9f1946129e5733095bdf3c@walle.cc>
 <3258026683c916a3a42e98ba76628228cddacb23.camel@ew.tq-group.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <969e9169b77bb314aaa2e97789c76c00@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_000826_166919_A71EF353 
X-CRM114-Status: GOOD (  18.38  )
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

Am 2021-10-06 14:32, schrieb Matthias Schiffer:
> On Tue, 2021-07-27 at 09:09 +0200, Michael Walle wrote:
>> Am 2021-07-23 13:27, schrieb Matthias Schiffer:
>> > All mt25q variants have the same features.
>> >
>> > Unlike the smaller variants, no n25q with 2G exists, so we don't need
>> > to
>> > match on the extended ID to distinguish n25q and mt25q series for these
>> > models.
>> 
>> But why shouldn't we? What if there will be another flash with
>> the same first three id bytes?
> 
> How do you suggest we proceed here? At the moment there are entries
> matching on 0x20b[ab]22 (ignoring the extended ID) with the name
> mt25q[lu]02g.
> 
> Should I change these entries to match on on the extended ID
> 0x20b[ab]22 / 0x104400 instead when I add the bits for the features
> specific to the variant, removing support for other 0x20b[ab]22
> variants that may or may not actually exist? Keeping both entries (with
> and without extended ID match) would preserve compatiblity with such
> variants, but this approach seems problematic to me as well, as I can't
> even give a name to the more generic entries (and there is no natural
> extension of the n25q naming scheme to a 2G variant).

Mh, what do you think of adding three entries and make the last one,
the one with the short id, as a fallback so to speak. This should
retrain backwards compatibility, right? It should probably have a
comment because the order will matter then.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
