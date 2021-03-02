Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617FDC433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 21:48:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8770564E74
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 21:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8770564E74
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x6foB8RrMnIi9OKQ+OlMx7mB2qguLByDWlHfdFCHcZA=; b=GiSrXsobbJJX1e2oTtPpUkFeQ
	JMfScn+EoT4n23TAIl35QzXqnBMLQJglSU8w6nN70/ffXyXRE9fvO2/03xbxmgD8yv/3jXTptiWcX
	c0xH+zFw45auGPgyB8E84WpUqQUChyK9DmquQwMMQva7irDohX7pfmntZ8dkaODLcnnZVLLRLfVBC
	2yZfDgRf+eISWF5cQmPrIwm7sdDH0O7ndIv3zGcC87oA5DDimzEP31tQpx2BjWhytoIfhFoS850ZF
	1rypk0a1f0VAcFkdBDaSzE/DlhwuANk61+goDAanSaDRmS5UnySQpct7L+LGfrBHFd0QcmWMPPGjO
	+IuJWxncw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHZJv-006dUD-LM; Wed, 03 Mar 2021 21:46:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT99-005K4t-33
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:10:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=qqinuRxfo1M8P1jgsdzaEqblr8e/Ovw/66US5pYif18=; b=p2lz2PIhlHRBTq22HQFMvI/dKh
 YqYVMFPN2TbtwghCUuxWJuEYnZEVh//NkhecUjwNjFQ5J5qqKpzHiKU9eoTL/vRIazqVDdtRPFlw1
 Ks8svYWRBPBgMCYECmRpdqI8GaUiEHpw/Zx+SxDeP/cwoPb+/2YbCKjCM8mG8T3nhZ3HDtUYtt4E5
 irQbs/P1o7gRdaxAxKiFgVPEQwxjx0Ab4I34yHm8qypZ4so2OwK7t/brxHLiZPUrA6HvLexVwViFz
 udJI0TH4/Vb2h2Gv8nXwzkyTLCn5H6q29ElvOWtgsyA3XnaCUiHuVy1X22V40fVtlaLSVP6+/ZyFI
 KcTJs14w==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH7xz-00HSHe-DU
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 16:33:49 +0000
X-Originating-IP: 86.206.8.148
Received: from xps13.stephanxp.local
 (lfbn-tou-1-491-148.w86-206.abo.wanadoo.fr [86.206.8.148])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id C47CD1C000D;
 Tue,  2 Mar 2021 16:33:24 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Adam Ford <aford173@gmail.com>, ladis@triops.cz
Subject: Re: [PATCH v3 7/9] mtd: rawnand: omap: Use ECC information from the
 generic structures
Date: Tue,  2 Mar 2021 17:33:24 +0100
Message-Id: <20210302163324.23839-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210127203020.9574-8-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: dbe6a6da040cbbc86b9811af2bdc3083b7211576
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_163349_541768_BBC57E10 
X-CRM114-Status: UNSURE (   6.42  )
X-CRM114-Notice: Please train this message.
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

On Wed, 2021-01-27 at 20:30:18 UTC, Miquel Raynal wrote:
> As part of a previous fix, we imported the BCH internal structure in
> order to get information about the BCH engine configuration.
> 
> It is best not to access private structure so instead, a small rework
> has been done to export more information from the ECC engines. Now,
> let's use these.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
