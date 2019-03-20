Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF848C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 07:39:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB0552184D
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 07:39:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ECtuVMKG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB0552184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mw9Fj9XlT/1da2+8PLjO76+1ab7vntj9DtOXePVT7ZQ=; b=ECtuVMKGtBW/98
	U43NrQVw2HugCQ7KUYrVtSYhtV/k1bDcTCv67lIiErKE43fsdKig+sCsHbgvyBABKOSxrT3d4i8bY
	UujVpponJBm5r5exETn4LdkQN4cjVvLlyfP/BlqZu9HhcW2uhu3zIhxsm9NCOgoIWw6Nwc0eE4gaW
	TRna1D/sxmQ3e4TfkGTmhPK1qQkmAUI3EaPMvuT3TymzXHOtKsG8tIeMMWt84vAizSKKcT2FEHbxP
	duv15QqyRVo8RcQJ51uElgJXW1Lkb90U0cmZJLMhSmLMEsjQTW3/Os2KtDwwHg6Tth7hC0ix7je03
	V67WgHtvlkSGFYCGxpnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6Von-0007YN-LL; Wed, 20 Mar 2019 07:39:21 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6Vok-0007RK-OB
 for linux-mtd@lists.infradead.org; Wed, 20 Mar 2019 07:39:19 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Mar 2019 00:39:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,248,1549958400"; d="scan'208";a="124177436"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by orsmga007.jf.intel.com with SMTP; 20 Mar 2019 00:39:13 -0700
Received: by lahna (sSMTP sendmail emulation); Wed, 20 Mar 2019 09:39:12 +0200
Date: Wed, 20 Mar 2019 09:39:12 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v4] mtd: spi-nor: intel-spi: Avoid crossing 4K address
 boundary on read/write
Message-ID: <20190320073912.GP3622@lahna.fi.intel.com>
References: <e171947a-07c6-d5f4-b81c-dbf8c6b1647d@microchip.com>
 <20190319171749.19052-1-alexander.sverdlin@nokia.com>
 <3af53f8c-8606-c646-2e77-e6dfc8473f66@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3af53f8c-8606-c646-2e77-e6dfc8473f66@microchip.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.11.3 (2019-02-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_003918_869454_A46D531B 
X-CRM114-Status: GOOD (  13.95  )
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
Cc: bmeng.cn@gmail.com, bbrezillon@kernel.org, richard@nod.at,
 romain.porte@nokia.com, stable@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, pascal.fabreges@nokia.com,
 alexander.sverdlin@nokia.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Mar 20, 2019 at 06:49:19AM +0000, Tudor.Ambarus@microchip.com wrote:
> Mika,
> 
> Would you please add your Acked-by again? It's dropped in v4.

Sure.

> Looks good for me, below is my R-b.
> 
> Thanks!
> 
> On 03/19/2019 07:18 PM, Sverdlin, Alexander (Nokia - DE/Ulm) wrote:
> > External E-Mail
> > 
> > 
> > From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> > 
> > It was observed that reads crossing 4K address boundary are failing.
> > 
> > This limitation is mentioned in Intel documents:
> > 
> > Intel(R) 9 Series Chipset Family Platform Controller Hub (PCH) Datasheet:
> > 
> > "5.26.3 Flash Access
> > Program Register Access:
> > * Program Register Accesses are not allowed to cross a 4 KB boundary..."
> > 
> > Enhanced Serial Peripheral Interface (eSPI)
> > Interface Base Specification (for Client and Server Platforms):
> > 
> > "5.1.4 Address
> > For other memory transactions, the address may start or end at any byte
> > boundary. However, the address and payload length combination must not
> > cross the naturally aligned address boundary of the corresponding Maximum
> > Payload Size. It must not cross a 4 KB address boundary."
> > 
> > Avoid this by splitting an operation crossing the boundary into two
> > operations.
> > 
> > Cc: stable@vger.kernel.org
> > Reported-by: Romain Porte <romain.porte@nokia.com>
> > Tested-by: Pascal Fabreges <pascal.fabreges@nokia.com>
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
