Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113F1C433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jan 2022 16:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O7gDvm4xBj+N1rfzwt2m4iBob72ke91fu0W4bRwgNT8=; b=JPRsE4VnqSnhI2
	jPmfxdVzZVDR37eAWSiZML9phC0qsjBQr3skJoPBW3me0AytVYrVmfGsrvmN4B/+gibIgh9rOVhZu
	LaiAVaSaibqdg+Tz+SdK0JublWtYOJb1Zgny8eOJH5efwqNL041iMvMUc2TPXvUoFXIVpL5YSURhY
	UVtL7aeXEeToQ936C45wnkAdxp43g5ZLEbpW4HAPiagoelw0V9YRfd9WzdLvFN8UXB+mKgHFv6XoG
	6E06LlNcFD/UMoL6zN9/m1GoLDTvUx1mZKSUN7R02iz+owLDXJz+aJmh25XFFFNrg/KZvwCQaW3Ed
	YggHBqJSxkLSOSfwsGlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBfQd-001I0Z-FJ; Sun, 23 Jan 2022 16:09:19 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBfQX-001Hy9-K2
 for linux-mtd@lists.infradead.org; Sun, 23 Jan 2022 16:09:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0074020004;
 Sun, 23 Jan 2022 16:09:09 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Colin Ian King <colin.i.king@gmail.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: omap_elm: remove redundant variable 'errors'
Date: Sun, 23 Jan 2022 17:09:09 +0100
Message-Id: <20220123160909.744397-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211221181340.524639-1-colin.i.king@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2212c19e51969213924ab538396b6c1e072c41f1'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_080913_861959_31215C7B 
X-CRM114-Status: UNSURE (   7.44  )
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

On Tue, 2021-12-21 at 18:13:40 UTC, Colin Ian King wrote:
> The variable 'errors' is being used to sum the number of errors
> but it is never used afterwards. This can be considered a
> redundant set of operations and can be removed.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
