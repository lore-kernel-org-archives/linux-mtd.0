Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42ED4C6FA82
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Sep 2022 15:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E51zVok+I/tDuRlyD2RDWkCHrdJEn7Jkw/N+ud65C+c=; b=1ScdfvLfqWIbgrtRINtHc6Yg9/
	P7JhK63ZiqXsjnx3a7nttvx0aW0CibvlbQaHMtRQp9UB40/jOSH/ogAMayn/ZWAdvat+qN87ngEyb
	IfjkvCIX5ZQlVwrdjywJrYrlOlAQ89NLozMsTwDTRenMoel9bPWykLdS6R+6s+0ROCgefOcbh/cYn
	iSC9J1qc5HE2HudGtdbTReEqtYdAIyD3MERMs9uoQj2k1GRtJc+jczhHqbWKT58Tz2cQYO5rjaTqS
	JLkFRUzLvoa8t/oQ43hbbkTu3wHJy3AzPcKP2Fm1jkk6sJ0hrkMO2kiKpw8IZLAOzC2lHjvdDXaeM
	+9semlUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obNrb-00GKEm-UV; Thu, 22 Sep 2022 15:11:44 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obNf8-00GELU-I6
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2022 14:58:52 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id D07271250;
	Thu, 22 Sep 2022 16:58:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1663858728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4xWcgHu2sn26NJUCzsvCmM8BimqbYeFbH9tRbM367Kg=;
	b=0GAlqfhe0eMvCw6A9Kq8HVzsCHwbNt6xBL+7+U0SEk9wpIoPPMjCPAGNRuvSYRPT6b7cH6
	JR6qxBz/RH5WVb8AqW/BMg5mY69v4b3LOYzVS1gOhHubhoZcOCLlASdO841swtVT1d8okn
	QRetJ8+P0xdRk0nC9Nv5whgziYMqyiQLt96INKCfX2XKSjT8YarnP+sqIK1D+DBRmvw0XM
	Rcrn4lwFfszotvK2bKBq9+8qL4an6kJfu8XhCQm+r9oZJ9X5+hhNDUCQ/Dfi5HUMdomUvh
	R+Nty2I1UunQU3mnTt8zjj0fLqyxXu3r9IV8TgIWOrVi87Sc/YYplrBdwA9zPA==
MIME-Version: 1.0
Date: Thu, 22 Sep 2022 16:58:48 +0200
From: Michael Walle <michael@walle.cc>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Takahiro
 Kuwano <Takahiro.Kuwano@infineon.com>, Hongyu Ning <hongyu.ning@intel.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Revert "mtd: spi-nor: core: Return error code from
 set_4byte_addr_mode()"
In-Reply-To: <YyxxXlAAa7R47uYI@black.fi.intel.com>
References: <20220922134824.46758-1-mika.westerberg@linux.intel.com>
 <a383698ae4a8e400f4961da5cc42663c@walle.cc>
 <YyxuLAsc7XXo7yOC@black.fi.intel.com>
 <1d7659f23b48acee3117ebabd0c7a5cc@walle.cc>
 <YyxxXlAAa7R47uYI@black.fi.intel.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <82a13281537db111e74c6a84ab964e85@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_075850_810338_25656915 
X-CRM114-Status: GOOD (  16.11  )
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

Am 2022-09-22 16:29, schrieb Mika Westerberg:
> On Thu, Sep 22, 2022 at 04:17:10PM +0200, Michael Walle wrote:
>> Am 2022-09-22 16:16, schrieb Mika Westerberg:
>> > On Thu, Sep 22, 2022 at 04:12:17PM +0200, Michael Walle wrote:
>> > > Am 2022-09-22 15:48, schrieb Mika Westerberg:
>> > > > This reverts commit 08412e72afba3a2daef3e7f3378c3753255a0017.
>> > > >
>> > > > The Intel SPI-NOR controller does not support this opcode so the driver
>> > > > ends up returning -EOPNOTSUPP and that makes the SPI flash chip probe
>> > > > fail like this:
>> > > >
>> > > >   [ 12.291082] spi-nor: probe of spi0.0 failed with error -524
>> > > >
>> > > > Whereas previously it worked just fine (and hence the return value
>> > > > probably was ignored in the first place).
>> > >
>> > > Can't we just ignore that return code then?
>> >
>> > Isn't this revert just doing that? ;-)
>> 
>> No? It also ignores other (valid) errors.
> 
> Okay, I will do that and ignore just -ENOTSUPP in v2.
> 
> However, there is also similar call in spi_nor_restore() where the 
> error
> also gets ignored so I wonder if it was originally intentional.

Yes that was intentional, because spi_nor_restore() returns void.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
