Return-Path: <SRS0=qSHN=S5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826B3C43219
	for <linux-mtd@archiver.kernel.org>; Sat, 27 Apr 2019 15:15:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 533AD206A3
	for <linux-mtd@archiver.kernel.org>; Sat, 27 Apr 2019 15:15:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IuzDLZvJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 533AD206A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0SrkOhGyR/GO6BDvTI3qBf34yKIOjHIn1DHkJCAyz1A=; b=IuzDLZvJGIXeGZ
	OT9jD/CqqGoYIksvVdHKmbwNvn5epsw+eWoaIZ5HM7NQgynlQ97adDNvSytP3Qf8HgtbVhnJkYSQr
	X0ihr03Q1Y6ujBqYI60ywkU0kzd6UTEsjxKDC4Jg3j1HPo9J7e0gCa/VrlJ+9Vz4SqrZI5cZzBs/w
	+9PK/QQ5Adjtpi7s/IejZZBS+fZf5SityNnZAjGyuRWV84l0vBoKIcwz58cHW/0/vyZ4vC8jGzpvy
	bhbao1BKG3xR2eQrb3nIO0X8XsSjUKh0maXVs75jiBbUpU7GkBqNm9otiO0SnOgb2TgZ5jNLGVTu1
	EH2bIVsPiJdTW0kTSwdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKP2k-00006X-HQ; Sat, 27 Apr 2019 15:15:10 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKP2e-0007i2-LK
 for linux-mtd@lists.infradead.org; Sat, 27 Apr 2019 15:15:06 +0000
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 58C5130BDA05;
 Sat, 27 Apr 2019 15:15:02 +0000 (UTC)
Received: from thuth.com (ovpn-116-26.ams2.redhat.com [10.36.116.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A3D127CB8;
 Sat, 27 Apr 2019 15:15:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: maps: Make uclinux_ram_map static
Date: Sat, 27 Apr 2019 17:14:57 +0200
Message-Id: <20190427151457.12776-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Sat, 27 Apr 2019 15:15:02 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_081504_723162_01348C29 
X-CRM114-Status: GOOD (  13.31  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-kernel@vger.kernel.org,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The blackfin architecture has been removed a while ago, so there is
no more need to declare uclinux_ram_map as a global structure.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 drivers/mtd/maps/uclinux.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
index aef030ca8601..de4c46318abb 100644
--- a/drivers/mtd/maps/uclinux.c
+++ b/drivers/mtd/maps/uclinux.c
@@ -31,13 +31,7 @@
 #define MAP_NAME "ram"
 #endif
 
-/*
- * Blackfin uses uclinux_ram_map during startup, so it must not be static.
- * Provide a dummy declaration to make sparse happy.
- */
-extern struct map_info uclinux_ram_map;
-
-struct map_info uclinux_ram_map = {
+static struct map_info uclinux_ram_map = {
 	.name = MAP_NAME,
 	.size = 0,
 };
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
