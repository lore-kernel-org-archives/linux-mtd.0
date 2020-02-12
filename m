Return-Path: <SRS0=zQg3=4A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98114C3B186
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 14:52:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FFC320714
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 14:52:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kSZtHFmS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FFC320714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NusdtfKXP1NTAjvJVPEAoMEZDjDLLIT/6+Ot5eza4a4=; b=kSZtHFmSINdCis
	cOKuxvtMJ38/9kFudFSoOr3QCovDevtK8Wvit1b3eNFBWCbYmH8mIheGiZO/UreQCeho4KGxJADLh
	8QL7zQVLdfV7i7YaHMpJIZtDnqARl63PVB5bnoaUyXXs0vPSKXFJw9qC1st/u7ANxXJiUjAGicJfG
	61Ffn5NwWqLKfMaMr/AIuFTgi/vj1lhBxt4Hz7zZaYF8nPiuAEc1aaf2vzsVL4OnJz9qi7oMuiCUd
	QzBEMr7jB46G0SKWC4fYvi4aRBMHLWBlTK1GI45RjYfx4ZgVYFYtmbd+trLtySsUOUZLutq/ULmcl
	pPgjIxZTWc6bXBQySHxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1tN4-0002Al-CM; Wed, 12 Feb 2020 14:52:10 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1tMv-00022d-AO; Wed, 12 Feb 2020 14:52:02 +0000
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 276DF80F6;
 Wed, 12 Feb 2020 14:52:41 +0000 (UTC)
Date: Wed, 12 Feb 2020 06:51:54 -0800
From: Tony Lindgren <tony@atomide.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [RFC PATCH 03/14] ARM: OMAP1: ams-delta: Provide board specific
 partition info
Message-ID: <20200212145154.GK64767@atomide.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
 <20200212003929.6682-4-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212003929.6682-4-jmkrzyszt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_065201_403272_0D180EC0 
X-CRM114-Status: UNSURE (   5.67  )
X-CRM114-Notice: Please train this message.
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

* Janusz Krzysztofik <jmkrzyszt@gmail.com> [200212 00:41]:
> Now as the Amstrad Delta NAND driver supports fetching information on
> MTD partitions from device platform data, add partition info to the
> NAND device configuration.

Fine if you want hardcoded partition info :) Not sure if the partition
info coming from bootloader is any better either.. Ideally there would
be a partition table somewhere on the device like we have for disks..

Anyways, this is best merged together with the mtd patches so:

Acked-by: Tony Lindgren <tony@atomide.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
