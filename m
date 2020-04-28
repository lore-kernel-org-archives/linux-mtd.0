Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 245EDC83000
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 06:07:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E25BC206B9
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 06:07:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PLc/9i7+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E25BC206B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2zVrnTKmkLE8LaZEqhYAIxxgPdPVX76ZDO+i8W/wDew=; b=PLc/9i7+ztlaAP
	NtwtDDsVmV97JLb/61LE1GH0K6l1QPiNbCw/DKGZyG5PeGCnlfBy7r0sk0po7iDYAxpYOapfnZsZU
	2DPJy3ukTKAlQ29MzFOzSkdOpQwT6b+H7gazQD+9Qh+sVAjOJxfaj5k9rHozrC1fjXeL7yY3TTMPe
	c9qVoUbMCoU/OmEajnpnHytRyP3Z085jKvV5UTsg/jY0SrIv0NxakgWVr38evpeL0nMqjpkXoOHyf
	DNYW6h70Yxf4I4pfgPKoEW5CRHaFIro0Kjv6UDQHpOBqRm/AXamqDjktdHOaJfJazCUC9dBk2hc6h
	VKxZ6nvuEQzoN9tnj89w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTJOZ-00035j-7L; Tue, 28 Apr 2020 06:07:03 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTJOW-00035I-EL
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 06:07:01 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2FB122A0B89;
 Tue, 28 Apr 2020 07:06:59 +0100 (BST)
Date: Tue, 28 Apr 2020 08:06:56 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 06/17] mtd: rawnand: cafe: Factor out the controller
 initialization logic
Message-ID: <20200428080656.5ea012b2@collabora.com>
In-Reply-To: <20200427214535.7d424c8f@xps13>
References: <20200427082028.394719-1-boris.brezillon@collabora.com>
 <20200427082028.394719-7-boris.brezillon@collabora.com>
 <20200427214535.7d424c8f@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_230700_615850_32CD6A7B 
X-CRM114-Status: UNSURE (   9.62  )
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
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 David Woodhouse <dwmw2@infradead.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 27 Apr 2020 21:45:35 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> > -	/* Enable NAND IRQ in global IRQ mask register */
> > -	cafe_writel(cafe,
> > -		    CAFE_GLOBAL_IRQ_PCI_ERROR |
> > -		    CAFE_GLOBAL_IRQ_CCIC |
> > -		    CAFE_GLOBAL_IRQ_SDH |
> > -		    CAFE_GLOBAL_IRQ_NAND,
> > -		    GLOBAL_IRQ_MASK);
> > +	cafe_nand_init(cafe);  
> 
> A new line would be nice here :p

Will add one.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
