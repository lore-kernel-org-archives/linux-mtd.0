Return-Path: <SRS0=Ie18=GH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD89AC433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 12:30:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48A692076D
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jan 2021 12:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48A692076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=johnthomson.fastmail.com.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UsTH4jIEsVpXjyXkoyG59edtd+hgS+nCFk1aPFHaNxU=; b=CH2EGEH8+A18sPvN12xCL8C743
	hbqEPM0Pbx2HlP9fvmMZbjND9Z3Hekn3YsEt+N3dy0jZc2o6CC7vNNHXapdozxfbMML/iEcGLdn6l
	NBq2oZAfK0vZX6fAXFiRyNKqm+0lMXRDBa4Th5d0489hxxwsfdF0VtAszYzz2sXC027C0ttuKu6dx
	b+zz1NrTgsfJi0kmJt9SK0n1lSX5yx93uOOINkrjlomrfqbU0D/wl3qG25KlIQerW22XDPDoxGwba
	iCJuSCdUiqb7fFt38H4eAosMZ5+SS+BbvWEcoJUA2rGoWl9OF7T4d6ovkfgG93dQN+3RK68M94f9K
	mgUhSb6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwOzJ-0001VM-E0; Mon, 04 Jan 2021 12:29:29 +0000
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwOzG-0001U3-7Q
 for linux-mtd@lists.infradead.org; Mon, 04 Jan 2021 12:29:27 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 953C21BCC;
 Mon,  4 Jan 2021 07:29:21 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 04 Jan 2021 07:29:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com.au;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=ra0ZSP3fgrh3Ntl9dXdIZK0gWF
 qAVZMPjVTttFMYEWk=; b=eyaOVXN12bKf/8e5uVDiaXHYuqI6iLZJY99TW+PWNW
 UhaDWmCUXPzLetz6KWvbX40HOaO5gQXbyoI37LBCY67hTcNK5gGWJBz79225JfPa
 Z1bnH1j/HgQSRGI4TKJ3NaF9IQR1MbeBFUuFJEnT1lVjTSAnzniTu6Ry1/sIg+ea
 mZtsY0J6qFWFF0/vL0ukvJ+OLa2foPJ9MFwB01yAQ2gnKP4ZALIw5s+LR2FUN6z2
 XbskGrxGZtEKSq8yH5J3wUB/QPnn1K6Cv/7Ppnely+Jiuqhmgt2h1NQWgc985g5W
 tlGRjQk4sFf85sxKKzsOckX2eth1Huh39SDsqhP5Cs+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ra0ZSP3fgrh3Ntl9d
 XdIZK0gWFqAVZMPjVTttFMYEWk=; b=maSatCn5VPk7MIq20nVw+Yd2BEIMHxBfj
 DbeWMNilmC+M95v8spWJZwFfbEL3FUY+c/sPjBfLBAcVNZj/Xflx8/KFN6jafWRw
 y7y6KI6qTnX9DDcNHENSCbuOrlGYSTr86hg9vrrM7DeY7fTL3AMpLq9EicQsNEnU
 HDfaCYiKRcvrsWxhdt/VvPiBEFDsJXuqgdQ0r/W6ufzKqOXgP4ZH7mJzi9UcV588
 3QMVbfgE10FoSSwXOD4GG0Gzl1h728eD2ro6KafYCx8XysEzHMdk1r+SFpGmhizI
 8wf2Po1cXIMhNN0mcXfyuIfbB9UBHn5S1BwDJXIZ3NplqnR5yLRWQ==
X-ME-Sender: <xms:HgrzX6zudr_PzZ4WRTLH4ePyLElrTqeqcYSL1zaufkKISBT9dv3PSQ>
 <xme:HgrzX2RDmNb9ym1Smqkdo7zQgwhm9hKwQGA5J3FgD2_RJ43f-CBIWFiN1L8OQNoKb
 ZDpEOfJoXDtqCoxvA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdeffedggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeflohhhnhcuvfhh
 ohhmshhonhcuoehgihhtsehjohhhnhhthhhomhhsohhnrdhfrghsthhmrghilhdrtghomh
 drrghuqeenucggtffrrghtthgvrhhnpefffeeihfdukedtuedufeetieeuudfhhefhkefh
 tefgtdeuffekffelleetveduieenucfkphepuddvgedrudejjedrieehrddutddunecuve
 hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhithesjhho
 hhhnthhhohhmshhonhdrfhgrshhtmhgrihhlrdgtohhmrdgruh
X-ME-Proxy: <xmx:HgrzX8Xh8PotHl2ARVEZ2SvUQ7Xx_aUnV1ZZExWRmNT2B4Dt_SSqXQ>
 <xmx:HgrzXwiL5n-7xtKvYuH7EFOL1XaAyvWEhkVFZFzvsKHLj-8-nigpcw>
 <xmx:HgrzX8Amtu0VeLql3_6O_kn1Wj1HU1MplbUI0M4fGfNTnYiHQwQD1g>
 <xmx:IQrzX_-1pRLfdIJubsLSKXy-HRjcr7lkMe8stKRug1rl-n1shsriTg>
Received: from john.thome.spur.red (unknown [124.177.65.101])
 by mail.messagingengine.com (Postfix) with ESMTPA id A14B0240057;
 Mon,  4 Jan 2021 07:29:16 -0500 (EST)
From: John Thomson <git@johnthomson.fastmail.com.au>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [RFC PATCH] mtd: spi-nor: write support for minor aligned partitions
Date: Mon,  4 Jan 2021 22:28:53 +1000
Message-Id: <20210104122853.18428-1-git@johnthomson.fastmail.com.au>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_072926_454948_C2D18D35 
X-CRM114-Status: GOOD (  22.02  )
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
 John Thomson <git@johnthomson.fastmail.com.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Allow a uniform erase region spi-nor device to be configured
to use the non-uniform erase regions code path for an erase with:
CONFIG_MTD_SPI_NOR_USE_VARIABLE_ERASE=y

On supporting hardware (SECT_4K),
provides the facility for an erase to use the least number
of SPI-NOR operations, as well as access to 4K erase without
requiring CONFIG_MTD_SPI_NOR_USE_4K_SECTORS

Introduce mtd struct erasesize_minor,
the smallest erasesize supported by the device.

Do not prevent writing to mtd partitions where a partition boundary sits
on a minor erasesize boundary.

Signed-off-by: John Thomson <git@johnthomson.fastmail.com.au>

---
Have not tested on variable erase regions device
---
 drivers/mtd/mtdpart.c       | 52 ++++++++++++++++++++++++++++---------
 drivers/mtd/spi-nor/Kconfig | 10 +++++++
 drivers/mtd/spi-nor/core.c  | 12 +++++++--
 include/linux/mtd/mtd.h     |  2 ++
 4 files changed, 62 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 12ca4f19cb14..7e7d9900aaa2 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -38,10 +38,11 @@ static struct mtd_info *allocate_partition(struct mtd_info *parent,
 	struct mtd_info *master = mtd_get_master(parent);
 	int wr_alignment = (parent->flags & MTD_NO_ERASE) ?
 			   master->writesize : master->erasesize;
+	int wr_alignment_minor;
 	u64 parent_size = mtd_is_partition(parent) ?
 			  parent->part.size : parent->size;
 	struct mtd_info *child;
-	u32 remainder;
+	u32 remainder, remainder_minor;
 	char *name;
 	u64 tmp;
 
@@ -143,6 +144,7 @@ static struct mtd_info *allocate_partition(struct mtd_info *parent,
 		int i, max = parent->numeraseregions;
 		u64 end = child->part.offset + child->part.size;
 		struct mtd_erase_region_info *regions = parent->eraseregions;
+		uint32_t erasesize_minor = child->erasesize;
 
 		/* Find the first erase regions which is part of this
 		 * partition. */
@@ -153,15 +155,24 @@ static struct mtd_info *allocate_partition(struct mtd_info *parent,
 		if (i > 0)
 			i--;
 
-		/* Pick biggest erasesize */
 		for (; i < max && regions[i].offset < end; i++) {
+			/* Pick biggest erasesize */
 			if (child->erasesize < regions[i].erasesize)
 				child->erasesize = regions[i].erasesize;
+			/* Pick smallest non-zero erasesize */
+			if ((erasesize_minor > regions[i].erasesize) && (regions[i].erasesize > 0))
+				erasesize_minor = regions[i].erasesize;
 		}
+
+		if (erasesize_minor < child->erasesize)
+			child->erasesize_minor = erasesize_minor;
+
 		BUG_ON(child->erasesize == 0);
 	} else {
 		/* Single erase size */
 		child->erasesize = master->erasesize;
+		if (master->erasesize_minor)
+			child->erasesize_minor = master->erasesize_minor;
 	}
 
 	/*
@@ -169,26 +180,43 @@ static struct mtd_info *allocate_partition(struct mtd_info *parent,
 	 * exposes several regions with different erasesize. Adjust
 	 * wr_alignment accordingly.
 	 */
-	if (!(child->flags & MTD_NO_ERASE))
+	if (!(child->flags & MTD_NO_ERASE)) {
 		wr_alignment = child->erasesize;
+		if (child->erasesize_minor)
+			wr_alignment_minor = child->erasesize_minor;
+	}
 
 	tmp = mtd_get_master_ofs(child, 0);
 	remainder = do_div(tmp, wr_alignment);
 	if ((child->flags & MTD_WRITEABLE) && remainder) {
-		/* Doesn't start on a boundary of major erase size */
-		/* FIXME: Let it be writable if it is on a boundary of
-		 * _minor_ erase size though */
-		child->flags &= ~MTD_WRITEABLE;
-		printk(KERN_WARNING"mtd: partition \"%s\" doesn't start on an erase/write block boundary -- force read-only\n",
-			part->name);
+		if (wr_alignment_minor) {
+			tmp = mtd_get_master_ofs(child, 0);
+			remainder_minor = do_div(tmp, wr_alignment_minor);
+			if (remainder_minor == 0)
+				child->erasesize = child->erasesize_minor;
+		}
+
+		if ((!wr_alignment_minor) || (wr_alignment_minor && remainder_minor != 0)) {
+			child->flags &= ~MTD_WRITEABLE;
+			printk(KERN_WARNING"mtd: partition \"%s\" doesn't start on an erase/write block boundary -- force read-only\n",
+				part->name);
+		}
 	}
 
 	tmp = mtd_get_master_ofs(child, 0) + child->part.size;
 	remainder = do_div(tmp, wr_alignment);
 	if ((child->flags & MTD_WRITEABLE) && remainder) {
-		child->flags &= ~MTD_WRITEABLE;
-		printk(KERN_WARNING"mtd: partition \"%s\" doesn't end on an erase/write block -- force read-only\n",
-			part->name);
+		if (wr_alignment_minor) {
+			tmp = mtd_get_master_ofs(child, 0) + child->part.size;
+			remainder_minor = do_div(tmp, wr_alignment_minor);
+			if (remainder_minor == 0)
+				child->erasesize = child->erasesize_minor;
+		}
+		if ((!wr_alignment_minor) || (wr_alignment_minor && remainder_minor != 0)) {
+			child->flags &= ~MTD_WRITEABLE;
+			printk(KERN_WARNING"mtd: partition \"%s\" doesn't end on an erase/write block -- force read-only\n",
+				part->name);
+		}
 	}
 
 	child->size = child->part.size;
diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index 24cd25de2b8b..09df9f1a8127 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -10,6 +10,16 @@ menuconfig MTD_SPI_NOR
 
 if MTD_SPI_NOR
 
+config MTD_SPI_NOR_USE_VARIABLE_ERASE
+	bool "Disable uniform_erase to allow use of all hardware supported erasesizes"
+	depends on !MTD_SPI_NOR_USE_4K_SECTORS
+	default n
+	help
+	  Allow mixed use of all hardware supported erasesizes,
+	  by forcing spi_nor to use the multiple eraseregions code path.
+	  For example: A 68K erase will use one 64K erase, and one 4K erase
+	  on supporting hardware.
+
 config MTD_SPI_NOR_USE_4K_SECTORS
 	bool "Use small 4096 B erase sectors"
 	default y
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 20df44b753da..8e678e8e7537 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1225,7 +1225,11 @@ static u8 spi_nor_convert_3to4_erase(u8 opcode)
 
 static bool spi_nor_has_uniform_erase(const struct spi_nor *nor)
 {
+#ifdef CONFIG_MTD_SPI_NOR_USE_VARIABLE_ERASE
+	return false;
+#else
 	return !!nor->params->erase_map.uniform_erase_type;
+#endif
 }
 
 static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
@@ -2714,6 +2718,7 @@ static int spi_nor_select_erase(struct spi_nor *nor)
 {
 	struct spi_nor_erase_map *map = &nor->params->erase_map;
 	const struct spi_nor_erase_type *erase = NULL;
+	const struct spi_nor_erase_type *erase_minor = NULL;
 	struct mtd_info *mtd = &nor->mtd;
 	u32 wanted_size = nor->info->sector_size;
 	int i;
@@ -2746,8 +2751,9 @@ static int spi_nor_select_erase(struct spi_nor *nor)
 	 */
 	for (i = SNOR_ERASE_TYPE_MAX - 1; i >= 0; i--) {
 		if (map->erase_type[i].size) {
-			erase = &map->erase_type[i];
-			break;
+			if (!erase)
+				erase = &map->erase_type[i];
+			erase_minor = &map->erase_type[i];
 		}
 	}
 
@@ -2755,6 +2761,8 @@ static int spi_nor_select_erase(struct spi_nor *nor)
 		return -EINVAL;
 
 	mtd->erasesize = erase->size;
+	if (erase_minor && erase_minor->size < erase->size)
+		mtd->erasesize_minor = erase_minor->size;
 	return 0;
 }
 
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 157357ec1441..68659e05edc3 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -242,6 +242,8 @@ struct mtd_info {
 	 * information below if they desire
 	 */
 	uint32_t erasesize;
+	/* "Minor" (smallest) erase size supported by the whole device */
+	uint32_t erasesize_minor;
 	/* Minimal writable flash unit size. In case of NOR flash it is 1 (even
 	 * though individual bits can be cleared), in case of NAND flash it is
 	 * one NAND page (or half, or one-fourths of it), in case of ECC-ed NOR
-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
