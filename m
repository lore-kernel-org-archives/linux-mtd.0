Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092C1C54E49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 12:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3oTqYPDppdOfqeQiGV+op4PDi4ClsOIiLZLSIWB6z/U=; b=wgy8eU5GygSUv+
	Nc+rtAmJjyQP9wqLz/bKRwp6SzDwgVxOpOo1CJZWHUg7KWg4ua7RvtyPjjs+SUPvTsY/h8aL78rQs
	t/cOkOv8xkLhcezRjVUvpHKyRSr98cRRiVVg+oSvyrvNTD77JPJroSCfCsOqa0es2fLzLA5+xTkNc
	i13NcJKx74SWkakHyNM13SXcU0qtbZhQwNcumBulrWfvaQAQkzEMgCBFOUhNB9vrK0gV6z5TpyTBV
	w/nJg+1pVKcDlb7O/qib3gc8A8SrZiViW6uuqq8ark6PBtvtOvdFbt666PEnZL2nwrd85pHtMMEwG
	rcEK29+xUasZU1ecwN7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reaNC-00000000f98-0hNv;
	Mon, 26 Feb 2024 12:46:22 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYSV-000000008by-3fRN
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 10:43:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD1591C0018;
	Mon, 26 Feb 2024 10:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708944218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yrJZMiXm2tDR0iglQV6eduDMEWs6ympLLFps49vyomU=;
	b=V5JSlKfwEbLzG1DyFMRA6uU2BtohHNRQ6sktRBVtWys3oh+S5x0GK9vT/F+ZwKyKKdK6OO
	sHHJ1eivoEGxx+u0Ehq/WCHsfldTuhRQNtqY0bQp/AocvUDjGKjJDXsityiG5cpz76VVOq
	U87cnK66jKbEDQ8s5EcEjK+eEkuUuekYN+uwuZ9q07igsaYzU0whPB1y+++pSz7RjVl/2/
	9ldjsc71PUAOP+eb9ncKVfpi4lvwNt6U08Qy2ATrgdxY14xR54b2kNiWupdOrzw53fC/Tm
	V0XAfCWNeXsBDlvkr08tgAdeBv845o3nKlz4hGpHiVzO7t+SiN49DFiE67V1kg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Baruch Siach <baruch@tkos.co.il>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: maps: physmap-core: fix flash size larger than 32-bit
Date: Mon, 26 Feb 2024 11:43:34 +0100
Message-Id: <20240226104334.489164-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <9fbf3664ce00f8b07867f1011834015f21d162a5.1707388458.git.baruch@tkos.co.il>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3884f03edd34887514a0865a80769cd5362d5c3b'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_024344_399619_349A6D0E 
X-CRM114-Status: UNSURE (   6.06  )
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

On Thu, 2024-02-08 at 10:34:18 UTC, Baruch Siach wrote:
> mtd-ram can potentially be larger than 4GB. get_bitmask_order() uses
> fls() that is not guaranteed to work with values larger than 32-bit.
> Specifically on aarch64 fls() returns 0 when all 32 LSB bits are clear.
> Use fls64() instead.
> 
> Fixes: ba32ce95cbd987 ("mtd: maps: Merge gpio-addr-flash.c into physmap-core.c")
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
