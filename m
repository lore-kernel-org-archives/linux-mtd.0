Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73232C001DC
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Jul 2023 16:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c87Qh7g2vxKgoGsNRVgtlUItDwW9LlE7vEkd1qSaZ7M=; b=JjlFtJbXOWk1TO
	AmTmbVawTpP/1T5ekXJWnFrsq+enkMP945zuMLWtFuJa44L1YcM4ZrGQP5cRhZILLCdxsMbjHD/CR
	MPlUvN3+VWzyYWQDmMHWwbPrUoKldHrTXHYq/D0bPzMW98G98MigswP+wfbovrmrnDaMI/DQaeJ/X
	zeA922ll9hSKjTMvTLHCn0qvScq9GESjmEQMLJByOjxBj2z/nJ7kH7oXyWJe5f0O4lMWcXvuqRxMW
	Jt/DtM9dbe8WNoRAoUwY2g1csZA11X7LYyCe4wFz4IMMqdzMaNyDAD4AgXOKGM55vnZsR7AqBsndQ
	zNGFdDSKOKcKz5ZzclyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhzc-0096xG-1N;
	Sat, 15 Jul 2023 16:19:36 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKhzY-0096uT-1s;
	Sat, 15 Jul 2023 16:19:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B81760005;
	Sat, 15 Jul 2023 16:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689437968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5eSGz3mdDJT8ii5lSTM1lv7ax6hZiqzfSWulMz49pEw=;
	b=cpVqsvmThjjQ8rjhsGQ7TRfrsXzx1zXOJsnGisC+xFld92EpXtx83zTE8H02zXHT6SydVr
	IbiRUgkHobbzgaQ5RSEbFGOQkWL0hVKx2pfV5ry7QKOBPJh5P1ZGy3/1RgQkqacdNNeWPo
	+mEGawmiEnhRFabXMow+Qwt/ljk4mMbFwX/B8ky/Jl86TKDMoigYBWDhe6s+AAXK/C9Kwr
	2Jdfou1E7s1z5IZ3yygogkf2adIZI2KxNySLaxbX6lcKoY0woM6DEokO/ZX5aiQsqatj7y
	Q06JJK/WTjZAln//bBYn78QKt2CDFK7den17iM8XMW39YHg0V9vQ3voajmO7Kg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Johan Jonker <jbx6244@gmail.com>,
	miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	heiko@sntech.de,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	yifeng.zhao@rock-chips.com
Subject: Re: [PATCH v5 1/2] mtd: rawnand: rockchip: fix oobfree offset and description
Date: Sat, 15 Jul 2023 18:19:25 +0200
Message-Id: <20230715161925.20644-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d202f12d-188c-20e8-f2c2-9cc874ad4d22@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd0ca3b92b7a6f42841ea9da8492aaf649db79780'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_091932_773659_93DA4B6B 
X-CRM114-Status: UNSURE (   9.24  )
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

On Fri, 2023-07-14 at 15:21:01 UTC, Johan Jonker wrote:
> Rockchip boot blocks are written per 4 x 512 byte sectors per page.
> Each page with boot blocks must have a page address (PA) pointer in OOB
> to the next page.
> 
> The currently advertised free OOB area starts at offset 6, like
> if 4 PA bytes were located right after the BBM. This is wrong as the
> PA bytes are located right before the ECC bytes.
> 
> Fix the layout by allowing access to all bytes between the BBM and the
> PA bytes instead of reserving 4 bytes right after the BBM.
> 
> This change breaks existing jffs2 users.
> 
> Fixes: 058e0e847d54 ("mtd: rawnand: rockchip: NFC driver for RK3308, RK2928 and others")
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
