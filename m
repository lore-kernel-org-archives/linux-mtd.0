Return-Path: <SRS0=PYfn=2Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F85C32771
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jan 2020 20:29:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDD8322B48
	for <linux-mtd@archiver.kernel.org>; Sat,  4 Jan 2020 20:29:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rIX08Vh5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDD8322B48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=iki.fi
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aF44AxwsCZlr/TV1qsY4chqRz3D5ayi4oe7I9UjLkVQ=; b=rIX08Vh5jP+xoE
	vJtrjTbrzLk4YQ5QIC74L8L6j4QufGL8zV8tntPrZeXFDwux1gm0Hkngi+UIDKkKqXw8hx2m5Uo7l
	6Jcs59yvM84T23zgpVbfSButid0XhVvlAsFlXh0OPu2PHPXlXtYVTna9bB85tkQYf/OqGdrk8dXcA
	pGnZWDfzqt7E3HAe3hAHSzXv3Gz+3u2z7dtJ8OQkr5Kp0RNPTGR4qP6WVbK0Enl2okCVqyoZugxMZ
	cXP6Qr6Nbmfrhghlrciw96E2iglABTid1eUHUh4cnUmADY6HIPRgmIVyOT/Ft5kHr+wKpqrLqX+6l
	rMfYOP609jacOvDjOp0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inq2p-0008S1-G1; Sat, 04 Jan 2020 20:29:11 +0000
Received: from fgw23-4.mail.saunalahti.fi ([62.142.5.110])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inq2m-0008R3-Dj
 for linux-mtd@lists.infradead.org; Sat, 04 Jan 2020 20:29:10 +0000
Received: from darkstar.musicnaut.iki.fi (85-76-82-2-nat.elisa-mobile.fi
 [85.76.82.2]) by fgw23.mail.saunalahti.fi (Halon) with ESMTP
 id d7f39843-2f30-11ea-90c5-005056bdfda7;
 Sat, 04 Jan 2020 22:29:02 +0200 (EET)
Date: Sat, 4 Jan 2020 22:29:01 +0200
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH] mtd: onenand: omap2: Pass correct flags for
 prep_dma_memcpy
Message-ID: <20200104202901.GI15023@darkstar.musicnaut.iki.fi>
References: <20200104073453.16077-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200104073453.16077-1-peter.ujfalusi@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200104_122908_630952_C6675B69 
X-CRM114-Status: GOOD (  10.51  )
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
Cc: vigneshr@ti.com, tony@atomide.com, hns@goldelico.com,
 linux-kernel@vger.kernel.org, kyungmin.park@samsung.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Sat, Jan 04, 2020 at 09:34:53AM +0200, Peter Ujfalusi wrote:
> The commit converting the driver to DMAengine was missing the flags for
> the memcpy prepare call.
> It went unnoticed since the omap-dma drive was ignoring them.
> 
> Fixes: 3ed6a4d1de2c5 (" mtd: onenand: omap2: Convert to use dmaengine for memcp")
> Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
> Hi,
> 
> Aaro reported [1] a failure on omap2-onenand pointing to
> 4689d35c765c696bdf0535486a990038b242a26b. It looks like the root cause is the
> conversion of omap2-onenand to DMAengine which missed the flags.
> 
> Basically the client is waiting for a callback without asking for it. This
> certainly causes timeout.
> 
> I have not tested the patch, but it should fix the issue.

This fixes the issue on Nokia boards.

Tested-by: Aaro Koskinen <aaro.koskinen@iki.fi>

Thanks,

A.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
