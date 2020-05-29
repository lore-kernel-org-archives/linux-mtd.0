Return-Path: <SRS0=kjCr=7L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F8EC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 08:46:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58D562072D
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 08:46:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ov59NuqM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58D562072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xOaI/YcW/T4r0UQKx0hhVygkUJRf+T4Ct3VQJn6VFrc=; b=Ov59NuqMP+Szis
	rlnYQ1fYtD9SQuYMv2Sbj6c8dUtnSq0jubBKMbHkXJJU71gSGMrXwVcCLIS6KEXYIdyK3T+bvb0b0
	6F0GWa9lzDf36/0zLLUgAsGRzfeWa+mkxVmftp3CiDwlJXkpvpNMu3unl9rFiZR+pLtKAYVYOhMc0
	eQg/A5oHK88vWOENz4cEmV56k28k2L4xFHyBxIpbV1VIJwcp/+DU1bYWvdFUYI6BLG94JzIK2bmfl
	hyuvyo3uNn+xhdo8JNzLhBIfGzPR22UugP8fm5+5IcaAsWdbjnh0/a/DoYdZgIOn6YWA+W8lN+PPp
	oGtwNypZ5N/lH3i64/PA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeafI-0007rk-HZ; Fri, 29 May 2020 08:46:56 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeaf6-0007hq-QK; Fri, 29 May 2020 08:46:46 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 468C32A4304;
 Fri, 29 May 2020 09:46:43 +0100 (BST)
Date: Fri, 29 May 2020 10:46:40 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v7 17/20] mtd: rawnand: Hide the generic OOB layout
 objects behind helpers
Message-ID: <20200529104640.1997434f@collabora.com>
In-Reply-To: <20200529104548.0038bbe7@collabora.com>
References: <20200529002517.3546-1-miquel.raynal@bootlin.com>
 <20200529002517.3546-18-miquel.raynal@bootlin.com>
 <20200529104548.0038bbe7@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_014644_977078_ABFBA9D9 
X-CRM114-Status: GOOD (  11.59  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Julien Su <juliensu@mxic.com.tw>,
 Richard Weinberger <richard@nod.at>, Weijie Gao <weijie.gao@mediatek.com>,
 Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, Chuanhong Guo <gch981213@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 29 May 2020 10:45:48 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Fri, 29 May 2020 02:25:14 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > +const struct mtd_ooblayout_ops *nand_get_large_page_layout(void)  
> 
> nand_get_large_page_ooblayout() (same for the other helpers).
> 

And sorry if I got it wrong in my previous review :-/.

> > +{
> > +	return &nand_ooblayout_lp_ops;
> > +}
> > +EXPORT_SYMBOL_GPL(nand_get_large_page_layout);  


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
