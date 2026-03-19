Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1BD109190D
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Mar 2026 18:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9dhc44wDW2CsxjQ+2IBo/8lPbj8cHd1yyZCCXqDb9qg=; b=G0tKt9VHR85jtC
	bFuKKHLMTh9ULfWEr35LHRShE66kh8G9GeaeL6Vtkc3FrvvrJf0Ls2M5dxg3ZfX8/f0xCjtU5TTqn
	i5KsnW1tA0m1FuLeXkpNojk6Dy3qPvtvnWK+VKdlxAMh0SfIzmTkmXpco7v6MmYcIOFFcRR62Rv1d
	xRYd4pPeLBDb3bhEVvV5MwfUzDTWADOeqBGGEPdQsswb6svi8zDJRxDKB/bLRHelbbeRTW5pSOZPw
	kqPgOIKcfnhPPH/MlbQH/FTvPdBNC31rWUNWg464Ujfb51BLUGVQLD1Zy3CyFwpG9xbRmNTkbbbpG
	rD6Kg9/HqKhuBBMP8KDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3I2b-0000000BIzx-2h17;
	Thu, 19 Mar 2026 18:24:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3I2V-0000000BIqW-1RjD;
	Thu, 19 Mar 2026 18:24:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=eQ5fcRfRZBqewJhpBVyDo43yFkyuLWkspExiz7UwmeI=; b=kjGjQtrmPlzqX+AW7T4LvKUEk6
	/rd3Sjj4aBMeK4DTAjZXypSbwGKWDZTOUMKxr3xw+5zE68jjmSr+bp4YNSTtgOuoY1kfVAThYqpwm
	JTePeot8SkJRb2XL4Fdzw5BMlemnkOvgV3R30J2fEyWzi0qcIHt9rgUDvQ103WzXLReAc5FIb7jvz
	+9wcDWsJuEWfLQ9x/fdRAuAwTPd9mbj9BD72u1vxlGoevcNOwYZ9E6PuEeFCd1WLQd4evFN8DeE8i
	XYLzknBJbWiq6db8II8lyfl6YtTu9LlqU2emdGzjVrGbdlG6g2ryB+JdJReZQE6kR0UimMJrJmmEh
	Qc6rBKvw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3I2R-0000000EDob-1ygg;
	Thu, 19 Mar 2026 18:24:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D2DE4369B;
	Thu, 19 Mar 2026 18:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAFBEC2BCAF;
	Thu, 19 Mar 2026 18:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773944645;
	bh=zxWNAJj7O8GtoZ6ysYQIGq3mbn9MaN35AkA3dod/SuI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dvwse2TYXUyFSEEHXSYnuuMx/6EtWicIHQiNBtjzi9BMylWZnkZolWGYbY1Dm8dG+
	 iZEMNApPU9MiUIMHpNkl/dbTN6gvv/L5XR7vAeSUfPQbNgGc0qi4PAIw+LoNeFQTY7
	 ETXtpSK7lClP5bOuhcNyWpLEH7mMQSWw+sIGyY0cfgoAewXRRByojGGsFCR26P16+3
	 AsVf61sZnPetqHYg9LmjGvD35RA33pP88xZaLa1mVutFMFphplkO2Ast/BoDGGgJku
	 7pPiqFXnb9yA9xPORUBYg0AaceYQVG4OVbOfd5gvitBw3kYujc0gpf7sK4qwnesfiH
	 BbuNePHI8EsiQ==
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
Subject: [PATCH v3 07/16] misc: open-dice: replace deprecated mmap hook with mmap_prepare
Date: Thu, 19 Mar 2026 18:23:31 +0000
Message-ID: <eca64f8c12ea145c9667ab7059ce16c50d919b44.1773944114.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773944114.git.ljs@kernel.org>
References: <cover.1773944114.git.ljs@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_182408_458650_9CD52A79 
X-CRM114-Status: GOOD (  15.70  )
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

The f_op->mmap interface is deprecated, so update driver to use its
successor, mmap_prepare.

The driver previously used vm_iomap_memory(), so this change replaces it
with its mmap_prepare equivalent, mmap_action_simple_ioremap().

Reviewed-by: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 drivers/misc/open-dice.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/misc/open-dice.c b/drivers/misc/open-dice.c
index 24c29e0f00ef..45060fb4ea27 100644
--- a/drivers/misc/open-dice.c
+++ b/drivers/misc/open-dice.c
@@ -86,29 +86,32 @@ static ssize_t open_dice_write(struct file *filp, const char __user *ptr,
 /*
  * Creates a mapping of the reserved memory region in user address space.
  */
-static int open_dice_mmap(struct file *filp, struct vm_area_struct *vma)
+static int open_dice_mmap_prepare(struct vm_area_desc *desc)
 {
+	struct file *filp = desc->file;
 	struct open_dice_drvdata *drvdata = to_open_dice_drvdata(filp);
 
-	if (vma->vm_flags & VM_MAYSHARE) {
+	if (vma_desc_test(desc, VMA_MAYSHARE_BIT)) {
 		/* Do not allow userspace to modify the underlying data. */
-		if (vma->vm_flags & VM_WRITE)
+		if (vma_desc_test(desc, VMA_WRITE_BIT))
 			return -EPERM;
 		/* Ensure userspace cannot acquire VM_WRITE later. */
-		vm_flags_clear(vma, VM_MAYWRITE);
+		vma_desc_clear_flags(desc, VMA_MAYWRITE_BIT);
 	}
 
 	/* Create write-combine mapping so all clients observe a wipe. */
-	vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
-	vm_flags_set(vma, VM_DONTCOPY | VM_DONTDUMP);
-	return vm_iomap_memory(vma, drvdata->rmem->base, drvdata->rmem->size);
+	desc->page_prot = pgprot_writecombine(desc->page_prot);
+	vma_desc_set_flags(desc, VMA_DONTCOPY_BIT, VMA_DONTDUMP_BIT);
+	mmap_action_simple_ioremap(desc, drvdata->rmem->base,
+				   drvdata->rmem->size);
+	return 0;
 }
 
 static const struct file_operations open_dice_fops = {
 	.owner = THIS_MODULE,
 	.read = open_dice_read,
 	.write = open_dice_write,
-	.mmap = open_dice_mmap,
+	.mmap_prepare = open_dice_mmap_prepare,
 };
 
 static int __init open_dice_probe(struct platform_device *pdev)
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
