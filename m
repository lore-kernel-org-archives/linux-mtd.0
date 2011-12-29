Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RgCF3-0004RG-1c
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2011 09:25:42 +0000
From: dedekind1@gmail.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 00/27] introduce wrappers for mtd interfaces
Date: Thu, 29 Dec 2011 11:27:04 +0200
Message-Id: <1325150851-2805-1-git-send-email-dedekind1@gmail.com>
Cc: =?UTF-8?q?J=C3=B6rn=20Engel?= <joern@logfs.org>,
 Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, this is the second version of the MTD API rework patch-set. Please,
refer the first version for the background information:

http://lists.infradead.org/pipermail/linux-mtd/2011-December/038975.html

This version fixes several issues found in the first version:

1. Incorrectly changed logfs '->put_device()' with 'mtd_put_device()'
   Also in few other drivers.
2. Do not introduce 'mtd_{get,put}_device()' functions at all, because
   they are only for drivers and do not belong to MTD API.

I'd like to merge these upstream to 3.3, and the rest of clean-ups
related to the MTD API rework - to 3.4. I think previously I provided
incorrect '3.2 and 3.3' respective numbers.

Artem.
