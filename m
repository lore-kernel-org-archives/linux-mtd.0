Return-Path: <SRS0=ZvR1=RQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A97EC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 10:56:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0875B2147C
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 10:56:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cZkc12u0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0875B2147C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3XfX32k9hJIeWQmeOXxXXcsuaTd9k9PoAlWoOb2KCmg=; b=cZkc12u0KQQyXQ
	+MSOggrOvYWP/XyjKHEDqc5kL18s85jATIUhWjGynX4vT3Anzd9EOKvU9VaORmGvq0OA4wAcY3O8s
	35vZqzoK+0zFg9qEZjYtgbM23pd10Hw1qUDJoL2Jsref9XSpTV1r8jyuS1iXR0OHphjQBniSdrt6y
	u0VQAWuTxOm8jMSFzIDvoi0ACi3xoAznVb/qmUA/VlOdyAap4KgurQkH+kr0TxbUjL+JuzonPUHjr
	34D+udigP1COHlbTUkL2bixt5objDzp20w7/DyClqKxFQfykdUNGsSLGFx+I7L+mpXQtrIgBt8jcQ
	gX8pgDItF7gdZEdioABQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h41Yi-0006FG-Pp; Wed, 13 Mar 2019 10:56:28 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h41Yf-0006Ew-2m
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2019 10:56:26 +0000
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Mar 2019 03:56:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,474,1544515200"; d="scan'208";a="125078057"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by orsmga008.jf.intel.com with SMTP; 13 Mar 2019 03:56:18 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 13 Mar 2019 12:56:17 +0200
Date: Wed, 13 Mar 2019 12:56:17 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH v3] spi-nor: intel-spi: Avoid crossing 4K address
 boundary on read/write
Message-ID: <20190313105617.GU2588@lahna.fi.intel.com>
References: <20190313082120.17913-1-alexander.sverdlin@nokia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190313082120.17913-1-alexander.sverdlin@nokia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_035625_166480_D8818198 
X-CRM114-Status: GOOD (  15.40  )
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
Cc: Bin Meng <bmeng.cn@gmail.com>, "Porte,
 Romain \(Nokia - FR/Paris-Saclay\)" <romain.porte@nokia.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Fabreges,
 Pascal \(Nokia - FR/Paris-Saclay\)" <pascal.fabreges@nokia.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Mar 13, 2019 at 08:21:46AM +0000, Sverdlin, Alexander (Nokia - DE/Ulm) wrote:
> It was observed that reads crossing 4K address boundary are failing.
> 
> This limitation is mentioned in Intel documents:
> 
> Intel(R) 9 Series Chipset Family Platform Controller Hub (PCH) Datasheet:
> 
> "5.26.3 Flash Access
> Program Register Access:
> * Program Register Accesses are not allowed to cross a 4 KB boundary..."
> 
> Enhanced Serial Peripheral Interface (eSPI)
> Interface Base Specification (for Client and Server Platforms):
> 
> "5.1.4 Address
> For other memory transactions, the address may start or end at any byte
> boundary. However, the address and payload length combination must not
> cross the naturally aligned address boundary of the corresponding Maximum
> Payload Size. It must not cross a 4 KB address boundary."
> 
> Avoid this by splitting an operation crossing the boundary into two
> operations.
> 
> Cc: stable@vger.kernel.org
> Reported-by: Romain Porte <romain.porte@nokia.com>
> Tested-by: Pascal Fabreges <pascal.fabreges@nokia.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
