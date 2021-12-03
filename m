Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE1AC433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Dec 2021 13:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yv0u/Nbs083evtb4zNVEjNClN9B8ruP+fUTDGhIQfGg=; b=hGA1lwviSkSqWN
	YqDrY7tMQjA2iGJ+gnRPBjLPMb2kCNOKJUv+7LjYfgpTmPPMiIUoiwUvMVa3TIzy/VCtSQ/a7FciU
	om4wYeWjPI57FFl2gOcRZ3kYDJxuH3I75dCxY5grIyKB1M5TKw4Dudc8LLIKnM5hOgHtBjJOLQHb7
	XnqL1pE5M7rtHCSHZ2dg+T3bfuRL+aSWR48zb29e4sxbhLhIRXkTeONhJI3fTVm14GAh0vXbGOdrx
	/hHgXTsquptyYXB3Rm7F/M9BvrC5zfxkXY7oR3zaAsQmVqYfAilpWpSuDYEuXvsoaw+sOVPCuEqRL
	65fBRxtmxsKnp7K7qaWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt8lL-00FzUb-GL; Fri, 03 Dec 2021 13:38:07 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt8ko-00FzLx-OP
 for linux-mtd@lists.infradead.org; Fri, 03 Dec 2021 13:37:36 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C6F88FF80D;
 Fri,  3 Dec 2021 13:37:31 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH] mtd: Introduce an expert mode for forensics and debugging
 purposes
Date: Fri,  3 Dec 2021 14:37:31 +0100
Message-Id: <20211203133731.1450042-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211118114659.1282855-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ba8546c1dfdc3f431803523272f6269a9fc0af5e'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_053734_956059_65DC6F26 
X-CRM114-Status: UNSURE (   8.25  )
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

On Thu, 2021-11-18 at 11:46:59 UTC, Miquel Raynal wrote:
> When developping NAND controller drivers or when debugging filesystem
> corruptions, it is quite common to need hacking locally into the
> MTD/NAND core in order to get access to the content of the bad
> blocks. Instead of having multiple implementations out there let's
> provide a simple yet effective specific MTD-wide debugfs entry to fully
> disable these checks on purpose.
> 
> A warning is added to inform the user when this mode gets enabled.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
