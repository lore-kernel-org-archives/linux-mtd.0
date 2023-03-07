Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB09C678DB
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Mar 2023 19:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=37J2OHHpKjDQH2Ck6G5CkwdCxCgyCgHdYLOtTigAIww=; b=Bfc04PHOlkALbt
	G3v0B6+COqAsw3CATbF/IPiT0dU+u6envnXjXZdvE3grbEq3zn6wKGMXdjL9ANOhyOQE1YXiWWgF+
	uiSUHp4co3wCFKmbDpE4U+wo69ogMwcirIEShmJQ85nVDO53STgjGxzYcHJfXIdo3D1Ny98QAGZD9
	3VV/5caalzoYsdzNQvaY4qxyi8O+mE2qBP8psowHjB9iipjg2AelKFrzaiSx4Fc1pOO61cmmkuvZr
	g3mMhcP1eXFFeC0Q3TYu2oR1u9BCtvBYZ9ktdKkZv3klQvZhNSDFvc2s6EOL/TXMrUGa8m4z69+eL
	Z9eUm53BOKIAtj4qedvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZd2U-002GDe-Fg; Tue, 07 Mar 2023 19:31:58 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZd2R-002GCh-2j
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2023 19:31:56 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B1CD3100004;
	Tue,  7 Mar 2023 19:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678217509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jh2svqgNjDxTRpo66M435sQVNOl7qUZwvbg09/0bJLc=;
	b=ZdkyyeEtKQUSUE1ikWg6Y+kG87BSOskMwP7A+TthSU+D+TQYzi/jjmv3CF0On7yN9wt8ni
	HNDIN8wGj8pj+9TRBKSfxeQ+HcpLuqZLscxwux4a1ytO+Lp6ZYoTdxHgXFR+WQcVtzpwtx
	dY+uPxE5qmL8MkElQxeijV6lUAZ9MkL9Ms5PwkFCFZ111t2IXpLCl+nbrerPl+uUSm20Nw
	bTk8/g/CaPVl8DstVJJIVkVCTdzMiW1zPrjSLRcLnniQ4eQn/QKMNlc6+TAfMH8n34z0VH
	mT1hgPH8DuCJwVa/QhMbZgd7gYpMgPoRR+tN4XGA2jGjKZih2jgpTxbeEKNH3g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: parsers: remove reference to config MTD_NAND_TMIO
Date: Tue,  7 Mar 2023 20:31:47 +0100
Message-Id: <20230307193147.513133-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307074038.17391-1-lukas.bulwahn@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'4080d536241652af43996d9ceee2b79aeca57267'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_113155_316187_227DD308 
X-CRM114-Status: UNSURE (   7.46  )
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

On Tue, 2023-03-07 at 07:40:38 UTC, Lukas Bulwahn wrote:
> Commit 568494db6809 ("mtd: remove tmio_nand driver") removes the config
> MTD_NAND_TMIO and its corresponding driver.
> 
> Remove the reference in MTD_SHARPSL_PARTS to that removed config.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
