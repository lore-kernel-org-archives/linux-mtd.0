Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9069C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 13:18:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53435206D4
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 13:18:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PVMg3fzJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53435206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jG54TqwtW9ZD1GJWfj2rlpn2YIbcZOb/5kel9bNUxXM=; b=PVMg3fzJrCrm07
	QnMndPJYt+t/x0dCHlcciTaVGIU0HWSsf6jgze5g90/MKyiUKFLgpkPfkEPlxPxj2tlKiBhUwnsLP
	4HJI1oO0vWh7MtR9HusI0vgVe2WPb/KJUHca60nVPh1U+8Y+36xJJ5Kl+zaVZAx59IRx79Fepg+il
	qXTiWYK1NnBiGlA4UsRsyoc9Vvb6OiC0IpD0+KPBzxkxR7XBRkLBnD/UdMtv1tP5A9OwDA0WTnOO9
	UXPbPAG4X0JmTzJRVgXvlDHcKyY5nVjRWeICxOUGe5a69wCD2jVqvOiJRdc9/4k+jog6+5xzfBhv2
	xtXtCrfyX1eU3k3LReDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb28l-00080A-7b; Tue, 19 May 2020 13:18:39 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb1wT-00006b-EN
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 13:05:59 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id D11FA240011;
 Tue, 19 May 2020 13:05:52 +0000 (UTC)
Date: Tue, 19 May 2020 15:05:51 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2] mtd: rawnand: micron: Adapt the PAGE READ flow to
 constraint controllers
Message-ID: <20200519150551.624cc4c4@xps13>
In-Reply-To: <20200519150157.7b668605@collabora.com>
References: <20200519123032.32547-1-miquel.raynal@bootlin.com>
 <20200519150157.7b668605@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_060557_623725_F31DD460 
X-CRM114-Status: GOOD (  17.60  )
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
Cc: Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Boris Brezillon <boris.brezillon@collabora.com> wrote on Tue, 19 May
2020 15:01:57 +0200:

> On Tue, 19 May 2020 14:30:32 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > There are controllers not able to just read data cycles on the
> > bus. There are controllers not able to do a change column.
> > 
> > If we want to support both, we need to check which operation is
> > supported first. This is the exact same mechanism that is in use for
> > parameter page reads (ONFI/JEDEC) as the same problem occurs.
> > 
> > Speed testing does not show any throughput penalty so we do not
> > optimize more than that. However it is likely that, in the future, a
> > more robust and exhaustive test will run at boot time to avoid
> > re-checking what is supported and what is not at every call.
> > 
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> > 
> > Changes in v2:
> > * Added a comment before each check which is a condensate of the
> >   commit message.  
> 
> I don't see those comments :P.

Do you think I forgot a "git add ."?...

Let me resend this one.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
