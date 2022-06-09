Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4DBC43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 12:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8k5HxbBbm2J/pgi2nMr+dz8bx05DXttNtI5p1ZltQeY=; b=EJg4boonWyBsvW
	/H8xvb3jHyU0XKSTF/wqgqS1hI172dP3w/XbnYUZ87LY5qbFxW+KAXr7Pw09P4fMWJwhcM/+f9kP4
	HfRBwLLgr9JpvjlhVmVOWYiC3T4F4BfX1Uz/3ScxgfN/jjXe96IX1KrSFyD0Ej/RA/xpZl5EVRHu+
	P9erXWoq6pCIYHvibi7o/KMpp1EKPe076Ae3eUbdzrzjrvED8vuEg2UtqbhRAryev65me7j1brN1D
	9jR+00mzukUVXnmRcJ74fJoZdNWX9MxwUTNinJGARB6Ri571EYruHBh6HNrUIeTIPTdAGZ71acj5V
	HU+/PaQRKb6vb3zUDuog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHX6-001r6m-7N; Thu, 09 Jun 2022 12:45:04 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHWU-001qbH-C4
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 12:44:27 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A9CDD1BF210;
	Thu,  9 Jun 2022 12:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654778664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F5ZSToeEB4YLYYrt0Hm/nSJBH+HVxSfxNH1oQ0BpYBA=;
	b=X3lE4bYA80dhA8Tjx2zzr4vxS9eWKSv0kf9+Y0lVmwEzPyP308WNYQeZmZnmNAdfj8F3Uu
	jBpNtGMPOnLBAshF5LDSf5RDQR1WZlVLz/jL02iV3f45wz/t2K2Z9F+MecULTxfb7mFS5p
	ZZJgd6RuJodW1MzYJ0luARRy04Vn74OAAZEsYjta4vJggKLbL6R5Ip+LUKcIJRDCnZh2Y8
	D2HWvBASgwvyUzpnu1ldXCnoq3hpMNxTge2VffCzgrCzoR2CfW5nmHy/Ooc3VNXC0+lPDD
	Qv8ed5eKrpLT8aSY/J3+T5YXrH1y9UxsmovY9RY/UwK9udO44msGGEoPDmeSFg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Peng Wu <wupeng58@huawei.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	christophe.jaillet@wanadoo.fr
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	liwei391@huawei.com
Subject: Re: [PATCH v2] mtd: rawnand: cafe: fix drivers probe/remove methods
Date: Thu,  9 Jun 2022 14:44:23 +0200
Message-Id: <20220609124423.209280-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220520084425.116686-1-wupeng58@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'18178e03b124b0c6be17abbbca914157642f5d7a'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_054426_645057_AF56F82C 
X-CRM114-Status: UNSURE (   6.14  )
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

On Fri, 2022-05-20 at 08:44:25 UTC, Peng Wu wrote:
> Driver should call pci_disable_device() if it returns from
> cafe_nand_probe() with error.
> 
> Meanwhile, the driver calls pci_enable_device() in
> cafe_nand_probe(), but never calls pci_disable_device()
> during removal.
> 
> Signed-off-by: Peng Wu <wupeng58@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
