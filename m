Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C34C4332F
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 06:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kAMabMSaLEf+f4eO41Az8PYxKtePfGFi9UDY/odxEXU=; b=3HKkLWZQRbyU74
	7Rl7Zie5Hdi9iqcd146ApgamQFy7JXErC//irRvEgFOuMTwR1D4Y1GEvwThtY99ZW6T7Hp93eIdfn
	doAkODnp6+GJWNme6s+Xc3ujCI3TDgZYQqbb93bGe9rDlRkpoEyNIiOEtinv91ajpAA8Kb98vBSAq
	W/sMQG3lVIF1lD5+g4MXFhQHgzcb91PWKhgs6j1fY6DY5fEOtay63lvia17WXegRPt3N79E3UeL50
	wK+AWUBcxvWlCxrhMTEDFagdLz6Fvh6Vx8wvR5fjI1hMttymAC5JlVSwnUcXqm3IKn4HdRnjRA23a
	3nE65svBXyR5KjKKm2NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0bgk-0032JU-0e;
	Wed, 08 Nov 2023 06:05:18 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0bgf-0032IX-2x
	for linux-mtd@lists.infradead.org;
	Wed, 08 Nov 2023 06:05:16 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1r0bgb-0000RT-J7; Wed, 08 Nov 2023 07:05:09 +0100
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1r0bgZ-007SxL-TZ; Wed, 08 Nov 2023 07:05:07 +0100
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1r0bgZ-00CUHU-2k;
	Wed, 08 Nov 2023 07:05:07 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] ubifs: describe function parameters
Date: Wed,  8 Nov 2023 07:05:06 +0100
Message-Id: <20231108060506.2976328-1-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_220513_958326_1A00F1F0 
X-CRM114-Status: GOOD (  10.78  )
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

With 16a26b20d2afd ("ubifs: authentication: Add hashes to index nodes")
insert_node() and insert_dent() got a new function parameter 'hash'. Add
a description for this new parameter.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311051618.D7YUE1Rr-lkp@intel.com/
---
 fs/ubifs/replay.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index c59d47fe79396..17da28d6247ac 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -365,6 +365,7 @@ static void destroy_replay_list(struct ubifs_info *c)
  * @lnum: node logical eraseblock number
  * @offs: node offset
  * @len: node length
+ * @hash: node hash
  * @key: node key
  * @sqnum: sequence number
  * @deletion: non-zero if this is a deletion
@@ -417,6 +418,7 @@ static int insert_node(struct ubifs_info *c, int lnum, int offs, int len,
  * @lnum: node logical eraseblock number
  * @offs: node offset
  * @len: node length
+ * @hash: node hash
  * @key: node key
  * @name: directory entry name
  * @nlen: directory entry name length
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
