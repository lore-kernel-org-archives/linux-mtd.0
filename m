Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A94C433FE
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jan 2022 15:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+owZw8BKaem/3XDSosytVqgEeH5jXC4JhgGARz/oec=; b=tTbuglw3uQe1pp
	UAYTj7q+Mx5FW/tKXwlbqZzjR42wid04aJMC1pG1AtVZH4B16UoOck8XXFxt5ITvJVl3ChIf5UN0z
	w/nlKgVo5c/yMC0JxKs3PI2sWO+CQhCyC2AE0lDasJxYYPwRg/nnulMV+NIOExMLwGO4YWuHXlqlI
	Z7YgEvrW6wl4fU4LKVp6ew1LQ3W7/7jmQN0+oiixeANTMVUxof67jc7zXoPT5vU/AWDbIH9H58ui6
	7o0EGT6NDcqeGT0TYxz1+kyQxU1hC3YqT8FXuyZbVQVCCb4FkH9QgcUVZTDK+SV4huCqOjuu+Mymv
	0MR7ceu8nTOLPuWF98ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBeiA-0013JK-8S; Sun, 23 Jan 2022 15:23:22 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBeht-0013GX-IG
 for linux-mtd@lists.infradead.org; Sun, 23 Jan 2022 15:23:07 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 611FA100006;
 Sun, 23 Jan 2022 15:23:02 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Roger Quadros <rogerq@kernel.org>, miquel.raynal@bootlin.com,
 krzysztof.kozlowski@canonical.com
Cc: vigneshr@ti.com, nm@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: omap2: Prevent invalid configuration and
 build error
Date: Sun, 23 Jan 2022 16:23:01 +0100
Message-Id: <20220123152301.529360-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220118123525.8020-1-rogerq@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'5a42a62fa94f6796440010495b0206c9688450e1'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_072305_771984_BEA732FC 
X-CRM114-Status: UNSURE (   7.27  )
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

On Tue, 2022-01-18 at 12:35:25 UTC, Roger Quadros wrote:
> We need to select MEMORY as well otherwise OMAP_GPMC will not be built.
> For simplicity let's select MEMORY and OMAP_GPMC unconditionally as
> this driver depends on OMAP_GPMC driver and uses symbols from there.
> 
> Fixes: dbcb124acebd ("mtd: rawnand: omap2: Select GPMC device driver for ARCH_K3")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
