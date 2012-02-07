Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RuYp9-0002Ec-FW
 for linux-mtd@lists.infradead.org; Tue, 07 Feb 2012 00:22:20 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] um: Serve io_remap_pfn_range()
Date: Tue,  7 Feb 2012 01:22:47 +0100
Message-Id: <1328574170-2286-2-git-send-email-richard@nod.at>
In-Reply-To: <1328574170-2286-1-git-send-email-richard@nod.at>
References: <1328574170-2286-1-git-send-email-richard@nod.at>
Cc: Artem.Bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 viro@zeniv.linux.org.uk, user-mode-linux-devel@lists.sourceforge.net,
 Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

At some places io_remap_pfn_range() is needed.
UML has to serve it like all other archs do.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 arch/um/include/asm/pgtable.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/um/include/asm/pgtable.h b/arch/um/include/asm/pgtable.h
index 41474fb..6a3f984 100644
--- a/arch/um/include/asm/pgtable.h
+++ b/arch/um/include/asm/pgtable.h
@@ -69,6 +69,8 @@ extern unsigned long end_iomem;
 #define PAGE_KERNEL	__pgprot(_PAGE_PRESENT | _PAGE_RW | _PAGE_DIRTY | _PAGE_ACCESSED)
 #define PAGE_KERNEL_EXEC	__pgprot(__PAGE_KERNEL_EXEC)
 
+#define io_remap_pfn_range	remap_pfn_range
+
 /*
  * The i386 can't do page protection for execute, and considers that the same
  * are read.
-- 
1.7.6
