Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45155C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 12:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6d2aML3PKddfLm/e9loiRxuf1iyAR8Hl84c7qJkooZ4=; b=C+MtGifgBx8j0p
	KtOaHCel805FqeSHnXzJ/fKzzYjSPHXnyNWdke4RbD70z758pWOHKcHLo4ZaZhvm+q+T0CIEyUOXv
	HMJYOlb3vktLOX55fBIkYxeTyDQmYYmm9ZAABzC4NPQLFkG1nOEhyi2RzfxNsxWt72gFPmwizXeNw
	rluBzkqzX98dqSA2GV6ezx4JPLkE3OYJKHUWkPfM0FrPoMJJRxzARv9cIQho/zcRCY2BbyKojdfHk
	ziPzlyNHM9zJxb1qI7rRmpaFRSFAhqfD3AVPonOQ7H+n43t3FoLZzd8SF52DCb1QkwwK0gKc7qp2G
	vGkwuI1p5ohAsyiLxSTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHUw-001paW-I7; Thu, 09 Jun 2022 12:42:50 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHUt-001pZ9-1z
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 12:42:48 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1FE66E001B;
	Thu,  9 Jun 2022 12:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654778562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qivlgdc/cztAuyEVTvXwN0p2uVuSMV9HgTJpX4k6pDM=;
	b=Jj2sZBM4vkrS8sixZpkHNa6eZ3gYoPy0pMoREerBewJ5iU1VVEQgQe1oauXSQ9rrPN7Qrv
	HQAFc4JiJzacfcDxjXm8m1+x544Zqf3jn7MpToRpm4ZglxefAM8RL/mROKoKECuAoaxVxV
	+DIRu7CdNFCOxwIN6yiR+9p4KD3gbRiiH4zpUJrVy5I5wLD4XOpmfmpliABQXdZfXDGqLu
	efj/Lwb0Fvx7gQ2ekvubXpeEA44Y43mYC7PihymGlo0Lm/4s4/gAKgKj+BHI5cKZiDu83W
	aN/TOUuIXJxEtSkLV/3DSg3bIju9q9zMCjUnPdRxdnJV6KH3aFeVOPQ8/DWxzA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miaoqian Lin <linmq006@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: parsers: ofpart: Fix refcount leak in bcm4908_partitions_fw_offset
Date: Thu,  9 Jun 2022 14:42:40 +0200
Message-Id: <20220609124240.132923-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220605070726.5979-1-linmq006@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd2b8a88a113d20dad823e32cd6b63b94c2da49b5'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_054247_270871_F143EB2C 
X-CRM114-Status: UNSURE (   6.53  )
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

On Sun, 2022-06-05 at 07:07:23 UTC, Miaoqian Lin wrote:
> of_find_node_by_path() returns a node pointer with refcount incremented,
> we should use of_node_put() on it when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
> 
> Fixes: bb17230c61a6 ("mtd: parsers: ofpart: support BCM4908 fixed partitions")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
