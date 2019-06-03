Return-Path: <SRS0=ioUS=UC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC864C04AB5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 14:18:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B262427274
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 14:18:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DJYV4eif"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B262427274
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8iDLmek5sH/GDhSIFQ6SSZW52/EUogqyfk5tTk8WfmU=; b=DJYV4eifkXqYLg
	bycF9DMYHQbcQ7DiDz5BxqQt8PiFOtmGN64MJKrVwjZTFQ1LJMWF/Ye8rOSagtxby1Gmw/kaGQv03
	M1DLPFMinGsoEFwHjvJfdSDcTNzw+IcpNHAlh73/zgivlCCkUUSMJWpvWdpgkQFN4ZO8AzCFACA2t
	Dr8vcY4QzwzOcI0kjolYQm7VaHbsIg/LNrK/cf7BXNtG3J4nyogGSycNevje6VqTrrmHm3NDrDEVe
	nVAEN9eMUhjL/1RpknrtYva5um7OjboMnt5iXeQ/FCJx6Qeer8snkxq6kyuR6Z3KnPyw+flmiKrJ+
	xfSg15fg6BZ2gq66DZHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXnnI-0000yg-Fz; Mon, 03 Jun 2019 14:18:36 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXnnE-0000r0-CY
 for linux-mtd@lists.infradead.org; Mon, 03 Jun 2019 14:18:34 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 38AF52680AC;
 Mon,  3 Jun 2019 15:18:30 +0100 (BST)
Date: Mon, 3 Jun 2019 16:18:25 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH 1/3] mtd: nand: raw: brcmnand: Refactored code and
 introduced inline functions
Message-ID: <20190603161825.4044f953@collabora.com>
In-Reply-To: <CAC=U0a1q2CTZx+btLBJNewK8Rv3WXVE-ZV+j5fFWZPJLoJ94NA@mail.gmail.com>
References: <1559251257-12383-1-git-send-email-kdasu.kdev@gmail.com>
 <20190601095748.35d1c1aa@collabora.com>
 <CAC=U0a1q2CTZx+btLBJNewK8Rv3WXVE-ZV+j5fFWZPJLoJ94NA@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_071833_246366_BF92F9D4 
X-CRM114-Status: GOOD (  15.67  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 3 Jun 2019 10:11:20 -0400
Kamal Dasu <kdasu.kdev@gmail.com> wrote:

> Boris,
> 
> On Sat, Jun 1, 2019 at 3:57 AM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > On Thu, 30 May 2019 17:20:35 -0400
> > Kamal Dasu <kdasu.kdev@gmail.com> wrote:
> >  
> > > Refactored NAND ECC and CMD address configuration code to use inline
> > > functions.  
> >
> > I'd expect the compiler to be smart enough to decide when inlining is
> > appropriate. Did you check that adding the inline specifier actually
> > makes a difference?  
> 
> This was done to make the code more readable. It does not make any
> difference to performance.

I meant dropping the inline specifier, not going back to manual
inlining. As a general rule, you don't need to add the 'inline'
specifier unless your function is defined in a header. In all other
cases the compiler is able to inline things on its own when it sees the
number of instructions is small enough or when the function is only
called once.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
