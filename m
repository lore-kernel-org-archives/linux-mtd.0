Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADCFC2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:34:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F26C42076E
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:34:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dmLE4hu2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="X+rA73r6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F26C42076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ySCOPFlWjQ2+YJsUQi775Dvni2ncDLpFEhYYwnhiHh8=; b=dmLE4hu2ouq0+Z8MlaN0Sg5qN
	buenW0QH0YQjW1kCy1qpqRqAuTEFAtfwPy9zUo5i70CFi9oD/KLWf1Cw2Un3ZYrIZa80uOSo432SH
	+TdQ3y8axHiQLg9qyAf6hGQ/0yS9w3LEzj2oyeSu20vdEatk+jqdSBjDmGqEVqwbOlPZN6MNWbwdV
	5REsFesVUbtGPeeDvLlNBUJj3tXJHSKdoQcHFtYKcvBk/8//t1vvM01DVDVSDVGompBwYYJsTSogR
	EdNzXuLPbpqjKGrRQBoG/gnDLeo9Ftva9qdMH1KMLHdSImpkZIKjJS/vU+FTA2KwJ8LCAw1UwjxS5
	XgxGfgAzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYS1-0002Ll-2V; Tue, 24 Nov 2020 13:33:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYMq-00088M-Nj
 for linux-mtd@merlin.infradead.org; Tue, 24 Nov 2020 13:28:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=X5DUE98moi230PHv1tVgCiHzV+UhCd8lztDnZO9kG5c=; b=X+rA73r6QDOVyee+DSa3rW8b35
 OeKaTwg4NHeZa8iiOjrhEjDtW7DX4fOMB9c6aebaBDKuxk+IsDdUW0f7EuZlr2Pov3PURxlMx5rSK
 PBcTmBTO0WyZ7LcgWQ6Xl/0zPJFv0c+ZKh43ZOCIkVopkoFOK48fZGWf8ai+Cj/OoZO3jhvVw5m5Q
 yaSWPl46Vb8ovXNenLX8KK6YPvBJf1LP9VoLMLET0fF69TiH7hVM4rzUe6WIONjC+Mkq9y1ueE05Y
 CfQTDXafYdPFj4peFCtKw/0RrMBMz1uLe6nNpgZh858syqReHUhfMsbGLdWOS/inGodpPctzqcSuj
 FQUx+Tzw==;
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYMo-0006YR-Rc; Tue, 24 Nov 2020 13:28:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 19/45] init: cleanup match_dev_by_uuid and match_dev_by_label
Date: Tue, 24 Nov 2020 14:27:25 +0100
Message-Id: <20201124132751.3747337-20-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201124132751.3747337-1-hch@lst.de>
References: <20201124132751.3747337-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>,
 xen-devel@lists.xenproject.org, linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Avoid a totally pointless goto label, and use the same style of
comparism for both helpers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 init/do_mounts.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index afa26a4028d25e..5879edf083b318 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -79,15 +79,10 @@ static int match_dev_by_uuid(struct device *dev, const void *data)
 	const struct uuidcmp *cmp = data;
 	struct hd_struct *part = dev_to_part(dev);
 
-	if (!part->info)
-		goto no_match;
-
-	if (strncasecmp(cmp->uuid, part->info->uuid, cmp->len))
-		goto no_match;
-
+	if (!part->info ||
+	    strncasecmp(cmp->uuid, part->info->uuid, cmp->len))
+		return 0;
 	return 1;
-no_match:
-	return 0;
 }
 
 /**
@@ -174,10 +169,9 @@ static int match_dev_by_label(struct device *dev, const void *data)
 	const char *label = data;
 	struct hd_struct *part = dev_to_part(dev);
 
-	if (part->info && !strcmp(label, part->info->volname))
-		return 1;
-
-	return 0;
+	if (!part->info || strcmp(label, part->info->volname))
+		return 0;
+	return 1;
 }
 
 static dev_t devt_from_partlabel(const char *label)
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
