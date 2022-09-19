Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35D7C54EE9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Sep 2022 16:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GBVQs9aUZdSG8P9YQ4S5YAP0/lHol+SIN4f8pmgBGAI=; b=BKeWXQf0cK8XdF
	BTn61jiLL7U1B2P9w7Vcu8cRkBI9RiBSyiMnqhQoMalVNzpIouMScPq5Z5FgShwNVZcMPpf/YWkfl
	cDX/M1KTyC/Na7gjpbvMjaNdNFNixMPx83dR8cjwzFHJXxndHMQB05rLCQUMLEbDYTfg7Uzx5gLzR
	00dAe/Sit8Y0vaeFpR9z1xNYbpzC0ZQZNnTxN2ZTIm6bsQRah35ABanpLhvDua5uAKu2YqL0SfVkg
	qdkMdudFOokYCo7wlvVxh1jWpYJdJRTEi/26aO6z9FWY/bDB2ZNCEpzfwXQVbR9a7XM7+O5UURKNx
	t5HoclGlJeNwmjujMybQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJRU-00Co7B-Qf; Mon, 19 Sep 2022 16:16:20 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJRQ-00Co2d-N8
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2022 16:16:18 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0E0F7240005;
	Mon, 19 Sep 2022 16:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663604174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2igv61d+yyXjIWPMPbUkwtzPP4hi7M6BgZTabOpDc88=;
	b=VkKbhl/59oKwtZv/rP75n83KA9m00eOMhteiylV0vS4t8mxs5tCfZTDTaA6z2bUnteyXjT
	ABN7+185TmxaHqGOglN8arrBlO6RJeerqtL4FwJuI2jKy+6XW/KeA8QjfgD2SuBJ4ciX7I
	EfpGwzg3rZ3C3ZWcpZ/9IbksUglBTnLvMTpKvUHYa+AO7HZfbwXAC7WM2GUaH83foyPKv8
	iZmtU/xDX+mx8zjuXS3Zkr0GvMEaPlkeHm0oGh/GjFo1XbGSXM+R3K0EbSh/gAyEOFQdmx
	uPV+pSwzgTuvNijrZHKOoh/sq7Y1c0SV/kvID6mwczY7IG/vaIODHLEDotE99A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: williamsukatube@163.com,
	robert.jarzmik@free.fr,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: William Dean <williamsukatube@gmail.com>,
	Hacash Robot <hacashRobot@santino.com>
Subject: Re: [PATCH] mtd: check the return value of devm_ioremap() in docg3_probe()
Date: Mon, 19 Sep 2022 18:16:12 +0200
Message-Id: <20220919161612.226599-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220722091644.2937953-1-williamsukatube@163.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'26e784433e6c65735cd6d93a8db52531970d9a60'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_091616_969396_CE425FD6 
X-CRM114-Status: UNSURE (   6.83  )
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

On Fri, 2022-07-22 at 09:16:44 UTC, williamsukatube@163.com wrote:
> From: William Dean <williamsukatube@gmail.com>
> 
> The function devm_ioremap() in docg3_probe() can fail, so
> its return value should be checked.
> 
> Fixes: 82402aeb8c81e ("mtd: docg3: Use devm_*() functions")
> Reported-by: Hacash Robot <hacashRobot@santino.com>
> Signed-off-by: William Dean <williamsukatube@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
