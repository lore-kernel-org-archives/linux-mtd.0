Return-Path: <SRS0=Oy4p=7G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A93C433E0
	for <linux-mtd@archiver.kernel.org>; Sun, 24 May 2020 15:29:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58B19207CB
	for <linux-mtd@archiver.kernel.org>; Sun, 24 May 2020 15:29:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IVcklZ1b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58B19207CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00aUa0P/EH2O0HsuybxI4lsMcbiG6VHvkVVFzfVt+pQ=; b=IVcklZ1bBq8z3P
	Zyrqst5JCvajD2P9eBpRcpSb6f80V+jJBQDw+aAAZnSbS26RLvu6/K0HEiLKyC1zRfsaAFsB67ISn
	T8USufGfia1z22w7eQnf7PFya6o1yUwl/lqT7agZUm1+UWnQuKjjmBzNLGO1o4eaCd21/g/KvObKb
	LSC6tRX3xT+0iNf4fdjJrkb4JoPSSblrWkSs7FdTj0szVs8cbA6/LXFEsyLggpxFz5DUJQtl8lN/f
	uce6tyRFdvcoKh8O0ry1zELxZplG3/x5H+Xi6W9oRo3nWX0ApDig+6AE2h6W3zIMrYF5vtbzskeWJ
	rx2VccCePkR8RAMRuILw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcsYt-000604-Bv; Sun, 24 May 2020 15:29:15 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcsYq-0005zI-L6
 for linux-mtd@lists.infradead.org; Sun, 24 May 2020 15:29:14 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 98AD1277056;
 Sun, 24 May 2020 16:29:10 +0100 (BST)
Date: Sun, 24 May 2020 17:29:05 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH v2 00/19] mtd: rawnand: cafe: Convert to exec_op() (and
 more)
Message-ID: <20200524172905.78dbb3a6@collabora.com>
In-Reply-To: <20200524115246.GC2781@furthur.local>
References: <20200513191038.49a4fdf3@collabora.com>
 <20200515144703.GA1245784@furthur.local>
 <20200515192540.GB1245784@furthur.local>
 <20200516145650.GA1433661@furthur.local>
 <20200516210857.2b579ae4@collabora.com>
 <20200516221837.6559944c@collabora.com>
 <20200517164709.GA1651421@furthur.local>
 <20200518165024.4122351d@collabora.com>
 <20200520072331.GJ1695525@furthur.local>
 <20200520095511.73cfb7ee@collabora.com>
 <20200524115246.GC2781@furthur.local>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200524_082912_820085_FBD8EDFF 
X-CRM114-Status: GOOD (  11.19  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, 24 May 2020 13:52:46 +0200
Lubomir Rintel <lkundrak@v3.sk> wrote:

> > > 
> > > It doesn't work, but reverting disabling DMA altogether doesn't make it
> > > work now either. It might be that it doesn't behave deterministically,
> > > but more likely I just fucked up the testing and was testing a wrong
> > > tree.  

I've just pushed a new version [1][2] writing the DMA_CTRL
unconditionally so we don't keep the previous config (which might be a
problem if we mix DMA and !DMA accesses). Would you mind testing it?

[1]https://github.com/bbrezillon/linux/commits/nand/cafe-nand-exec-op-debug
[2]https://github.com/bbrezillon/linux/commit/9b82f0b92b17fb298bbd6328d6b84891137b9de8

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
