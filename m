Return-Path: <SRS0=FSZL=DT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7490AC433E7
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 13:36:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E78332076E
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 13:36:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RTYDxQdU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E78332076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qml0HlWOb9ECyqJm09TxkOz+hgXEjwBfayNz9EFttAo=; b=RTYDxQdUKCA0jDgG8W4g2KCLY
	jFxEv3BUX1RiLLrYfoZEoKEuUiq2O9srZ/mqNn1rK+V7bMga8eDNtlRoYd3Jwnok2X1gXmFoWIdmb
	HhiiaGG9EPMXZbYhWi1Bxf7DqiaQ1V5lx8lQBcSU647xbJOxlq+VRKNkfu3wpN/diLOi1lxF/0l0g
	Uw7ZOB4b1CexBX+DGaEPk21TwBK+UvIiHGZegu8CbhIxrU+gEcrIaBYcfOUAoNN/a3ZcqPH+M87xk
	Gl95TFaJ5LTjxN6uNyLZT/r5T/8YovyJHssML0NWZ767SByax8AmGWHeIx957nQXT9bZKzqr6JyDs
	uQk+c7wKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRxzD-0000p8-OJ; Mon, 12 Oct 2020 13:35:35 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRxzB-0000od-H4
 for linux-mtd@lists.infradead.org; Mon, 12 Oct 2020 13:35:34 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2E10C1F44A08;
 Mon, 12 Oct 2020 14:35:31 +0100 (BST)
Date: Mon, 12 Oct 2020 15:35:26 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Manuel Dipolt <mdipolt@robart.cc>
Subject: Re: [PATCH v6] mtd: rawnand: sunxi: enable NAND MDMA (Master DMA)
 support for allwinner a23,a33,h3
Message-ID: <20201012153526.4d19314b@collabora.com>
In-Reply-To: <1302710164.236549.1602496878099.JavaMail.zimbra@robart.cc>
References: <1302710164.236549.1602496878099.JavaMail.zimbra@robart.cc>
Organization: Collabora
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_093533_653517_07E3097B 
X-CRM114-Status: GOOD (  13.07  )
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
Cc: Roland Ruckerbauer <rruckerbauer@robart.cc>,
 linux-mtd <linux-mtd@lists.infradead.org>, maxime <maxime@cerno.tech>,
 miquel raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Subject should be something like:

"mtd: rawnand: sunxi: Add MDMA support"

The commit message is here to give more details.

On Mon, 12 Oct 2020 12:01:18 +0200 (CEST)
Manuel Dipolt <mdipolt@robart.cc> wrote:

> This patch enables NAND MDMA (Master DMA) mode for the Allwinner socs A23/A33/H3. 

I was wrong, MDMA stand for MBUS DMA, not Master DMA.
		
> 
> Till now dma transfer was via ahb to and from the internal sram where the nfc io is mapped. 

It still goes through the internal SRAM IIRC, and then the DMA copies
from/to this SRAM, but we probably don't care about that. This
important thing to mention is how it differs from the normal DMA and
why we should prefer it when both are available (NAND perfs + more
bandwidth for other users of the shared DMA engine).

> Now mbus dma mode gets set for the sun8i-a23-nand-controller as default. 

s/mbus/MBUS/
s/dma/DMA/

> Mbus dma requires less configuration like defining a dedicated dma channel in the device tree.

Same here, and please wrap the commit message lines to ~72 chars.
 
> 
> yours,
> Manuel

Please drop that.

The rest of the patch looks good. Once you've address those issues you
can add

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
