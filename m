Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5205AEE7FF4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Sep 2023 16:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=afXinKZ0DpIbKQ6IA2kxDQwhuKaqOtfHbgxfhI2k4g8=; b=iPhQRGg5D0UzJy
	nxQbugwII3t3pi8WhpIdjMAubRz/wRaAXnzkNGBMw/kILrGX7wT9PLXjcIvapASUmK//IcX5xWv/k
	1kFniaccm2E4+Ru1465MW1EpGH37+9hIidx1ijb7JWwmhzyNxQXGU2cFDGqZl34PBkweRajD1aiC1
	KMFREg4ud9byLZSclvExky+x3BlWQE9Vv8flB2luEkicn53vyD1/rNauKh0yutSe1vY0sI9ri9w0/
	Q+pQR34AeH2I230Eb6b0N0nwW3vjlDPTypkIc2Q1KUfW88WbMn9Lv27aVPzt+H8FKG/aFK4PwrWhu
	dICUfDoZwqGoWeowZ0aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjKy-000xZe-2Q;
	Mon, 11 Sep 2023 16:00:32 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjKv-000xYb-2c
	for linux-mtd@lists.infradead.org;
	Mon, 11 Sep 2023 16:00:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09541C0008;
	Mon, 11 Sep 2023 15:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694448027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qS38ocazPpEpppEYVtNerL69O277vxu46/4AvalaBdQ=;
	b=a98mjC4nYPsHIUq+qRsYP+aUNFyqgcpwE/HTQ+jIK/d5P7TWa4ezwnCnvVBaj3QNtn90TQ
	7u6WVLs7esTJzRMAEH3vckgGno98cLfnd0YI49Z9aXotLZ7bMgewFibIvwcToPPA2AcaIR
	f9pCXLUNV4f403zFnb+x7hlDWgrBHKOh8LfMN8zezpzXhPC7AlOekZyVtGq8A2PsdLWDtv
	2QoZ5fMpyWAHuYTkURjyzdJpc0No/pCyN+N9ehtaAFKRQmQIwgzvLinPn1wOD/Kh6dh9MS
	bF3JeztQ4OW4bIIZIdBFOa/FPY/OAxckmhZCPxBm5hfKy900tje9D3pMXI4ukw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Johan Jonker <jbx6244@gmail.com>
Cc: oxffffaa@gmail.com,
	kernel@sberdevices.ru,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mtd: rawnand: remove 'nand_exit_status_op()' prototype
Date: Mon, 11 Sep 2023 17:59:24 +0200
Message-Id: <20230911155924.764572-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230823105235.609069-1-AVKrasnov@sberdevices.ru>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'48919c6c48380aa1aec4243c7e6ad39e89d78539'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_090029_986296_11BE5C8F 
X-CRM114-Status: UNSURE (   5.35  )
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

On Wed, 2023-08-23 at 10:52:31 UTC, Arseniy Krasnov wrote:
> This function is exported and its prototype is already placed in
> include/linux/mtd/rawnand.h.
> 
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
