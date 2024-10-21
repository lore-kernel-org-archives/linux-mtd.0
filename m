Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D483D0E6D8
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2024 10:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rtS4ShH/uCel9BvzUjGk7+kGEvjaM9ivEWG8vLNEOLo=; b=WdnE4o+J4IL42e
	KOav48loYuFc/PT4AqUcLMrL//CeVF1dFU8S7nHxRrAAnzhHKyQNClMKEuCOhcjaJVZ/dU0AgDohF
	tn/yLbnrBYnBqdmuxIplnMniuPISJv1ValRgQuCWJuNJYu3kdo6G9PUVHsil//nN7S6atmCRlxuTs
	Q/zj9hcmtWbg8hDFieXVMsEk6RUydLtbZsK8i+dlMF/ms//ac7l0AgzH4D+XB87A2Trom32Xhe5Fs
	rM8FK/7ciiH5KoPZT/9Ambm4VUXfl/NKJ1m6LdGeKmhn+RY/6GGHD9qWoz4o/muvIlVx3Hm8Rd7Uo
	I/djaY9VfmuKNKfOuutA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pDT-00000006nG5-2z22;
	Mon, 21 Oct 2024 10:00:47 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pDQ-00000006nF9-3I8f
	for linux-mtd@lists.infradead.org;
	Mon, 21 Oct 2024 10:00:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1BB4CC0003;
	Mon, 21 Oct 2024 10:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729504842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rMK7niBniSWGtLwT6S/uPquKbfbY50UHICvFHDtW+Ns=;
	b=BQXGVLuc5sSEWBcs9kT/tymqcKmNk95gso+GyI/mfbRC6nyKBZZbFgJJoTtpEwxORqDX4X
	RKkJsmL/xig9zNAMFK67ED0FgORRbyTTla4JyUQHIhHNcQ8P6Y84BQExn5CSNInc9Wn+M3
	GvnRfrqoveVpAriMZoDS3ERJMIo3VBBzHc0HvrSFI1FkLgQaukR8gzlUGkX92fT6RrXDDW
	3y8f/1Xe7Rdw1G+gQnCyulzBFBtMvTPYCURsu/gQtpgPA60qVPK2ep2DUYZNi9p6gI5oLg
	DNfdWfhDatofTLefCIMPebaJA7n022E8a9wUq++JZeUajsLLI1dpBx+E0OdwBQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Colin Ian King <colin.i.king@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] mtd: cfi_cmdset_0002: remove redundant assignment to variable ret
Date: Mon, 21 Oct 2024 12:00:38 +0200
Message-ID: <20241021100038.101813-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241002172258.958113-1-colin.i.king@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'4c9b44e774025d9fd6f8384a7dcd6a6917043650'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_030044_990574_E2C09085 
X-CRM114-Status: UNSURE (   7.72  )
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

On Wed, 2024-10-02 at 17:22:58 UTC, Colin Ian King wrote:
> Variable ret is being assigned a value that is never read, the following
> goto statement jumps to a statement that assigns ret a return from the
> call to function do_write_oneword_once. The assignment is redundant
> and can be removed.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
