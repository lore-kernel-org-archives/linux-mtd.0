Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8A4C001DE
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Aug 2023 07:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ibOpPkfekLc1f6cO1wONHqCLh/yd+w9z9tJF1TW/vf0=; b=u/nJW8T32Besi1
	3pMdsk1bYoa5YiWqtLojpyX2O8wppVjSMwTKl+zdiSMLUd2xrnAKq6rF515p8ydzVOl9QK2oEIO6g
	gxkd7+G8kr8bh6QKVG0zEr7LI+hJVM+eVi2nrERIpgadeuOgFfMnFFbU2xsP/acpise1x6BvGHCou
	QRaXIAAobt1gp1gnOIdDIm9QC3YDCHwZVlXpaUnxMKBaIht6tyxyZzzRgr4s7XCM1ZvpmRLR6JQPK
	jUqRykqHodnsmXA7siMnLhAWhWZmX8rZ+mmwqHonWxXcAEv+bot/2C6Cp1IvZKdqvcTZJwy5WwiDT
	0LZozOMV0qrjSxJYhXoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRoqj-00BjOB-0X;
	Fri, 04 Aug 2023 07:03:49 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRoqf-00BjN1-18
	for linux-mtd@lists.infradead.org;
	Fri, 04 Aug 2023 07:03:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A5916000E;
	Fri,  4 Aug 2023 07:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691132624;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q8sugdBkahKyMLsCNrwO/tWW9SSL0e9Jyo0Ltd1m76o=;
	b=gdIHUnR5sm4QccNFdkj79z2wVI/VblO+0x87e3QLAmcDvhdrjcYMUmV39TKkqNdHuwwgph
	iGrme6m5MctFVOuTFzgANnjoeYmB8rT2+srF9O/vmIsD+R9aEbDIG9UANUvEOthCeq0CKF
	Pi07O2xR2x+ybfbYjuNS9H5z6em5y1SlY2KZenNbCyHI03h7muysJePphY6rxoWJkakvDc
	MMHSfenUS1TjxrQheYq+RtT/7PUrXC7RjAXO0Xl/xiKTYYf5WLToSFaYhzASGytrPSEkP4
	C6D5q42pEmU35WnOQUojtsTzSK6P/U1N6rlHKA0p5BvN00RYpk4lHACCP8cb1A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zhu Wang <wangzhu9@huawei.com>,
	stefan@agner.ch,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH -next] mtd: rawnand: vf610_nfc: Do not check 0 for platform_get_irq()
Date: Fri,  4 Aug 2023 09:03:43 +0200
Message-Id: <20230804070343.370617-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230803085056.30888-1-wangzhu9@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3549fecd10d24bcf9840ba2f7d6a0b5f57feed6f'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_000345_519016_4C125790 
X-CRM114-Status: UNSURE (   7.11  )
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

On Thu, 2023-08-03 at 08:50:56 UTC, Zhu Wang wrote:
> Since platform_get_irq() never returned zero, so it need not to check
> whether it returned zero, and we use the return error code of
> platform_get_irq() to replace the current return error code, for that
> platform_get_irq() may return -EINVAL or -ENXIO.
> 
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
