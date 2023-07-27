Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A382AC04A6A
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 15:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ejuVs5ecG/D38c5xqR07MfE8WBYR4c038pCwy2ju7V4=; b=VtuPyZNs8+Ix0H
	d4i+SpD8xUVd/yfz2E9DrkJaWkfPgVS7Uq0qKH/A0orjyl5t4twELvFB/JjU/3aU355g1kXNmZYcu
	6xqMnEqEgskKWep8YSOtdoKHMT+s47rS4VGu6qjlzjynd/VsrtPhaVFeKT1QxrztEzFRLBe71OdoA
	inhi2ZcGrswoGG+Gz0/tSABscQEzagMBqB5A5QQVr/TbtIVRd/nk4O+m/g4RXp7j89uq6L1QMHiEP
	pWMgWPKc/XLYcvdYpt1t0voy7InVtsZ2dZjssQ6DNUNTR6Ap1HchlUz+Iu6GPent+9SOkwKfrsqAS
	PQo9KHWqVFd5AqgIWUUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2kf-00Fla3-0F;
	Thu, 27 Jul 2023 15:18:05 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2ka-00FlQa-2O
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 15:18:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23F0FE0004;
	Thu, 27 Jul 2023 15:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690471073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jTWow8XZc1V1a7KC/LzFlJrnEWAhzW/wrrkH2swn2S8=;
	b=XMl/tBrbHfXa8vnxmWSXGcQUMH7v9E48yQOV82dOI0+RP4bIv8m30JmXdM7sjmBs71Rz05
	JnvUCnofD7U+Tmuaw1Xc7o4BeMjqdF6XWiPLIqRDy2BAJ+jNitwFDLEajRamnZnh1Zcfe1
	963PsxOfgiS6SEPTV2DdrVYLtDUEgyIX9V4vW9Rt1GbgkArGFjEB8pSShEw/hwPjuYMRot
	6chrU8KFiaKj7bVCxKUpjXEYKww8LF+o8aMmhKhTX/MO6OdA27/JKnxcalMT0x5Ht47h1m
	lpODmtca/GrCwidxcSTUhWSFFC81RvQcKNSnUSthzWBA0pOIIF7tsEVFE8noWQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Colin Ian King <colin.i.king@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] mtdblock: make warning messages ratelimited
Date: Thu, 27 Jul 2023 17:17:49 +0200
Message-Id: <20230727151749.586400-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719103354.2829366-1-colin.i.king@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd2236f6219fac62ee22d971e06a04148f4eb8cca'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_081800_927212_46066A30 
X-CRM114-Status: UNSURE (   7.06  )
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

On Wed, 2023-07-19 at 10:33:54 UTC, Colin Ian King wrote:
> When exercising various dev interfaces with stress-ng the mtdblock drivers
> can be (ab)used to generate a lot of warning messages. Make these rate
> limited to reduce the kernel log from being spammed with the same messages.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
