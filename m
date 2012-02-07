Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RuYp9-0002Er-Cp
 for linux-mtd@lists.infradead.org; Tue, 07 Feb 2012 00:22:20 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] um: Wire CONFIG_GENERIC_IO up
Date: Tue,  7 Feb 2012 01:22:49 +0100
Message-Id: <1328574170-2286-4-git-send-email-richard@nod.at>
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

UML has no io memory but implements everything defined in
generic-asm/io.h.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 arch/um/Kconfig.common |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/um/Kconfig.common b/arch/um/Kconfig.common
index b37ae70..20a49ba 100644
--- a/arch/um/Kconfig.common
+++ b/arch/um/Kconfig.common
@@ -9,6 +9,7 @@ config UML
 	select HAVE_GENERIC_HARDIRQS
 	select GENERIC_IRQ_SHOW
 	select GENERIC_CPU_DEVICES
+	select GENERIC_IO
 
 config MMU
 	bool
-- 
1.7.6
