Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B9AC282C5
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 15:23:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC9462184C
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 15:23:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EZUTANo3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC9462184C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O88+8/BGIPetafsBvZ/4nh9OSTwpDfwLrINIbFSnFPs=; b=EZUTANo3Ps+/GIQjgirjwaXZG
	cTK83OWDYzNzU69WkHbk1pbSh44kB8gDr1PYgPWWd46d9Tl6ByqPo8D/ga7zj4NUdlWDp0IGxPWTd
	TL1LyjJBmMUWYD3JwV/cEH/EQ8gDQvXjMTam1ve/f4mzFv3fJVNpuxqhg3K0eJK9d0rYEdkkPLxU+
	NH5XAB4AnK5ob26lank+fDRPAeM4uYoRakC0P3BgVaAZdH9nsFRuTH/iunfx0BVGMGdoHhSyO9HKY
	JUnEmwRe42qyBN1NaCkdfgJ+gJgnYO9ih08acj8dMlzBsZperXYdPbrehPV7FmvhDLFwS8s7mj04y
	k2Fb8kIaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmgqr-00042M-Rz; Thu, 24 Jan 2019 15:23:34 +0000
Received: from mx2.mailbox.org ([80.241.60.215])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmgoe-0002cN-I3
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 15:21:57 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id 269DBA1A52;
 Thu, 24 Jan 2019 16:21:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
 [80.241.56.125]) (amavisd-new, port 10030)
 with ESMTP id xuN7I12qsPvY; Thu, 24 Jan 2019 16:21:11 +0100 (CET)
Subject: Re: [PATCH v5] mtd: spinand: Use the spi-mem dirmap API
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
References: <20190124145643.3195-1-bbrezillon@kernel.org>
From: Stefan Roese <sr@denx.de>
Message-ID: <997074a6-fcb0-66b3-e7df-a9250b80a582@denx.de>
Date: Thu, 24 Jan 2019 16:21:07 +0100
MIME-Version: 1.0
In-Reply-To: <20190124145643.3195-1-bbrezillon@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_072117_094862_3477D41E 
X-CRM114-Status: GOOD (  15.05  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 24.01.19 15:56, Boris Brezillon wrote:
> Make use of the spi-mem direct mapping API to let advanced controllers
> optimize read/write operations when they support direct mapping.
> 
> Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Stefan Roese <sr@denx.de>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> Note that this patch now depends on [1] and [2] and should not be
> queued for 5.1 but for 5.2.
> 
> [1]https://patchwork.kernel.org/patch/10772067/
> [2]http://patchwork.ozlabs.org/patch/1030479/

Works just fine (limited testing only yet) with these 2 patches above
applied, so:

Tested-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
