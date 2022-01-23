Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC05C433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jan 2022 15:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xPMAggcpyYiHu5f/xSRS/zamIcoHI9lWPsLko5zENQI=; b=azBdy7ifL9JKhm
	3Fjhx6qrw/Iy2d8pjL5KbGBOEbdch44W8bLXhqjIbuIvqywMxUsXACoNhkFpfNrtKwhCw2xtE8z7U
	kBbURm4g0jfSVpa9QST2nxsq9JjUbp/0nh/RNkLI8YHt4ZVlHn9Y9/9EeIuZHZy6AgYHAIup2yGRp
	7FEImVwVbVdQSce8qf42DEeYVnlXIndGpwYw7rAVOsDANeN08CKRWaqkRTyh6STmYZJHqyu8Mk3cI
	VTkwIFlQRgg/wPrOhNsR2uKlgX/b5XHr8WaYyRbgVnW9CDxXgeEd37T+A4SpqoGdN5B+jzfAkW12l
	TgcZfcWf+l0J1T2ZtOdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBekA-0013wq-Mg; Sun, 23 Jan 2022 15:25:26 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBeiR-0013MA-Mc
 for linux-mtd@lists.infradead.org; Sun, 23 Jan 2022 15:23:41 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 167BD20003;
 Sun, 23 Jan 2022 15:23:32 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: ingenic: Fix missing put_device in
 ingenic_ecc_get
Date: Sun, 23 Jan 2022 16:23:32 +0100
Message-Id: <20220123152332.529757-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211230072751.21622-1-linmq006@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ece94312ff9b6bd0681d474606736410eccdbb8d'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_072339_938109_47EACD83 
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

On Thu, 2021-12-30 at 07:27:51 UTC, Miaoqian Lin wrote:
> If of_find_device_by_node() succeeds, ingenic_ecc_get() doesn't have
> a corresponding put_device(). Thus add put_device() to fix the exception
> handling.
> 
> Fixes: 15de8c6 ("mtd: rawnand: ingenic: Separate top-level and SoC specific code")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
