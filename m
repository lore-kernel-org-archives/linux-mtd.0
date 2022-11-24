Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE94C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Nov 2022 11:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k9hDry8VLK4DsVtoO2LrSM4LEt9UvLfkgv7YyBEmwUI=; b=LsNNo0b9ot/WoR
	AU/+6/HbOJmhPHN0P18QYX1ocgf1Ad8qvREPkwXyXfMOQ7hUUE1IGV3XpDJAp9VyxaHD1gSewzyQ5
	j0VXv3YR3jhdoFmgay6yBR1qsEmf/zXy0mVKrVloPRam+RipwGGjH9fTgy1AbdNbdg0GnSd+8q4OF
	iCTCrkYfCZQK9gqX8ng5O051lgUNsAtxEhqqQUfPD3lZP4zWL2lHuYdb5ALT0Tql1AK3XphXEjZLx
	cDZbWAAiFCgogwzewYfK4XQ2vtOjhjGpwEI/3/1APatNIxjGh9akwo1/vTVqiN7e7yKJ/3pdcj9F6
	dV0kWpX/4Q0/PotVMVcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyAWd-00874F-Qq; Thu, 24 Nov 2022 11:36:15 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyAWa-00871v-9K
	for linux-mtd@lists.infradead.org; Thu, 24 Nov 2022 11:36:14 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7400C100002;
	Thu, 24 Nov 2022 11:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669289768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vr8bKLhT8q0qJhXyoRNU+MZCNNRnvBRG3Flc0FO22Po=;
	b=lIYedw9PzsJwyvr2iLyIsekayL8TQ9T7L8ilsyaYrh1OsGq8eO54sQ1lBO+Jp1ZMt/T7jV
	gLH9o4goJJUBju+rZX1LeewHujdewqrR47jXQgE0HDn4NW4gxmMn50RkVp/ma3I+Vw0VjF
	4iV1w8xkpmoD3RrCjI9X2HvCxQWoTljEP8y/NiV3m6oQkvIggCc9SnN7GF1ssm5O6jUQ6u
	nbjO8/6C7LLf9enTjYFIDeyPW4O0QhnRnNm/xTH3UEssY0+oglMkXU/DuNgPegZM2tESVV
	cXAIDFJOuGuwfOQMlZvEa5VfPSVUjdTDLFLleeA8ygsI8AOOzUogEN/yDhF0yw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zheng Yongjun <zhengyongjun3@huawei.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: fix memory leak in pxa2xx_flash_probe()
Date: Thu, 24 Nov 2022 12:36:06 +0100
Message-Id: <20221124113606.266257-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221119073307.22929-1-zhengyongjun3@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2399401feee27c639addc5b7e6ba519d3ca341bf'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_033612_622905_4CA94B47 
X-CRM114-Status: UNSURE (   6.78  )
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

On Sat, 2022-11-19 at 07:33:07 UTC, Zheng Yongjun wrote:
> If '!info->map.virt' or '!info->mtd' success, 'info' should be
> freed before return. Otherwise there is a memory leak.
> 
> Fixes: e644f7d62894 ("[MTD] MAPS: Merge Lubbock and Mainstone drivers into common PXA2xx driver")
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
