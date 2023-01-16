Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F0CC46467
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Jan 2023 23:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2i09zGjGA8XFA+oq44HugMt6GX2aJiXQ4Q1RI7sspa4=; b=BX5H3zIm25eKeg
	ZDD85bUC7uwcA4ePq23FqAxOi49oyT6M3DpxZ3MCEbc6xARdFzBYRY12bjTI0GhWZiq2K2k9wINEn
	OfzVoJeimGACyywYGmmiQas+TQhPDWNsb1VVhxVS6qb+JZx1XF6bHnpcH/fqCYCY+N11ULyoB/RcX
	JYCxFhGpoNj+B+P14NApclkxN/son0Zl03V1RNko3kfmhZmn2uVPpPHfMvAg52hcL1dOQ3IW6KY82
	dvpGQpWAyPFxE9Z8wiWM0qekqeVsI1FfHnDvWLCKPXjjw4VXIgXwWYiBmosSnuJgo7BYdY+C030B+
	TVi3chUz8pqbp6EGvIJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHZ2E-00CGy7-DY; Mon, 16 Jan 2023 23:37:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHZ2B-00CGxH-AC
	for linux-mtd@lists.infradead.org; Mon, 16 Jan 2023 23:37:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4CC5FB810B2;
	Mon, 16 Jan 2023 23:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA94AC433D2;
	Mon, 16 Jan 2023 23:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673912214;
	bh=N8IFuauoFBlRBCPllH9x+bpTPBvYcnFCohv+H6rAcmg=;
	h=From:To:Cc:Subject:Date:From;
	b=i1lWyLdD4VO3VFps3DuBp+8Z/vTP0S0L8hquBQo1OzEKM5RiCVb03zyaa6uMzedTX
	 iO+PY4M95I0DpX1uZh+drGIwSpqXeJyzFYra2/mnUauRT60MHI/Tl4IAw4Hq5d5spx
	 /etztWrnI3tYB4Y8amWjhYreLBTGZShe8EpVt8Pt6UZuUZy2/40MiPl/Tl+sw3XBdD
	 d6CD7VhJhG71U4IpdKuFFf7O7hFCCl/tzq3md/HZb2ddPMbmDav+jTk+AcqqDth0tG
	 97Q+xSZxDmiC3jSQmCDCuO+RDDk2yRr3WSprBBoXlSGuvwo4hDGAgM4yxUmFrG5A0/
	 yxaqOQjeS7BpQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Cc: linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-btrfs@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: update fscrypt git repo
Date: Mon, 16 Jan 2023 15:34:24 -0800
Message-Id: <20230116233424.65657-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_153659_539322_0103DED7 
X-CRM114-Status: GOOD (  11.48  )
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

From: Eric Biggers <ebiggers@google.com>

fscrypt.git is being renamed to linux.git, so update MAINTAINERS
accordingly.  (The reasons for the rename are to match what I'm doing
for the new fsverity repo, which also involves the branch names changing
to be clearer; and to avoid ambiguity with userspace tools.)

As long as I'm updating the fscrypt MAINTAINERS entry anyway, also:

- Move my name to the top, so that people bother me first if they just
  choose the first person.  (In practice I'm the primary maintainer, and
  Ted and Jaegeuk are backups.)

- Remove an unnecessary wildcard.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 42fc47c6edfd7..8d0ee9f17b4d4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8468,16 +8468,16 @@ F:	fs/fscache/
 F:	include/linux/fscache*.h
 
 FSCRYPT: FILE SYSTEM LEVEL ENCRYPTION SUPPORT
+M:	Eric Biggers <ebiggers@kernel.org>
 M:	Theodore Y. Ts'o <tytso@mit.edu>
 M:	Jaegeuk Kim <jaegeuk@kernel.org>
-M:	Eric Biggers <ebiggers@kernel.org>
 L:	linux-fscrypt@vger.kernel.org
 S:	Supported
 Q:	https://patchwork.kernel.org/project/linux-fscrypt/list/
-T:	git git://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
+T:	git https://git.kernel.org/pub/scm/fs/fscrypt/linux.git
 F:	Documentation/filesystems/fscrypt.rst
 F:	fs/crypto/
-F:	include/linux/fscrypt*.h
+F:	include/linux/fscrypt.h
 F:	include/uapi/linux/fscrypt.h
 
 FSI SUBSYSTEM

base-commit: 5dc4c995db9eb45f6373a956eb1f69460e69e6d4
-- 
2.39.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
