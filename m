Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B804FF8855
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2026 16:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tJzOa4WMLl26tE4YRn8WdF3Vo5DcFA/q5w2lRj9dT3c=; b=BpD0C964fwwAEo
	qHukmfcVuXpROgkNUkWkPkpkaBRzl/ZUsBLB7VSkKPDJwp1fKFZjCgyg7Nk87uPCfc4JfHCQna1wV
	ojM/OWp8RAKpZiSWZhMsXBBZLRnm5w6oRiEBrCov1guUZfwydA7oNye3aQKY63WWowhPGbVM+JdpE
	SLmUas9hXJLT2NYv2T2jov7u3QWxuCK37nYJ6cuWDoqZvraktNkFssirjkNQrz6Pnd9lbYuk2vL//
	wSFf3ogK1lx0CLseeNrDVCZbXm4fKpbfGaEU9lyC2T5Th+yisg8EDrGjHOhol3POJAz+8slXjPfmO
	9nl74A8GSKGZfSeYAlCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIPs-0000000Gpwp-3h9M;
	Tue, 05 May 2026 16:14:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIPq-0000000Gpvu-3RXz
	for linux-mtd@lists.infradead.org;
	Tue, 05 May 2026 16:14:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F93E40659;
	Tue,  5 May 2026 16:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D469AC2BCB4;
	Tue,  5 May 2026 16:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777997674;
	bh=/g1Ox+gTCBSY9A/ja/iJ7Sh7jfXHI2TVv6ev9lMDqks=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DYMvY6LQMT3aYGRFAMej5fDU51HPZ1TWgUlguVWYgpYTB94G4SeJaAr4IcPpXrEon
	 MGlSeg5qBMT4iThkZxOjW8qqZRyMLwLzctVjI+kC3inE6jdkQYzqoVUO53H0p81wTl
	 exxtoCSa2/+GKtOu47I9XgL+SCDLMQQslARcb99hAvkiOWSmr4/XOB0Fuo/B6zPmL9
	 BrR3P9rygWsWQxiVwKXnwOQJSjxSJ1BZQDa2i3x0refWnikblIl/Yd+cZuSW1aoEbt
	 pR7Xrpm3O0O5YyP7YeMPauyi8N+2+RJly8M8oWzEg7gDHzcMdeabQ9zZwU8QjS2YRg
	 nxePhPrwQS4zQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Jonathan Corbet <corbet@lwn.net>,  Sean Anderson
 <sean.anderson@linux.dev>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 16/27] mtd: spi-nor: Create a local SR cache
In-Reply-To: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-16-833dab5e7288@bootlin.com>
	(Miquel Raynal's message of "Fri, 03 Apr 2026 18:09:34 +0200")
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
	<20260403-winbond-v6-18-rc1-spi-nor-swp-v4-16-833dab5e7288@bootlin.com>
Date: Tue, 05 May 2026 18:14:30 +0200
Message-ID: <2vxz7bph25qx.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_091434_887716_4B7F03F9 
X-CRM114-Status: GOOD (  11.82  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Apr 03 2026, Miquel Raynal wrote:

> In order to be able to generate debugfs output without having to
> actually reach the flash, create a SPI NOR local cache of the status
> registers. What matters in our case are all the bits related to sector
> locking. As such, in order to make it clear that this cache is not
> intended to be used anywhere else, we zero the irrelevant bits.
>
> The cache is initialized once during the early init, and then maintained
> every time the write protection scheme is updated.

What is the reason for doing so? Do the reads have side effects?

>
> Suggested-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
