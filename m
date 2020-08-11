Return-Path: <SRS0=n6ut=BV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F771C433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2020 23:48:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9BB32073E
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2020 23:48:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Acdahiln"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9BB32073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y5qhLsfrDT6BK8ykKFvG/5ublrP92JFnIN/tOZqwViA=; b=AcdahilndxMHYGTXM6VXYy8CI
	cLb1Dym+Z8mkqgQXFOEgEqBiD3RjSsU0I8zQMD0mnNZ649m93q4pG/DqKbKHtgUmhOj/X4MM86Y2S
	1n3/jutUPoxFo6Bsr9OgTnpwKg640MoBYuU0LSa5otica02zwr1BQo0eD6f4WC/AKMk5QfaVS/8Qv
	L/ktCyI2hN+fwi5dGDXKWI5B7dEHlhldpD2g1noKTrj7yugt5b8lcUGwYk8UvjpqAYab+OZdYTEwb
	5MiUnvMViQRQvIk+EvTMbUFe/8qE1thPViE+u88krolLxzH9gnUlqy+aAbQEVZlEXRNSnx+J1PC3F
	RZYuUMUtg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5dzb-00038g-Ek; Tue, 11 Aug 2020 23:47:43 +0000
Received: from smtprelay0003.hostedemail.com ([216.40.44.3]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5dzY-00038F-TC
 for linux-mtd@lists.infradead.org; Tue, 11 Aug 2020 23:47:41 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id E6ABC18027463;
 Tue, 11 Aug 2020 23:47:38 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: hose67_3c0d1e026fe6
X-Filterd-Recvd-Size: 1725
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf14.hostedemail.com (Postfix) with ESMTPA;
 Tue, 11 Aug 2020 23:47:37 +0000 (UTC)
Message-ID: <98383342041c87a8d50fe9cef486a687c50af248.camel@perches.com>
Subject: Re: [PATCH 0/3] mtd: lpddr: Fix bad logic bug in print_drs_error
From: Joe Perches <joe@perches.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, 
 linux-kernel@vger.kernel.org
Date: Tue, 11 Aug 2020 16:47:36 -0700
In-Reply-To: <cover.1588013366.git.gustavo@embeddedor.com>
References: <cover.1588013366.git.gustavo@embeddedor.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200811_194740_997863_71918090 
X-CRM114-Status: GOOD (  11.58  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2020-04-27 at 14:00 -0500, Gustavo A. R. Silva wrote:
> Hi,
> 
> This series aims to fix a bad logic bug in print_drs_error, which is
> tagged for -stable.  The series also include some formatting fixups.

AFAICT: This series is still not applied to any tree.

Can someone please apply it?

https://lore.kernel.org/linux-mtd/cover.1588016644.git.gustavo@embeddedor.com/

> Thanks
> 
> Gustavo A. R. Silva (3):
>   mtd: lpddr: Fix bad logic in print_drs_error
>   mtd: lpddr: Replace printk with pr_notice
>   mtd: lpddr: Move function print_drs_error to lpddr_cmds.c
> 
>  drivers/mtd/lpddr/lpddr_cmds.c | 33 +++++++++++++++++++++++++++++++++
>  include/linux/mtd/pfow.h       | 32 --------------------------------
>  2 files changed, 33 insertions(+), 32 deletions(-)
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
