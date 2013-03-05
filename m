Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCriv-0006vW-7N
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 13:16:06 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 00/11] mtd: removals and simplifications
Date: Tue,  5 Mar 2013 15:17:13 +0200
Message-Id: <1362489444-27762-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is the second version of the patch-set. This time I removed the full ID
support provisioning part and decided to keep it separate, so this patch-set is
basically about misc. clean-ups, code simplifications and removals of old and
unused cruft.

The museum ID patch changed - it now removes only 256-byte NAND pages support.

Brian, I've addressed your review comments. I did not put your Acked-by to all
of the patches, only to the one you explicitly Acked. But I can add it to all
of the patches if you let me know.

Thanks,
Artem.
