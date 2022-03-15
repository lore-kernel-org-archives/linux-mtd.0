Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C04AC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Mar 2022 09:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMcTRNuibT14U++O+gzV89pGY3zkmzTXaviiZnm3QnE=; b=HxNxvmPNXAIxO3
	Jez4A/3HthRhBoM3iKkgkeiIOiAUsVJwTFZqy/X+B13zXF5B63+z1QkTc0TyJtk1I7l8O3JqbsulN
	an/20VI+DKGtISeupzSH/0dZ8z7PEhrRBFjO3CyoWdm0h/JB9SPLKpx7R+LDY+rvlHS5JDJcRk1Ub
	B6o+QBf0c8Ry7UxPnd/wRD+d3xID8PJoQm0knBTUkOdOzCs+xbD3pprGky7s/0BI3WGI5GCwdi13w
	rhz8qbWMzEds27hzApW6kd+KzVWhdxGYweDEMQ+qn5pqtEmLWn41PRbHaxhOQj21VoaOOr33ZygT0
	SBESXFxvnuhb1FMtV8hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU3sC-008dsV-Gs; Tue, 15 Mar 2022 09:53:48 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU3rv-008dlx-2C
 for linux-mtd@lists.infradead.org; Tue, 15 Mar 2022 09:53:32 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 25B2AFF80F;
 Tue, 15 Mar 2022 09:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647338008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UG3yNAQMM9vCyNqTE4hu4tbuokEHyVzyNAZZs4I7kOo=;
 b=G6+K/+wS0mWTWO+npFEUldw/9l242FS8IWEwSE0mIUzPskXvtNsylLU3ioUXTZhLmUZ2+Z
 bUNFkQ/Svdn3IvKS1juw2A1bfKU+4vA/O9Jt5Wnb19OC2N7fP/cWxhFycS5KsHEh/PQzZE
 dKEvdBrguZvsv6wQS54015SrMat27LW3YXqJr+G0OCMMj1CBdhUDPJS+h4uvfZ2bUi+/3g
 eeldy9+bpp6yEFxK0qgPjvW9kPUpQQ43/vXKnDz4cgDBCjSweG1Z08lVpAatD0+UFDx156
 Ra4y5+B8O+pw1kvSBZ8aH/+6aO+qImruW0q3u+nfcpHzeyot9Z6SHq684LZyyw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mtd: nand: ecc: mxic: Fix compile test issue
Date: Tue, 15 Mar 2022 10:53:25 +0100
Message-Id: <20220315095325.104208-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220314152336.75447-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'8f877b7eab9d60a9deef6beae95656b77d55ab75'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_025331_283229_8F9CDEE4 
X-CRM114-Status: UNSURE (   8.22  )
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

On Mon, 2022-03-14 at 15:23:36 UTC, Miquel Raynal wrote:
> Avoid random build errors with architectures which do not select
> HAS_IOMEM by depending on it in Kconfig.
> 
> This fixes the following warning:
> 
> /home/mraynal/0day/gcc-11.2.0-nolibc/s390-linux/bin/s390-linux-ld:
> drivers/mtd/nand/ecc-mxic.o: in function `mxic_ecc_probe':
> ecc-mxic.c:(.text+0x2244): undefined reference to `devm_platform_ioremap_resource'
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
