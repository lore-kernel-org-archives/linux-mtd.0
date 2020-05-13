Return-Path: <SRS0=hs7p=63=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CEAFC2D0FC
	for <linux-mtd@archiver.kernel.org>; Wed, 13 May 2020 12:55:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8474206D6
	for <linux-mtd@archiver.kernel.org>; Wed, 13 May 2020 12:55:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HPmm25PW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8474206D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b/ur03vHrIQuRc0SxwRvZ2L2dsFTqQQu09Pjl1vVO78=; b=HPmm25PW0Wwq1C
	K5oE/ixCmPjRYnAKAI3LX65S8mYq8rvyoQWnygdOfhd+kg2TQV8R7L3xkpEGPFnr4XT67tu3p/OWH
	+48hHDtmt87n9ChVFU4YiohaW347xRoo6WyT89VASYtafqDNMul1e2QnHt1vNTTTKaCXA73arnH7s
	sM2mmmbcBqGNBBmUuQ/mzNR89eyr1HZ71EsR8cnpR+a++w7ab1IQYRQGRZwD+i/xBbx6cWUw7KXqG
	ECTDuvVzhbM/rBN+K/DEWKKNHcGZnU+yD8dfM0YJmBxppHkIBCoOETBRWJS3b4PP+yhqaMiJLJMfl
	XWeC6K+t6q7f8N5ecNoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYqv4-0000zf-0s; Wed, 13 May 2020 12:55:30 +0000
Received: from smtp11.smtpout.orange.fr ([80.12.242.133]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYqup-0000lr-V7
 for linux-mtd@lists.infradead.org; Wed, 13 May 2020 12:55:18 +0000
Received: from belgarion ([80.214.67.31]) by mwinf5d46 with ME
 id eCv12200V0gURQY03Cv26X; Wed, 13 May 2020 14:55:11 +0200
X-ME-Helo: belgarion
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Wed, 13 May 2020 14:55:11 +0200
X-ME-IP: 80.214.67.31
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 0/3] mtd: rawnand: Get rid of the cmx270 driver
In-Reply-To: <20200508121041.64f91276@xps13> (Miquel Raynal's message of "Fri, 
 8 May 2020 12:10:41 +0200")
References: <20200429223134.789322-1-boris.brezillon@collabora.com>
 <20200508121041.64f91276@xps13>
User-Agent: Gnus/5.130008 (Ma Gnus v0.8) Emacs/26 (gnu/linux)
X-URL: http://belgarath.falguerolles.org/
Date: Wed, 13 May 2020 14:55:01 +0200
Message-ID: <87lflwngey.fsf@belgarion.home>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200513_055516_287261_CB2CBDB5 
X-CRM114-Status: GOOD (  17.15  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Mike Rapoport <mike@compulab.co.il>,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Miquel Raynal <miquel.raynal@bootlin.com> writes:

> Hi Robert,

Mi Miquel,

>> I hope someone still has a board to test that.
No, unfortunately I don't have this board, nor do I know of anyone having
one. It's the second time I see patches on cmx270, and the question to whether
we shoud keep this board in kernel is still in my mind ... given that cm-x300 is
fully supported and testable, and no one I know has a cm-x2700 ...

Now for your series, I have 2 comments :
 - dsb() : can you explain the rationale of each of the 3 instances I saw
 please.
 - the +2 IOMEM offset
   I don't like it at all. I don't mind the offset, I disklike the use of
   readb() or readw() where before there was a readl().. Same thing for writeb()
   against writel().

   The bus semantics are not the same, the alignment is not the same as well
   (and PXA is very old and doesn't cope well with alignment), and without a
   proper board to test, I would be very wary to have that change.

Cheers.

-- 
Robert

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
