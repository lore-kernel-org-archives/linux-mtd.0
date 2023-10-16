Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A420CDB474
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Oct 2023 09:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2aARJO745QvYkzN2g8VO8mbcQuXsU/zQLDx+xFZJX1s=; b=iKiSnIwcqMoFZm
	3rpaCK54zobezLzetvn+Z97P/NtvTbMtyV6MEODk0B4D9enJ5wL89E6tlwZ1UvXKgliYNa9NXTBhH
	t+zerEYCH6djYu0g///EYXBtVoDkoDXKNaDHaUVXqQ8kxGEYlsjvBjsdk8qJTsd97A6p1Qh+zTM8n
	NSMtqrO57oublV5XT7raINTM96Uos5P0JOdHBIv9PjOLnhsQdZxpEYUgjF2sdqgbpYNDf4FgkxxZN
	jDZMt29mEIp2W7afXMvYNnzJaPHsNCF0puOJ0EEdzi9fln7/PiOKUChJCD1jXXCRXsqPRXSf/rFFW
	KPOyvgV0lko8ukJh+mNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJsZ-008zKB-3C;
	Mon, 16 Oct 2023 09:27:15 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJsX-008zIZ-1M
	for linux-mtd@lists.infradead.org;
	Mon, 16 Oct 2023 09:27:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8D0D1BF206;
	Mon, 16 Oct 2023 09:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697448429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cFW0Jrjsf+b07Pgsc3hiAmE88v7StBvbhAiMGdt8Tzs=;
	b=gB7khUAQBFkZgZ1RlUWVrmOulhGBAe20mxKklKnmM6h/qG9riz+PmseFhH2hLBk33bBc6B
	qGXlAG+Rr1/NuoXE7Www8qp57AWx4c82VXY/lilpFS9UPtMPyOI+/sg9SM4x/XIWAjaupu
	zMBiCRnFvkqAaquw7htf6Fj3G7HpRsgNKERT10TYbkgBIjysg4InUqJkPAgCN1DewyRfnW
	0T6HMX3SK5V/DFplJD31TigYuhAIjjr78JfnJjt4r3kBEYQfnb7BFKHyRcfDk9I+B2QEdp
	IQ3VFNuPkeiGvPKKVGZrX9PxAz+S5/EIUtdhaktKJMoaQcvMot8AEz3aLULi9A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Stefan Agner <stefan@agner.ch>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: Use device_get_match_data()
Date: Mon, 16 Oct 2023 11:27:08 +0200
Message-Id: <20231016092708.288288-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231009172923.2457844-1-robh@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'6135e730f81d7fdb8864f9f8e102bcb8c8351552'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_022713_614385_0663F5A2 
X-CRM114-Status: UNSURE (   6.60  )
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

On Mon, 2023-10-09 at 17:28:56 UTC, Rob Herring wrote:
> Use preferred device_get_match_data() instead of of_match_device() to
> get the driver match data. With this, adjust the includes to explicitly
> include the correct headers.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
