Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E9CC0015E
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jun 2023 21:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ByJy7/V/JEu64Fth4T0ll1ncnwiPkfYz5T0EVDFYFbM=; b=wjyLjmOznj9onh
	BgSKKXlxcXXP3RRUk18jD85l2+GAA+WDPnuyfQtAgiILl3ZW7vEOlsHlbr4UAueF38SHG7+vPFpER
	RiLTlGa9gXG5aOTqzCaHfOuumFOSdy32SPBaEXyJcYRki8t8r2wgDbA6mlDErcb/yqkw10nIZMEkY
	pS6nIeJo1MGsCsk+S3Z+bn26Dnkd3bvZsyYXHh5sQmt2DhsXZ1U+Q4Load7HMkc6GocsaznlVYPq2
	KIyCHYHYU5h6LWt0gNxID9/jX+c2IbkZsvYg+8Nil/HvCzG1YxAInNyi9qc/5TbmC7O5o1kRs18g7
	ml17OnT5qLNSAdTsoYjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCRdZ-001oTI-2i;
	Thu, 22 Jun 2023 21:14:41 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCRdX-001oS1-0Q
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jun 2023 21:14:40 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687468473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bbf1F2WUUbZNrijp2VUM0ETnbJAC2wLJLqhMrcqrqLo=;
	b=FH6QLJpfSNsA+nbo7idAMH4c+wc5ky+YZ2vizqxUp34l7v9f2J3sEoPhYQ6T3Rtk0FktYv
	2o7P0dPEV+s2fJay8/8YKozlva7PGvKljDdr9LlUmWEKG4sPzWcLjuk6o0KUHpyT1+4xN6
	kKMinVtrlKz/7N3Mt3S2GOjvN0CcUzryNtYZ5oh87Ydh9eF9gZ55fDBDGmc/rkFvRQ8d98
	H3ZT+yogm+3O2mADv8Wot4ImLA/deYWum/7c+W2AxLOWfb02/L9GKLDHfbHo/RvaOEiRPB
	fSnEB4x4fv6MgZqC4l/lAyH4DCyHsJht6AJ+nTQwQJzj0vXzqHebEh0vfOcyXA==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF223FF802;
	Thu, 22 Jun 2023 21:14:30 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Deming Wang <wangdeming@inspur.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bo Liu <liubo03@inspur.com>
Subject: Re: [PATCH] mtd: sm_ftl: Fix typos in comments
Date: Thu, 22 Jun 2023 23:14:25 +0200
Message-Id: <20230622211427.3581437-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230621020331.1508-1-wangdeming@inspur.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'efd2ed9351efefe40cbcca36a527adf38ffe1b4d'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_141439_332348_6590912D 
X-CRM114-Status: UNSURE (   5.52  )
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

On Wed, 2023-06-21 at 02:03:31 UTC, Deming Wang wrote:
> From: Bo Liu <liubo03@inspur.com>
> 
> Fix typo in the description of the 'succesfull'.
> 
> Signed-off-by: Bo Liu <liubo03@inspur.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
