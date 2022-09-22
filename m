Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4E4C6FA82
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Sep 2022 14:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hty9dgv5Jh42ESqa5EsCxTRqB8ODXVE0yRhxqhVeXwY=; b=K8alCEv1iwgjVo4e4wkl/+7Jxt
	W9dwBSAvODZT1gbgf2NBNoepj/qZSYgZtGMu+vzGqke/wl4CGm0/y/dUhrjAooaWQM/FvOlE96tZw
	th9X21mZD4XgVj76/RSNbPwMxPfKzAyuldOPf+XuVHpz+qS2FxrzfmdROoV7GJmbkjTiiOP2/6Q8/
	17TKox8YqThZ/EMTT2ncyT4dI/pOFEl8Gie4l6XCVxct1LwNP9jUSU7RbhknZpRKmQGA86qf1xViS
	ouV0Jh2KiAblbrZqAa2h22w4VCzfItNLj866IGoUzlI/zyFmwxlfe4tOTvRg00BUSFGwVxfhnXzP7
	qWeabqyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obN0s-00FwOD-G4; Thu, 22 Sep 2022 14:17:14 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obN0p-00FwMa-R0
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2022 14:17:13 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 5514A1D4A;
	Thu, 22 Sep 2022 16:17:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1663856230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZShzJj755EFR4ys1SrXKb33NJ9pmqlil8N+hqDQBLoE=;
	b=uZ2/jKJRdMaJzxoaPD36ce00vrFkq13U4bAJESnMVWovTdQGefCPPBey8YFwq1f8KdqmvX
	1sBneeKFU/tnA60L/Yb+UKU4MJVCYTow1cNL3vcM/E9GeLSD1PhPei/miH4D2/0U3Muxo5
	dBFQlj12CWBk0VDb9nAZrweN0mi3of0xDHk7FF8nYaBj6PuyA9FCI5ynflv73OMsnyM8FB
	tbHEOENOfyv4KTdgxZFmhHD7UHoAiZ8lHyftlSPeDPALHiKMxxIW4LwKNpPROSS53oRWau
	ums/3N4+VOSqWUZ6B9wblxQqwCfDNj4D95H//jTFhqt1ZEStjF2AdtwDPK2Q4g==
MIME-Version: 1.0
Date: Thu, 22 Sep 2022 16:17:10 +0200
From: Michael Walle <michael@walle.cc>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Takahiro
 Kuwano <Takahiro.Kuwano@infineon.com>, Hongyu Ning <hongyu.ning@intel.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Revert "mtd: spi-nor: core: Return error code from
 set_4byte_addr_mode()"
In-Reply-To: <YyxuLAsc7XXo7yOC@black.fi.intel.com>
References: <20220922134824.46758-1-mika.westerberg@linux.intel.com>
 <a383698ae4a8e400f4961da5cc42663c@walle.cc>
 <YyxuLAsc7XXo7yOC@black.fi.intel.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <1d7659f23b48acee3117ebabd0c7a5cc@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_071712_060246_9FABD732 
X-CRM114-Status: GOOD (  10.03  )
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

Am 2022-09-22 16:16, schrieb Mika Westerberg:
> On Thu, Sep 22, 2022 at 04:12:17PM +0200, Michael Walle wrote:
>> Am 2022-09-22 15:48, schrieb Mika Westerberg:
>> > This reverts commit 08412e72afba3a2daef3e7f3378c3753255a0017.
>> >
>> > The Intel SPI-NOR controller does not support this opcode so the driver
>> > ends up returning -EOPNOTSUPP and that makes the SPI flash chip probe
>> > fail like this:
>> >
>> >   [ 12.291082] spi-nor: probe of spi0.0 failed with error -524
>> >
>> > Whereas previously it worked just fine (and hence the return value
>> > probably was ignored in the first place).
>> 
>> Can't we just ignore that return code then?
> 
> Isn't this revert just doing that? ;-)

No? It also ignores other (valid) errors.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
