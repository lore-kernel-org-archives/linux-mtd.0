Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1D9C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jan 2022 15:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QEd8jwU/BBFlVMiZMlkpM6i9aNBXwDDkPAhTQQnOHD8=; b=T1imbM9VLpO9EI
	nlHNAVZJ/AOa3BThA02gdrORlXTnWMtCtIGtulFe9a/9BdTA1l2D0x/YzFmbVwlfIvwgD8pnN0ItQ
	6BZW4MkoiibsMeMDGkoXMuYikW98jQUNSpt5XZKbAv33Bh4Sgu2iUwbU63qPzgRChKERfk7cMR3TI
	4mXfXxrabF6ik/FpHiizA3IucaaTEKJ9lC5hncqPE0snzw5df4LHO+W8e7NBFxyoXlY+ehJqeNgdM
	gPFG57ftnoOFSZU6VZPlchsGJiRl/eDXL76YF1ifTdRMCnfw4dadShB+N4+l42mftOBSx3ZmAcJUd
	6E+UE+jgMZmHa9c+FxVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBehy-0013HJ-FR; Sun, 23 Jan 2022 15:23:10 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBehr-0013GH-Iu
 for linux-mtd@lists.infradead.org; Sun, 23 Jan 2022 15:23:05 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F2A67100005;
 Sun, 23 Jan 2022 15:22:56 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Joern Engel <joern@lazybastard.org>, yangerkun <yangerkun@huawei.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] mtd: phram: Prevent divide by zero bug in phram_setup()
Date: Sun, 23 Jan 2022 16:22:56 +0100
Message-Id: <20220123152256.529296-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220121115505.GI1978@kadam>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'4f82eb6b4aec9d584c9dd370087db7a87c88bcb6'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_072303_797350_64E2EB41 
X-CRM114-Status: UNSURE (   9.08  )
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

On Fri, 2022-01-21 at 11:55:05 UTC, Dan Carpenter wrote:
> The problem is that "erasesize" is a uint64_t type so it might be
> non-zero but the lower 32 bits are zero so when it's truncated,
> "(uint32_t)erasesize", then that value is zero. This leads to a
> divide by zero bug.
> 
> Avoid the bug by delaying the divide until after we have validated
> that "erasesize" is non-zero and within the uint32_t range.
> 
> Fixes: dc2b3e5cbc80 ("mtd: phram: use div_u64_rem to stop overwrite len in phram_setup")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
