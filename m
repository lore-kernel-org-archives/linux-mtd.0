Return-Path: <SRS0=g52K=I3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C58C433C1
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:10:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4707F6191D
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4707F6191D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CnJzpORRZjWjqzp5x1GuarCXVNmlpI/uxYv2U4P5vEU=; b=bKSsvNkCN2XrHLtNfmmSA8RLW
	XmBkNx91clzVDEoIv2/6f38uzBnv4ShcB6jXtOjBmKFEJmSRljVom0J36RB1wee5/HMsd8OPJZ1MZ
	yJ54mxb5DOeftxogS+wT4fn8XiFLbMQvUQ++Ob/6q03ao6dhPyD+5gfWqzfcq3v0khLyqjSpWr7oT
	h2ydr05sUpJbGk7xDgXhACTg4hKdt1frYnBeFxoKXeVAQ+5DtxVNpN8Jc4n+QmjHedM6yOdFce7VS
	tMbHO+QcYA91n7nDDls4uwjLWx832EIRUBwcDmcSHfK8VP8Spyd6TFSTCoie4LHXR5hPOrgfeLWuw
	32l2YZ0TQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQvOg-000rYY-2R; Mon, 29 Mar 2021 17:09:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQovM-000ZYj-0A
 for linux-mtd@desiato.infradead.org; Mon, 29 Mar 2021 10:15:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=ifu6I9dSj+Ln76M83eZA0efzKT/PVzXNd1SSm2KsUp8=; b=TEv8MFJIh/a4ifU0uPUfuIYDyP
 hGf9sm9dQeCF/A3nQAw7I6fvGNVm42wSMUU3jo2WUjfAq52hziqgnbGkVchxd3N0kCap43KEqJ+f7
 PIi7CCJ9EpIJ2Vh7pmjU2uqxMjg0SM3HSI/OL4nJ1zhNpUbnFcCWKULauuZW3OUVvqIr6y0I/6BjU
 OufiD1wNd3N9sT5ezAHBfIlanHXkP8djp6fYNqgbqDagMF5FBVA0eDFD5q5GO95s8BmfGjbo3egdk
 IHpUtZ12ZKZPHyIjya0gWWXcdXC2TZ7DInfS7CqluGRa42H3mECk+M3pSJgPH7glTjgigcNbra9eg
 /UDPWt4g==;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQYzs-000JgA-HS
 for linux-mtd@lists.infradead.org; Sun, 28 Mar 2021 17:14:50 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 0A878E0007;
 Sun, 28 Mar 2021 17:14:16 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Lobakin <alobakin@pm.me>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 mtd/fixes] mtd: spinand: core: add missing
 MODULE_DEVICE_TABLE()
Date: Sun, 28 Mar 2021 19:14:16 +0200
Message-Id: <20210328171416.7322-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210323173714.317884-1-alobakin@pm.me>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'25fefc88c71f47db0466570335e3f75f10952e7a'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210328_181445_279119_AE598A03 
X-CRM114-Status: UNSURE (   7.04  )
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

On Tue, 2021-03-23 at 17:37:19 UTC, Alexander Lobakin wrote:
> The module misses MODULE_DEVICE_TABLE() for both SPI and OF ID tables
> and thus never autoloads on ID matches.
> Add the missing declarations.
> Present since day-0 of spinand framework introduction.
> 
> Fixes: 7529df465248 ("mtd: nand: Add core infrastructure to support SPI NANDs")
> Cc: stable@vger.kernel.org # 4.19+
> Signed-off-by: Alexander Lobakin <alobakin@pm.me>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
