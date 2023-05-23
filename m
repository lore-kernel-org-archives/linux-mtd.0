Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578A0C77B75
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 07:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TdSemvGqZdeFZ6GZlm0MBqxlva1xZLWXpBTxBtd6mvE=; b=z8CNO4tH2QlTYv
	KyRWRinGHtXkDg1J9CV+l/100XL0CrRpytmyufBR/cRANMGfAlfZIUxe4UMBWfJNoWmeWlTOybjSl
	qyF6QQ/klS9c9OjDbbO0n84unWOT7FUT0OsU0zsjv3AcxnaFWQ4rEAglYmLjjkdphmKmCdzEbyA/E
	E/PSgZGUOU0dZ/InHuQL34K+YM5RYKKZERJ80L8E/qtb38H65tegiBh3gZyAK9vIxfuwKFVGA8DjZ
	1/DEu/61US1TvVgzisbkGgFeW5SwR/G1zGnuyia7Hb1RUF6oWh1iP7T7cyC4R4Q5c4n/mMGBHr9+h
	qgVvS/gjSLjcjr4DjGbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Mj2-009HEc-21;
	Tue, 23 May 2023 07:46:32 +0000
Received: from [2001:4bb8:188:23b2:6ade:85c9:530f:6eb0] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Miy-009H91-2c;
	Tue, 23 May 2023 07:46:29 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mike Snitzer <snitzer@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Pavel Machek <pavel@ucw.cz>,
	dm-devel@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 18/24] dm: open code dm_get_dev_t in dm_init_init
Date: Tue, 23 May 2023 09:45:29 +0200
Message-Id: <20230523074535.249802-19-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523074535.249802-1-hch@lst.de>
References: <20230523074535.249802-1-hch@lst.de>
MIME-Version: 1.0
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

dm_init_init is called from early boot code, and thus lookup_bdev
will never succeed.  Just open code that call to early_lookup_bdev
instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm-init.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-init.c b/drivers/md/dm-init.c
index d369457dbed0ed..2a71bcdba92d14 100644
--- a/drivers/md/dm-init.c
+++ b/drivers/md/dm-init.c
@@ -293,8 +293,10 @@ static int __init dm_init_init(void)
 
 	for (i = 0; i < ARRAY_SIZE(waitfor); i++) {
 		if (waitfor[i]) {
+			dev_t dev;
+
 			DMINFO("waiting for device %s ...", waitfor[i]);
-			while (!dm_get_dev_t(waitfor[i]))
+			while (early_lookup_bdev(waitfor[i], &dev))
 				fsleep(5000);
 		}
 	}
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
