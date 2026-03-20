Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E391099B4C
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2026 22:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n58ekitKhPiQ5NZucD9IrcqijKhMvDCvuqIJb/WVW9Q=; b=c+SOGm9EzgvEu6
	xiCWuFH98nt1jhs0HfBBahERGV6ctlBFmdK0IOKxKOxpyBcjcop/v+j+0YGDmhEckNVKo0KJCw60v
	ULEqXJZNV8C9tyk6RuZZgW8edG2a6mFcTgMsVo2djapUYCVO8HC5ejtnic4xTT+Zw7oJaBtUQ6XOh
	wNFUpY/lveBOEoqcBSFG0SfqoVlQpd1uNinct5liN3xCxsEgHuZYROOP70Q9GyrXQXSik2t68nFNy
	w5wDIcnVEcBuzCFbfh8Ft1AWMN3qYbxTq2odEgNfEQA/XD38TkWRsbjuP8Yvx7F7Lq4VWXDwjlydx
	P+G1b/I09a200PoWwoJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3iWi-0000000Djh5-3v8N;
	Fri, 20 Mar 2026 22:41:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3iWM-0000000Dj3x-48rB;
	Fri, 20 Mar 2026 22:40:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1893160141;
	Fri, 20 Mar 2026 22:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ECCFC4CEF7;
	Fri, 20 Mar 2026 22:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774046445;
	bh=sJsnVE59stSeWATG7qlVuZYBseXJSjXjZYGmtSdmRzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K1kclIJDvpcatekEIiKHG9JLd6yodFFlAIimrHkQrYpfpaP1j083wqjfQWuqEPaAW
	 jK/AXSOIeeUMo2zyW/8jErZ2Ttt6yeHOlqzmSnEX0soB69ZhZQPdvd4Kkw+8F1ya/E
	 Bhg55hrFfeQRgRtfiJH31w6IqxgqmTfzjKX9uzowCmnX4LQpdBAredD1TMCm85ytAJ
	 0T4oBFH4/404Ahf7q0mLNvE/PhIzDdEKpljKRgrEXbdFoEF4ZVatPwEanwAbtpUZdQ
	 8XCqkSS7grldEDxzRlQ8cWj2uKIUTeMDSAsVRTzI7glhE0bC9YnNsGvx2Qo2X6+Arm
	 tf/+H4W3fsB2g==
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Clemens Ladisch <clemens@ladisch.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Bodo Stroesser <bostroesser@gmail.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: [PATCH v4 14/21] mtdchar: replace deprecated mmap hook with mmap_prepare, clean up
Date: Fri, 20 Mar 2026 22:39:40 +0000
Message-ID: <d036855c21962c58ace0eb24ecd6d973d77424fe.1774045440.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774045440.git.ljs@kernel.org>
References: <cover.1774045440.git.ljs@kernel.org>
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

Replace the deprecated mmap callback with mmap_prepare.

Commit f5cf8f07423b ("mtd: Disable mtdchar mmap on MMU systems") commented
out the CONFIG_MMU part of this function back in 2012, so after ~14 years
it's probably reasonable to remove this altogether rather than updating
dead code.

Acked-by: Richard Weinberger <richard@nod.at>
Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 drivers/mtd/mtdchar.c | 21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 55a43682c567..bf01e6ac7293 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -1376,27 +1376,12 @@ static unsigned mtdchar_mmap_capabilities(struct file *file)
 /*
  * set up a mapping for shared memory segments
  */
-static int mtdchar_mmap(struct file *file, struct vm_area_struct *vma)
+static int mtdchar_mmap_prepare(struct vm_area_desc *desc)
 {
 #ifdef CONFIG_MMU
-	struct mtd_file_info *mfi = file->private_data;
-	struct mtd_info *mtd = mfi->mtd;
-	struct map_info *map = mtd->priv;
-
-        /* This is broken because it assumes the MTD device is map-based
-	   and that mtd->priv is a valid struct map_info.  It should be
-	   replaced with something that uses the mtd_get_unmapped_area()
-	   operation properly. */
-	if (0 /*mtd->type == MTD_RAM || mtd->type == MTD_ROM*/) {
-#ifdef pgprot_noncached
-		if (file->f_flags & O_DSYNC || map->phys >= __pa(high_memory))
-			vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
-#endif
-		return vm_iomap_memory(vma, map->phys, map->size);
-	}
 	return -ENODEV;
 #else
-	return vma->vm_flags & VM_SHARED ? 0 : -EACCES;
+	return vma_desc_test(desc, VMA_SHARED_BIT) ? 0 : -EACCES;
 #endif
 }
 
@@ -1411,7 +1396,7 @@ static const struct file_operations mtd_fops = {
 #endif
 	.open		= mtdchar_open,
 	.release	= mtdchar_close,
-	.mmap		= mtdchar_mmap,
+	.mmap_prepare	= mtdchar_mmap_prepare,
 #ifndef CONFIG_MMU
 	.get_unmapped_area = mtdchar_get_unmapped_area,
 	.mmap_capabilities = mtdchar_mmap_capabilities,
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
