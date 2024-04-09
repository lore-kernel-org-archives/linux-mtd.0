Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C5ACD1284
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2024 06:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y3zXtZKC3wbwFJ3dO/YqrbjkqtOYCUXWm9kpw/EYK3M=; b=TuwJygMJk5mZa7
	0OmuTpoD72Sq/2RaDQin2UmvP1gQCbIgZADd/JJhg3Vi3d/RvgWy6zZbHhZXPXzCdhgMk/AOwjsQE
	gPlPIdAfgrOCmt6/QPrsjNXxmq0xJMEbp8o26xDQQ3WKWcjOHV5XrasGoNh7LcYFeU65HE/OUrCjb
	codDB2M25xpub4D0cQsLbnt9J5PahOw8Yi11JNl3LprzSPL+JNgNC7E9qTrO4TDMtCUVBRViGnGm6
	5rm5EIEnI+k8B9LLF412ioAA2MoYxORKyCJW07SjrZ0q7pXx3zh0tSM7MGS2ay1NbEdt3f3F1yrZR
	jW1vqycvQnvqrnUbbLkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru5AI-00000000cYq-1AaY;
	Tue, 09 Apr 2024 06:41:06 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru5AD-00000000cXK-3S84
	for linux-mtd@lists.infradead.org;
	Tue, 09 Apr 2024 06:41:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50E502000E;
	Tue,  9 Apr 2024 06:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712644859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=el4POVwG1BFOHwCXCj9zzWb/ZOsSj/5veLdQd6Ccm00=;
	b=Bu1UoXP8fESp32KVmdyGj/iLb8L294CKCbaoAKc8LpF0ujbj118zHfT//X5Xf+hazUgoMT
	Cq+Krhpipm7P3vepAyf8RJUALLvSMojCxZeE8Qbq7A+4YaKnYS3/vVapkJDDYSX6QT+UhH
	oBu74Y1Cn133jdsKYdEovpV1S6Fiofss9wsf8hyxtX7xmNIh08F9lNLZh1S0jm8v3O28NX
	seQVCqYfawXudtThkYHc3EWWBK7UxGMKE8elpmDy0QXqNj96N8qw42sOxnadgV9fjoZOHa
	45oCisZNQF4ykMl7d9EpHn605dmPJERCM4BZzSdB8LgRnlrTqJRYBLkrK/4DAA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 1/1] mtd: core: Align comment with an action in mtd_otp_nvmem_add()
Date: Tue,  9 Apr 2024 08:40:57 +0200
Message-Id: <20240409064057.91803-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325151150.3368658-1-andriy.shevchenko@linux.intel.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'5043e5553601504995300c98141230f5edd11933'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_234102_046505_5F5067AC 
X-CRM114-Status: UNSURE (   6.48  )
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

On Mon, 2024-03-25 at 15:11:50 UTC, Andy Shevchenko wrote:
> The comment is related to the non-error case, make it more clear
> by inverting the condition. It also makes code neater at the end.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
