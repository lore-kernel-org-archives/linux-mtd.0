Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC2AC4CECD
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:03:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8379220B1F
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 19:03:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qw0Bb22Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8379220B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O94nG2RPtN0FEJTXtRgcPiFBxo5wInyyufHbvbg18k8=; b=Qw0Bb22QLkbvi3
	fGwCvsXU2C44HlRBpc3hOQaAUm/yduIeSovNxevRmE3fwgxpgxRVL8ULxo7A0F6u7r5pWT4Z8HQPv
	UlXqh+aNgTXznlxaK6E39Yqdx8MqcAzJPRWC6DyJI7JaBXpMQQ40+7erorULp3Q7mrb5lQl2WiCxM
	ykUWNvNLH6Hk57BDZsiUEU0odjH9EBjMk3JSQ5JjwhlHGeVerDPRKJASF6RMTaB70XRx0tGN0K3iV
	xkRE5OqPjVjCV6ntydOUlFzWD2M8nOgIysIo1HwYoFyAYM7IcivmWuBmEUQtnteDIk675m3Yy7LJA
	omS3RH2JPLYQvGePTiOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT92W-0005SF-D2; Mon, 27 Apr 2020 19:03:36 +0000
Received: from smtprelay0076.hostedemail.com ([216.40.44.76]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT92T-0005Rl-UZ
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 19:03:35 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id B39EF837F27E;
 Mon, 27 Apr 2020 19:03:32 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: tub42_1ecb9cba3653a
X-Filterd-Recvd-Size: 1529
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf08.hostedemail.com (Postfix) with ESMTPA;
 Mon, 27 Apr 2020 19:03:31 +0000 (UTC)
Message-ID: <ce8be38d71da0a9020a42359152dad7ee217d18c.camel@perches.com>
Subject: Re: [PATCH 3/3] mtd: lpddr: Move function print_drs_error to
 lpddr_cmds.c
From: Joe Perches <joe@perches.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, 
 linux-kernel@vger.kernel.org
Date: Mon, 27 Apr 2020 12:03:30 -0700
In-Reply-To: <5cc0d2e83e971693d974235608c8d96fe94c849d.1588013366.git.gustavo@embeddedor.com>
References: <cover.1588013366.git.gustavo@embeddedor.com>
 <5cc0d2e83e971693d974235608c8d96fe94c849d.1588013366.git.gustavo@embeddedor.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_120334_046308_54A7993E 
X-CRM114-Status: UNSURE (   7.60  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2020-04-27 at 14:04 -0500, Gustavo A. R. Silva wrote:
> Function print_drs_error is only used in drivers/mtd/lpddr/lpddr_cmds.c
> so, better to move it there.
[]
> diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
[]
> @@ -94,6 +94,39 @@ struct mtd_info *lpddr_cmdset(struct map_info *map)
>  }
>  EXPORT_SYMBOL(lpddr_cmdset);
>  
> +static inline void print_drs_error(unsigned int dsr)

There's no need for inline as it's used once.



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
