Return-Path: <SRS0=DkJA=5E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC15C4332B
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Mar 2020 22:45:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BCB2206D7
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Mar 2020 22:45:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pvNLtTUt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="hKH/5423"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BCB2206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xUKtglcMTcnGnHUedwxuZuOSRA8wexdXC31OtdxicCA=; b=pvNLtTUt29jfmr
	YJGfBu/bW6NziF5W7cQW8pdsWWKyZobpWlUyOVwAAwxxyNzmO3swuUez6khxGxnitWbplkHvbBrZu
	bPpSuyGTdT/4bEEBIpKn3DI+6I4fz0qI6DtQU3AXNkgxGw2PCBsucBzeEIcHxKChsAJVNEfuTtD0g
	KJXiA6J+RR6C14sWYPnsB+7lBE+E3nQqCTeaBSYVSlrE4WzwSL3Ogo32RXG/rD4p5k9Zijoj4n/IW
	4ifzxu65Z036MWsBG6TfQHAvJ8Zo1rnGuxZkDGV6m3M2gf0Hpbc6SnUJxFT85+MHpFlEhaCr59axe
	+xau7kmaa/tNwBAfMWTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jF3u5-0007FG-8A; Thu, 19 Mar 2020 22:44:41 +0000
Received: from gateway34.websitewelcome.com ([192.185.148.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jF3u2-0007Ew-5J
 for linux-mtd@lists.infradead.org; Thu, 19 Mar 2020 22:44:39 +0000
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
 by gateway34.websitewelcome.com (Postfix) with ESMTP id 7A2812B2C6F
 for <linux-mtd@lists.infradead.org>;
 Thu, 19 Mar 2020 17:44:37 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id F3u1jMQLjXVkQF3u1jdWgu; Thu, 19 Mar 2020 17:44:37 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mdi7bmeTSr1/QS6tVQ+v3Sjx4frkWAZO7zkZil/DZh0=; b=hKH/5423jQln3zUYwq6hcU4rwz
 Zil2ZawfzkpYfYAPvZiW6BKI3dBmA0U9uiwZjFp3XHh1WkZT3NoRBSjPg9pmkd2T1nkPGMALFbqas
 9bxe6hBISKJyXAzb0cQ6mx8q0AbdrVkoj7T2TVw7uD+g56o7hzVwHcf6cmuXW9oLvqkSQQ54YwDN5
 oJ4gjsyS4Ay4ZNJWhqteTWa3Gu34v5yQz3gZmqxKHvVGW2HgE3ng25ZoJ+1Y5gP5jcFSxmgoOY+Jg
 srfOBojXHRt5tVkjAEaoTYyKSJ2TDDzs16qe2ApTJWy/7+SFvaXQ7pDvxP8cpxHn/cvGMSz0w0Nnh
 vmj0Slsw==;
Received: from cablelink-189-218-116-241.hosts.intercable.net
 ([189.218.116.241]:53960 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1jF3tz-002Dtq-Qb; Thu, 19 Mar 2020 17:44:35 -0500
Date: Thu, 19 Mar 2020 17:44:35 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH][next] mtd: ubi: ubi-media.h: Replace zero-length array with
 flexible-array member
Message-ID: <20200319224435.GA25590@embeddedor.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.218.116.241
X-Source-L: No
X-Exim-ID: 1jF3tz-002Dtq-Qb
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: cablelink-189-218-116-241.hosts.intercable.net (embeddedor)
 [189.218.116.241]:53960
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 43
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_154438_295168_C2237C1A 
X-CRM114-Status: UNSURE (   8.67  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/mtd/ubi/ubi-media.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
index b5fe8f82281b..386db0598e95 100644
--- a/drivers/mtd/ubi/ubi-media.h
+++ b/drivers/mtd/ubi/ubi-media.h
@@ -498,6 +498,6 @@ struct ubi_fm_volhdr {
 struct ubi_fm_eba {
 	__be32 magic;
 	__be32 reserved_pebs;
-	__be32 pnum[0];
+	__be32 pnum[];
 } __packed;
 #endif /* !__UBI_MEDIA_H__ */
-- 
2.23.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
