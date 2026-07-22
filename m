Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809ECC44536
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2026 13:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZrrPjI6M9jOVz1dI8L9w6WDCWK54XQ2m0T9lZpjeioQ=; b=T2/AJZg2iT47qv
	Pd9YyLBKHubkNqZZ0mRJMfSCGpYwCkHoGbluUdZz9nA6jXGmdcCFuUpf9F1KQtjdaD3twXxWYzpnT
	O2uGEq+UQ2LdeMgpY2YxZJJIHSwIMl2bJdEypCYsITLFCeKgjP6K/Sdnqs10c9jtHjcocPL9yAjJF
	3JbPi6Hq5JvyzBBLRZk0R1/JPToRwHFV0kjaVsSiTLte1jmKUkfZWpoXaHqCJRnfYrcaCNKPb8VBB
	eJTI7PBXH6igGhylf8oEWre+VNRzuNBEuzBGgXPh5KJsL+L2CQ4M9hcGvS6BNEwQxqXxDDbL3BuGF
	0GAwjQViWMxs88Bn8JHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWg7-0000000Br7O-0InU;
	Wed, 22 Jul 2026 13:08:03 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWfu-0000000Br0R-2AHN
	for linux-mtd@lists.infradead.org;
	Wed, 22 Jul 2026 13:08:01 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id B8CBD507;
	Wed, 22 Jul 2026 15:07:46 +0200 (CEST)
Mime-Version: 1.0
Date: Wed, 22 Jul 2026 15:07:46 +0200
Message-Id: <DK54G4EE7DDC.N91PU5M9S6PP@kernel.org>
Subject: Re: [PATCH 02/30] mtd: spi-nor: winbond: Normalize names
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Steam Lin" <STLin2@winbond.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
X-Mailer: aerc 0.20.0
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com> <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-2-87e5d3122244@bootlin.com> <DJRJH8H54BBB.9ZNM5OJBFG47@kernel.org> <878q73jif0.fsf@bootlin.com>
In-Reply-To: <878q73jif0.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_060750_715605_E4F70E8C 
X-CRM114-Status: GOOD (  13.99  )
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

Hi Miquel,

On Wed Jul 22, 2026 at 2:52 PM CEST, Miquel Raynal wrote:
>>> As a result, W25Q01NWxxIQ is irrelevant and would better be named
>>> W25Q01NW-Q, W25Q02JV is irrelevant and would better be named W25Q02JV-M,
>>> etc.
>>
>> OTOH if you try to search for that name on the internet/datasheets
>> you don't find anything, while the xx somehow indicates that
>> something is missing here.
>
> The datasheet is often the same for N/Q/M variants, a table close to the
> end mentions the differences. The intermediate letters have no useful
> meaning for us and IIRC they number may vary. The meanging is:
>
>         - W: Winbond
>         - 25Q: SPI NOR family
>         - 02J: Density
>         - V: Voltage level
>         - Useless information for software support such as the package
>           size or some ratings which have no impact on the software, the
>           absence of lead, etc.
>         - And then there are subtleties such as features available or
>           not, enabled by default or not, which can be disabled or not,
>           that is carried by the last letter.

I get that, but still, that part name "W25Q01NW-Q" simply doesn't
exist. I've argued with Tudor years ago, since he wanted me to use a
similar naming (w25q32jwm). I mean I don't care to much. It's like
I've said, you won't find anything about that on the web, as the
name is made up by us :)

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
