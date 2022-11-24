Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABF5C43219
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Nov 2022 11:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HmVUWRU6U2Kq5j0jYx9paF17olp5xod5WU6EZYtI2UE=; b=AUWpFf8hyJMSNO
	RV1QZ+ca9FPBcb5iadO/r1epps0qOieQ8pl3kDt+AE8tjwDQCWwxYKmCk3ZIwUTZOf+Sxf1JZyWIp
	/SsZIupynQxJceW5Gk5mFfZibwCj6ofPXnUedC5/gtDsenBQ/K2D0i2n09tln8RQOd2yclozlq2pZ
	4j8wSQxdEys4Ex3b6/sNpcMiSZlvDg95q6hHvAS4QnI+5bQy39SsbJVYaVXD8p3gSTm7K65HMXNme
	0DVvmW8B8MHY9oVitiLkL11FUE1fYN+jC9ilsULXFvRouxzc/9pxrVBROHXoyMI+1AxYQxmfkLbbI
	YvXExI0ASVoWMAZeqzPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyAWr-00879R-Ox; Thu, 24 Nov 2022 11:36:29 +0000
Received: from relay10.mail.gandi.net ([2001:4b98:dc4:8::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyAWp-00877i-3y
	for linux-mtd@lists.infradead.org; Thu, 24 Nov 2022 11:36:28 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B68B6240005;
	Thu, 24 Nov 2022 11:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669289783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4dlPpfwv5MuQW45pcS0uu+R0L1quqqE+gBARVAIRWeM=;
	b=Lr+6i/ijdZTrRYPqSGANWslXGoVmbDeHdZJEHNuz9QCjdqJYg52gugPWQwOKzNggHDrq9d
	76lR//CUofJxzdCMy8OtP8SneGofkHJI7dneqQDR6Rxs1Oa4ytGgRaP6GUSEzX7rGUlpo1
	hJH4cG8vKmMXOdD3atGhkz+xUsvky6E68Vejx7Pj1ge3FIO2SNlsnvjTZNRHvAxWZisN81
	klOCoZoHg+4q/L5BPYT9XO5QNAhw3Qkkcj0sacOTkgVyNpoEKza2XQ/YCWKPCsh5Q355Az
	DsLJU8IOPEjU/qsdmiSq2BSUKVr1OF21b48FqkoKXrREZ5Oy7ErZ4rl0rumAtA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jean Delvare <jdelvare@suse.de>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: onenand: omap2: Drop obsolete dependency on COMPILE_TEST
Date: Thu, 24 Nov 2022 12:36:20 +0100
Message-Id: <20221124113620.266344-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221122202957.5748c6ce@endymion.delvare>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b46ff0780f1760a64b9dfdd2dc8f76bfe0c7c820'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_033627_333146_FF657542 
X-CRM114-Status: GOOD (  11.61  )
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

On Tue, 2022-11-22 at 19:29:57 UTC, Jean Delvare wrote:
> Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
> is possible to test-build any driver which depends on OF on any
> architecture by explicitly selecting OF. Therefore depending on
> COMPILE_TEST as an alternative is no longer needed.
> 
> It is actually better to always build such drivers with OF enabled,
> so that the test builds are closer to how each driver will actually be
> built on its intended target. Building them without OF may not test
> much as the compiler will optimize out potentially large parts of the
> code. In the worst case, this could even pop false positive warnings.
> Dropping COMPILE_TEST here improves the quality of our testing and
> avoids wasting time on non-existent issues.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
