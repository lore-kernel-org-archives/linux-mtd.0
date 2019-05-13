Return-Path: <SRS0=6cMw=TN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701DFC04AB1
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2019 09:41:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43AF821479
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2019 09:41:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k01EpZ5o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43AF821479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mxi0gqThlRYMxWeF+Vy6VZl1cpTZVIknCD1TfJ0PoQw=; b=k01EpZ5oFlOfyY
	UILixZ5xdGsd0r5vSPlfLpN7cBt4qSlLqGoVN/+kj4lbOup0OLWKuhxOIVdgYU5u3mA4m/hUWIHqx
	0rnI99nygXeybTcfL3db+K4E7kuMAj9SWiMaowTpcPn0LxNwpby962DWxfLKKOeiEOd8ya0pvLV13
	eZhdGUIUrFYRq+jZQ58ahZ4x74SNGLrG7+cS04pniZrtwDXHL5wZpFtfh1f7u1cFWx72wp47C5I4i
	aJksf0rVBaK4ZQhnESlqUYNqJIh6vuQ+XqN6V81YNeGsDG+Pyk85fm5vYA78Cg1yLAFGB7NNG+CYV
	9jlZOrTGtazM6wWgMFgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQ7SP-0007XV-2N; Mon, 13 May 2019 09:41:17 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQ7SL-0007Gv-Jm
 for linux-mtd@lists.infradead.org; Mon, 13 May 2019 09:41:15 +0000
X-Originating-IP: 83.204.64.206
Received: from windsurf.home (anantes-658-1-8-206.w83-204.abo.wanadoo.fr
 [83.204.64.206]) (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 607CE1BF20E;
 Mon, 13 May 2019 09:41:01 +0000 (UTC)
Date: Mon, 13 May 2019 11:40:59 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH v1] mtd: rawnand: Add Macronix NAND read retry support
Message-ID: <20190513114059.3934b0bb@windsurf.home>
In-Reply-To: <OF1EDBA487.7723094D-ON482583F9.00297ABF-482583F9.0029E3EE@mxic.com.tw>
References: <1557474062-4949-1-git-send-email-masonccyang@mxic.com.tw>
 <20190510153704.33de9568@windsurf.home>
 <OF1EDBA487.7723094D-ON482583F9.00297ABF-482583F9.0029E3EE@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190513_024113_804143_6B4D288C 
X-CRM114-Status: UNSURE (   6.85  )
X-CRM114-Notice: Please train this message.
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
Cc: bbrezillon@kernel.org, juliensu@mxic.com.tw, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

On Mon, 13 May 2019 15:37:39 +0800
masonccyang@mxic.com.tw wrote:

> -------------------------------------------------------------------
>  static void macronix_nand_onfi_init(struct nand_chip *chip)
>  {
>           struct nand_parameters *p = &chip->parameters;
>           struct nand_onfi_vendor_macronix *mxic = (void 
> *)p->onfi->vendor;

Why cast to void*, instead of casting directly to struct
nand_onfi_vendor_macronix * ?

Also,  you are dereferencing p->info before checking whether it's NULL
or not.

>           if (!p->onfi ||
>               ((mxic->reliability_func & MACRONIX_READ_RETRY_BIT) == 0))
>                   return;

So, the code should be:

	struct nand_onfi_vendor_macronix *mxic;

	if (!p->onfi)
		return;

	mxic = (struct nand_onfi_vendor_macronix *) p->info->vendor;

	if ((mxic->reliability_func & MACRONIX_READ_RETRY_BIT) == 0)
		return;

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
