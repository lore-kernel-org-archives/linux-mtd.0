Return-Path: <SRS0=zQg3=4A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C36C352A4
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 18:29:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7994E20714
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 18:29:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VuHh+Mov"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7994E20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j7dUdztsb7sr72aTXa4eEEdx6ImCtkBKzc8+xCtAogU=; b=VuHh+MovCAMLud
	mDJwxtTl76rQCRpm+z/28DRQZFGuPMAJb40ORuRCzfghAWPF/ZNFp8L3WapsQLPYWqQDA+Vp/ETse
	rfpIRZIKovUHWMAfL/dv8uAC4b6rSEyrLfZbgkOat6FwLo/WRlZn5/Q251Lx1ImC7gdbdGqXt1e3B
	2O+ViQfD2FNs6zBJ218P6vVP2RudfeJ8oWiYNabrhbf2A0FZaM1Hn3rXCzjhtk6gNAi6FlJMiCL05
	dxL5FqH+IjlUdx0Gt1QYOqHvy3YFaRVdYtP7T7NefsXeSFGaGTs/khH7M5v2i3ofKSoHjbCmj6pbI
	PuWvTQjYYc5upjc8N70A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1wkl-00019q-25; Wed, 12 Feb 2020 18:28:51 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1wkY-0000tr-Ow; Wed, 12 Feb 2020 18:28:39 +0000
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 56BB080F6;
 Wed, 12 Feb 2020 18:29:22 +0000 (UTC)
Date: Wed, 12 Feb 2020 10:28:35 -0800
From: Tony Lindgren <tony@atomide.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [RFC PATCH 03/14] ARM: OMAP1: ams-delta: Provide board specific
 partition info
Message-ID: <20200212182835.GM64767@atomide.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
 <20200212003929.6682-4-jmkrzyszt@gmail.com>
 <20200212145154.GK64767@atomide.com> <4506487.GXAFRqVoOG@z50>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4506487.GXAFRqVoOG@z50>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_102838_846158_63E11420 
X-CRM114-Status: UNSURE (   4.65  )
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

* Janusz Krzysztofik <jmkrzyszt@gmail.com> [200212 18:26]:
> Thanks for your A-b:.  BTW, patch 06/14 also touches the board file and would 
> require your acceptance before being merged via mtd, so could you please have 
> a look?

OK looks good to me, acked that one too.

Tony

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
