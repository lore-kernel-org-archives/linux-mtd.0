Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE94C433E1
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 12:05:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC0D82071E
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 12:05:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zm4CoiyG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC0D82071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tr+0U1SJr8+E3SJMXV19D6Kq4PL5C9a8f+wkOxwkVs8=; b=zm4CoiyGQz/+eQCBHdKOd0qeZ
	+1YCyLHNgbYmY0tcwJXjV7a0h/d+ehbrpyXpQ1CK/iwB7MX2XZ2EPMu8cEvpDaLZ98b0MeoIEWsH3
	4G0D49t3Og8nB0RzoFVet2iqQwLTq3mBBogsQIEWMDDsZPaomGSE1SEfQve1BQEDRt7GvXIc3nKQy
	iIUso3bhRTkbURSNHpQu3b0UkajO45cmCSdpo/gvomqNSxx7JS1QlRJVpFrPCumJdDtjVLh6i+AKJ
	Sq2tbDS87fACMWMTYJlrxmuAcOMt3EtWTC9/9S1zaE8Vm2RuDkISYpXgLpxb1bKRjdL7k4FIbMwId
	3wDdA/fqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kABDb-0006ep-Jl; Mon, 24 Aug 2020 12:04:55 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kABDY-0006dM-VB
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2020 12:04:54 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 863A729903F;
 Mon, 24 Aug 2020 13:04:42 +0100 (BST)
Date: Mon, 24 Aug 2020 14:04:38 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [RESEND PATCH v3 7/8] mtd: spi-nor: Convert cadence-quadspi to
 use spi-mem framework
Message-ID: <20200824140438.14e72ca6@collabora.com>
In-Reply-To: <00394d38-20d9-60a5-0068-5f9f023520c2@ti.com>
References: <20200601070444.16923-1-vigneshr@ti.com>
 <20200601070444.16923-8-vigneshr@ti.com>
 <a86aebbc-943d-6cb3-191c-797709692f80@siemens.com>
 <00394d38-20d9-60a5-0068-5f9f023520c2@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_080453_173393_51156432 
X-CRM114-Status: GOOD (  14.64  )
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
Cc: marex@denx.de, simon.k.r.goldschmidt@gmail.com,
 Boris Brezillon <bbrezillon@kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>,
 dinguyen@kernel.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 24 Aug 2020 17:14:56 +0530
Vignesh Raghavendra <vigneshr@ti.com> wrote:

> Hi Jan,
> 
> On 8/24/20 11:25 AM, Jan Kiszka wrote:
> [...]
> 
> >> +MODULE_AUTHOR("Vignesh Raghavendra <vigneshr@ti.com>");
> >>  
> > On the AM65x, this changes mtd->name (thus mtd-id for
> > parser/cmdlinepart) from 47040000.spi.0 to spi7.0. The besides having to
> > deal with both names now, "spi7" sounds like it could easily change
> > again if someone plugs or unplugs some other SPI device. Is this intended?
> >   
> 
> You could use DT aliases to make sure OSPI0 is always at given bus num
> (say spi7):
> 
>         aliases {
>                 spi7 = &ospi0;
>         };

FWIW, we've added the ->get_name() method [1][2] to avoid such
regressions.

[1]https://elixir.bootlin.com/linux/latest/source/include/linux/spi/spi-mem.h#L218
[2]https://elixir.bootlin.com/linux/latest/source/drivers/spi/spi-fsl-qspi.c#L810

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
