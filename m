Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB13C54E90
	for <linux-mtd@archiver.kernel.org>; Sun, 25 May 2025 16:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mYW+GX32Dx2S81VB87OsIz+ZeqUmSHe5sSLDHuh/8OA=; b=UMQuIww3LjjatV
	Xgjya603hkyWUvna6c/2XYoTS9oCZuxdpgh6SZFtx3E3WV770FNApqfZiZo8paNxwAqA0a5vHgrsF
	3sJxUc2FGh9OyMNiq5JXIO3Dik0+Uqw/l1wfai7kDIPvNhfoCBT8zRRM1zivVHyK1bkwu2vP4tX8Y
	kgQRdDzEVJdoJFmP5W0e9e1ZqTtTvaj3lXtBoDSrOaYqkD4s1pXeCQyX+WSmzJQkcM8fZv3LciJjf
	X6FN7kPzi5TI4HCNdyz79IigoLWUImQTiO+R+fV1hmCMN7hYvaJCYwXhK/6XzR61Bz9gJXHfhig4e
	lYfQ+hoB7TPp4+jMSKwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJEbf-00000007Mzv-2oZH;
	Sun, 25 May 2025 16:53:51 +0000
Received: from smtp-80.smtpout.orange.fr ([80.12.242.80] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJEbb-00000007Myx-3pvs
	for linux-mtd@lists.infradead.org;
	Sun, 25 May 2025 16:53:50 +0000
Received: from localhost.localdomain
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id JEbXuyhO3Q1a2JEbXuhZYT; Sun, 25 May 2025 18:53:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1748192025;
	bh=MS4BOzI8pIQH6Em3Qo4qOWc4O/UmRIVViLq3oo0QcKY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=scYq1qKTLRlllmiICeOLIfueUqB/6hw9etqG4F/30KkzN6rpMNO2Vbc484c3OqkOK
	 qWwnKY+lRYrFJoUHVkyUOp3JwPxxmyd+9POz++xRSKmRR545Z+NwPwEVBdqs05RnCC
	 1eyPiYtKBFNo+RxwTfGFTWGvFdqrx/TUzlag56bwarjXdnCND8HEjcUcMm5TTb+MF/
	 //gDATAJB7u7TIwH3t+ii28mg4UB+nFzvPilFsojeVfOZleWMWXQWqxlBXdcYR+w9M
	 D3wbQM/BTVyTkPUVTFEO1+/DP5Zybopd414wzt8u80QiDWq2i4ie11x75aT0zQ3vAZ
	 pXXaHVLa/yz0w==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 25 May 2025 18:53:44 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: Constify struct spi_nor_fixups
Date: Sun, 25 May 2025 18:53:31 +0200
Message-ID: <aa641732ba707ce3690217825c3ca7373ffde4f9.1748191985.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_095349_168357_63EF4DC1 
X-CRM114-Status: GOOD (  11.52  )
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

'struct spi_nor_fixups' are not modified in this driver.

Constifying these structures moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  23304	  13168	      0	  36472	   8e78	drivers/mtd/spi-nor/micron-st.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  23560	  12912	      0	  36472	   8e78	drivers/mtd/spi-nor/micron-st.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/mtd/spi-nor/micron-st.c | 8 ++++----
 drivers/mtd/spi-nor/spansion.c  | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index e6bab2d00c92..187239ccd549 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -189,7 +189,7 @@ static int mt25qu512a_post_bfpt_fixup(struct spi_nor *nor,
 	return 0;
 }
 
-static struct spi_nor_fixups mt25qu512a_fixups = {
+static const struct spi_nor_fixups mt25qu512a_fixups = {
 	.post_bfpt = mt25qu512a_post_bfpt_fixup,
 };
 
@@ -225,15 +225,15 @@ static int st_nor_two_die_late_init(struct spi_nor *nor)
 	return spi_nor_set_4byte_addr_mode(nor, true);
 }
 
-static struct spi_nor_fixups n25q00_fixups = {
+static const struct spi_nor_fixups n25q00_fixups = {
 	.late_init = st_nor_four_die_late_init,
 };
 
-static struct spi_nor_fixups mt25q01_fixups = {
+static const struct spi_nor_fixups mt25q01_fixups = {
 	.late_init = st_nor_two_die_late_init,
 };
 
-static struct spi_nor_fixups mt25q02_fixups = {
+static const struct spi_nor_fixups mt25q02_fixups = {
 	.late_init = st_nor_four_die_late_init,
 };
 
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index bf08dbf5e742..920bb8dd5dc2 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -578,7 +578,7 @@ static int s25fs256t_late_init(struct spi_nor *nor)
 	return 0;
 }
 
-static struct spi_nor_fixups s25fs256t_fixups = {
+static const struct spi_nor_fixups s25fs256t_fixups = {
 	.post_bfpt = s25fs256t_post_bfpt_fixup,
 	.post_sfdp = s25fs256t_post_sfdp_fixup,
 	.late_init = s25fs256t_late_init,
@@ -650,7 +650,7 @@ static int s25hx_t_late_init(struct spi_nor *nor)
 	return 0;
 }
 
-static struct spi_nor_fixups s25hx_t_fixups = {
+static const struct spi_nor_fixups s25hx_t_fixups = {
 	.post_bfpt = s25hx_t_post_bfpt_fixup,
 	.post_sfdp = s25hx_t_post_sfdp_fixup,
 	.late_init = s25hx_t_late_init,
-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
