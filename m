Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5C2C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Apr 2022 12:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EUjKaD3geoqaMjk8ajyWG9apS5LmDEVYTNolSKNv6Io=; b=aMJXon+V05ii4f
	8zW5schcmJQ2blLx1f5MPKCQaxsxaEh3BcKz950/T5JZjn7rDEqglwdeFGed0IHw0UhMBxmBsDIpa
	Snve7skGulV900V8HG1Kl5YtynMIW172QNoJhD8GNUCR7XjgBzwg6Ex+flSynvTnvMgulrbyrC7PB
	WxQZpqDog6Wt/PF+7VeL4H0pntjJcP2i5RsHjRFRE8mIEyQVtWCOqFWzX3fI+2Phx6LbJQIhwSxvy
	Aw75/zQtiexnsHRYiQ53QfwIs1jFK4XgMnTu6C2l8Wf/EfNSbJ44CXnTUek1Xf+1XwYiFCgHJE02C
	oPq2UTFruSS78gqR5+AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nixwA-009WDW-7f; Mon, 25 Apr 2022 12:35:30 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nixw2-009WA2-EG
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2022 12:35:26 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nixw0-0003n8-M7; Mon, 25 Apr 2022 14:35:20 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nixw0-0059MX-Lb; Mon, 25 Apr 2022 14:35:19 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nixvy-00E9pa-FN; Mon, 25 Apr 2022 14:35:18 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH] mtd-utils: nanddump: fix writing big images on 32bit machines
Date: Mon, 25 Apr 2022 14:35:16 +0200
Message-Id: <20220425123516.3372105-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_053522_537503_DB9AA434 
X-CRM114-Status: GOOD (  13.65  )
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

When writing a full 4GiB NAND to a file end_addr becomes 0x100000000.
With that writing out the first page to the file doesn't happen
because size_left is calculated to 0x100000000 - 0 = 0x100000000
which is then truncated to 32bit and becomes zero. Fix this by
using an appropriate 64bit type for size_left.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 nand-utils/nanddump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/nand-utils/nanddump.c b/nand-utils/nanddump.c
index d7fc320..47539f5 100644
--- a/nand-utils/nanddump.c
+++ b/nand-utils/nanddump.c
@@ -499,7 +499,7 @@ int main(int argc, char * const argv[])
 			}
 		} else {
 			/* Write requested length if oob is omitted */
-			size_t size_left = end_addr - ofs;
+			long long size_left = end_addr - ofs;
 			if (omitoob && (size_left < bs))
 				err = ofd_write(ofd, readbuf, size_left);
 			else
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
