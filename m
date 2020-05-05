Return-Path: <SRS0=lVZn=6T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C65C47254
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2020 14:02:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6868D20746
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2020 14:02:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kJKOq9Ue"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6868D20746
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vxnd+L2MuIpg1qgZB+NXM49U8VEtqKJlegRoAQcTuIc=; b=kJKOq9Ue+LnKZU
	svcSFH4WMvVJoFoOv+xzCeXbUo9GtP6dNZV3sEZ1FuNgnuuPJ4yoT2WhNoZHQC7fdfruTYG3f6jhU
	4agmxjzrJPAkgQ27wbIdu6xPurVn09Ia+wTc3eY0zlRm7UG28tB57Qgy24GB1PuLmA5xVMgmoXPGv
	nMjCPzfynA9qwiVzeqXOB4sCOp3bjfeqEy0mY3wrrkauvJWnmhjy0RrPsRgHUm//ChGk8TKCok3bE
	3Gy6jX7qxFMwDaGY3jMJLNrLPEvqIVWwUm90eWjxF/4SlAThOlkYgnvC/tJiZDf1lfdbfss2oACLq
	xGErUyMgcZRcC+udz22A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVy8z-0001g3-5a; Tue, 05 May 2020 14:01:57 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVy8v-0001eT-SJ
 for linux-mtd@lists.infradead.org; Tue, 05 May 2020 14:01:55 +0000
Received: from localhost.localdomain ([149.172.19.189]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MuDsZ-1jHTUl1QxZ-00uWRX; Tue, 05 May 2020 16:01:38 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Vincenzo Aliberti <vincenzo.aliberti@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: lpddr: fix excessive stack usage with clang
Date: Tue,  5 May 2020 16:01:16 +0200
Message-Id: <20200505140136.263461-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:iaIPMXhwT+Ozi6/EpaDCzPQ6tOZ0YRFJlPmWlpkMXIOGy4GtadE
 2Z+LvOLt48OWBL8tlphxtGjgLmEv5xt9TTGL54IbLKq9dBjrTyohtYUyJgkuQXyGFBJuxzc
 6osWPaVYP906+AjTqqJo7C8bulY+GI4nc8qQYAYy/TF4rtBahP77hmt5uWz15rbdppHrlZ1
 d2CaYJdcLUkSTeHBRS/3Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZKEdyWcVvbU=:zYkDpW+KkqOFvxVL4/YtNm
 9RlRgywDUlI6jWeDBe9CgT6v4zfsrTYQx9nUJBpcgMa1WwlbhNH+MYM8vGwR6zecGtm/xoqH2
 GsLnyQytBgbIyv6dibT0Un4WucwiF1kgU2Dw2cCbkBmHF2tjhxBI1lsyZZcEiBD09JW539gOy
 B2DwwiGt1ARK+9SXIGsEAEh/R4IhX9XWgvR3/35YJc0+0NiOXuEevJPbDmMS8WNwc0iKCO9C5
 6QhAnXFNVGfRuDv5FZGzYGq1d8Yf1MgAJpylYydDSflY3PSaUuIBavOTvq+0YJ+4Uhj/SO49J
 UBhgVHGa/th64j4rCrhZ2puCZZRSXmLFg1gurJYVTVUbMWxbdPeywDtaNPLrkjcuNRPCPbGDs
 vahrHJP9tGpIZDhp3cTatj9www2/VrSG9bezmcdCY3Y6Gjra81B5tzJi+z2tAejKO1bdoA3eI
 e1kEvWTFqJEkgRbRM3yBGP/J8iEEZH65eUbaVpoZk+AGWV4nGA6/ZWhMSlWD7yqcsssVz2ptK
 B7gazvUT31WlAJwYWPU9u7mwAGttdJvPMtZF7g0bblT46ydiDoBAVjVhqi7sZa7slRw+3fZsC
 WRAE6KxqjAB8rH2pGfvGJnmF7UWlfIQdNI1mjjmhWNhm7ICV+BONcVnpj9zM6Xc1kYGTTGl7x
 sJAk9yh9Fs1AaW+O1fOfFjnW2ApxftOdLkAAFVc8y0JbZUhaNykwjJcIwTo/dL10KVPoOT+pO
 shuX5bITpPs9W9S0y3YkJIJTkHW4N90ZNkF2DuTyr5DP1JtiKLCL85NbGDKIEN+S/a35DRqdA
 T2TdfwELWOQHqK+OeflGC5Bo4P0y9AgaidrVeSz5sZp+KV3yWk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_070154_211081_28F71512 
X-CRM114-Status: GOOD (  15.19  )
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
Cc: Richard Fontana <rfontana@redhat.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Building lpddr2_nvm with clang can result in a giant stack usage
in one function:

drivers/mtd/lpddr/lpddr2_nvm.c:399:12: error: stack frame size of 1144 bytes in function 'lpddr2_nvm_probe' [-Werror,-Wframe-larger-than=]

The problem is that clang decides to build a copy of the mtd_info
structure on the stack and then do a memcpy() into the actual version. It
shouldn't really do it that way, but it's not strictly a bug either.

As a workaround, use a static const version of the structure to assign
most of the members upfront and then only set the few members that
require runtime knowledge at probe time.

Fixes: 96ba9dd65788 ("mtd: lpddr: add driver for LPDDR2-NVM PCM memories")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mtd/lpddr/lpddr2_nvm.c | 35 ++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/lpddr/lpddr2_nvm.c b/drivers/mtd/lpddr/lpddr2_nvm.c
index 0f1547f09d08..72f5c7b30079 100644
--- a/drivers/mtd/lpddr/lpddr2_nvm.c
+++ b/drivers/mtd/lpddr/lpddr2_nvm.c
@@ -393,6 +393,17 @@ static int lpddr2_nvm_lock(struct mtd_info *mtd, loff_t start_add,
 	return lpddr2_nvm_do_block_op(mtd, start_add, len, LPDDR2_NVM_LOCK);
 }
 
+static const struct mtd_info lpddr2_nvm_mtd_info = {
+	.type		= MTD_RAM,
+	.writesize	= 1,
+	.flags		= (MTD_CAP_NVRAM | MTD_POWERUP_LOCK),
+	._read		= lpddr2_nvm_read,
+	._write		= lpddr2_nvm_write,
+	._erase		= lpddr2_nvm_erase,
+	._unlock	= lpddr2_nvm_unlock,
+	._lock		= lpddr2_nvm_lock,
+};
+
 /*
  * lpddr2_nvm driver probe method
  */
@@ -433,6 +444,7 @@ static int lpddr2_nvm_probe(struct platform_device *pdev)
 		.pfow_base	= OW_BASE_ADDRESS,
 		.fldrv_priv	= pcm_data,
 	};
+
 	if (IS_ERR(map->virt))
 		return PTR_ERR(map->virt);
 
@@ -444,22 +456,13 @@ static int lpddr2_nvm_probe(struct platform_device *pdev)
 		return PTR_ERR(pcm_data->ctl_regs);
 
 	/* Populate mtd_info data structure */
-	*mtd = (struct mtd_info) {
-		.dev		= { .parent = &pdev->dev },
-		.name		= pdev->dev.init_name,
-		.type		= MTD_RAM,
-		.priv		= map,
-		.size		= resource_size(add_range),
-		.erasesize	= ERASE_BLOCKSIZE * pcm_data->bus_width,
-		.writesize	= 1,
-		.writebufsize	= WRITE_BUFFSIZE * pcm_data->bus_width,
-		.flags		= (MTD_CAP_NVRAM | MTD_POWERUP_LOCK),
-		._read		= lpddr2_nvm_read,
-		._write		= lpddr2_nvm_write,
-		._erase		= lpddr2_nvm_erase,
-		._unlock	= lpddr2_nvm_unlock,
-		._lock		= lpddr2_nvm_lock,
-	};
+	*mtd = lpddr2_nvm_mtd_info;
+	mtd->dev.parent		= &pdev->dev;
+	mtd->name		= pdev->dev.init_name;
+	mtd->priv		= map;
+	mtd->size		= resource_size(add_range);
+	mtd->erasesize		= ERASE_BLOCKSIZE * pcm_data->bus_width;
+	mtd->writebufsize	= WRITE_BUFFSIZE * pcm_data->bus_width;
 
 	/* Verify the presence of the device looking for PFOW string */
 	if (!lpddr2_nvm_pfow_present(map)) {
-- 
2.26.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
