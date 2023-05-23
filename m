Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F03FC77B75
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 07:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BmbtmLptXVLpyvaQp1+OZ730h9X0lXPTKL0KIH7V0VQ=; b=IZc7WZsN7cTedM
	kLzxtAglW7cwjr9SDZxgDmGIuFmTDiT3sUME0o3pghnu2QELXaQr4fZj2XRK0d8njyUmhMki3FNMU
	uR4rUUMldnDTo6nfTaN0/fJkTr7tgyTmItFgWNQvVrlL9j4VEC9AEumuF0vwPMOwCztEzTNjgU+Iq
	JMItT0i+SS1r3kohd0qfrL19Pf75eFBY7hebqDehMyxU9PYac5kwtt/QXMVNqVj3k2lpwI9rM0J+w
	ADvHvVF+kftpB7I+Pvr4FkiRJciy/Q0CH/lrAawEJDdwM+qAqzVGX4rdbevLTHcSI4FyPnV2JEtPR
	1CEL81NIqt/20YfaJCog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1MjC-009HPf-2l;
	Tue, 23 May 2023 07:46:42 +0000
Received: from [2001:4bb8:188:23b2:6ade:85c9:530f:6eb0] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Mj7-009HHx-1N;
	Tue, 23 May 2023 07:46:37 +0000
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
Subject: [PATCH 21/24] PM: hibernate: don't use early_lookup_bdev in resume_store
Date: Tue, 23 May 2023 09:45:32 +0200
Message-Id: <20230523074535.249802-22-hch@lst.de>
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

resume_store is a sysfs attribute written during normal kernel runtime,
and it should not use the early_lookup_bdev API that bypasses all normal
path based permission checking, and might cause problems with certain
container environments renaming devices.

Switch to lookup_bdev, which does a normal path lookup instead, and fall
back to trying to parse a numeric dev_t just like early_lookup_bdev did.

Note that this strictly speaking changes the kernel ABI as the PARTUUID=
and PARTLABEL= style syntax is now not available during a running
systems.  They never were intended for that, but this breaks things
we'll have to figure out a way to make them available again.  But if
avoidable in any way I'd rather avoid that.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Fixes: 421a5fa1a6cf ("PM / hibernate: use name_to_dev_t to parse resume")
---
 kernel/power/hibernate.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index c52dedb9f7c8e8..7ae95ec72f9902 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -1178,7 +1178,23 @@ static ssize_t resume_store(struct kobject *kobj, struct kobj_attribute *attr,
 	if (!name)
 		return -ENOMEM;
 
-	error = early_lookup_bdev(name, &dev);
+	error = lookup_bdev(name, &dev);
+	if (error) {
+		unsigned maj, min, offset;
+		char *p, dummy;
+
+		if (sscanf(name, "%u:%u%c", &maj, &min, &dummy) == 2 ||
+		    sscanf(name, "%u:%u:%u:%c", &maj, &min, &offset,
+				&dummy) == 3) {
+			dev = MKDEV(maj, min);
+			if (maj != MAJOR(dev) || min != MINOR(dev))
+				error = -EINVAL;
+		} else {
+			dev = new_decode_dev(simple_strtoul(name, &p, 16));
+			if (*p)
+				error = -EINVAL;
+		}
+	}
 	kfree(name);
 	if (error)
 		return error;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
