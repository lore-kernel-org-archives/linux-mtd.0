Return-Path: <SRS0=/Eax=6V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB89C54E8C
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 14:11:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7E782082E
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 14:11:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mALvmHfF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7E782082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+dZfvKC4voiZVhoMmBm4FZ9XzAvtZKhaB7GfSfN1uPw=; b=mALvmHfFloUyoA
	fslon2ANNp2J3pZkSYUQ8YSGhMdVJcg1bA7JlmJnarfx1jWj42GvwLOpe8viGsyHtM7NU0wVw8HC2
	4a6jeZv6G6AZ/E7W0V5tXjhSZcc1hto3dId2eYK/Oktw0AX9mSgKSFkhH+rG74rbimHLLVURuwtZL
	+/tCNeNkjUbfg4CI244T7jaLdcdzpApF4wD4TVaxZaWFBEtxXjzESyxTPAA/EEXT1U9u3RkLeYXTz
	3q+zDxYB/Go6qjvKwL3H+TwSBvs89G5sFyMJb9Fi/ZKRZExShUqAGjsfHTA7KReIAFQXpIqzORFiv
	B4AcIJagPTU+EDSSt0YQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWhFD-0006O3-Fh; Thu, 07 May 2020 14:11:23 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWhF9-0006Mn-8D
 for linux-mtd@lists.infradead.org; Thu, 07 May 2020 14:11:21 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 59984240012;
 Thu,  7 May 2020 14:11:15 +0000 (UTC)
Date: Thu, 7 May 2020 16:11:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 1/8] lib/bch: Rework a little bit the exported
 function names
Message-ID: <20200507161114.0dd2ff4e@xps13>
In-Reply-To: <20200507134822.21c965b3@collabora.com>
References: <20200507110034.14736-1-miquel.raynal@bootlin.com>
 <20200507110034.14736-2-miquel.raynal@bootlin.com>
 <20200507134822.21c965b3@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_071119_428764_BAF7DEE7 
X-CRM114-Status: GOOD (  11.44  )
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
 Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Ivan Djelic <ivan.djelic@parrot.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Boris Brezillon <boris.brezillon@collabora.com> wrote on Thu, 7 May
2020 13:48:22 +0200:

> On Thu,  7 May 2020 13:00:27 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > There are four exported functions, all suffixed by _bch, which is clearly not the norm. Before exporting more functions, let's rename them by prefixing them with bch_ instead.
> >   
> 
> Oops. Missing line wrapping here :-). Also, you don't seem to export new

I might have ignored a checkpatch.pl warning thinking it was false
positive :p

> functions in this series, so maybe drop that part of the explanation.
> Sounds good to me otherwise, so:

Oh right, I dropped this patch right before sending the series as it
was not needed, I forgot I mentioned it here.

> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
