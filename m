Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rhgqh-0003Q1-FJ
 for linux-mtd@lists.infradead.org; Mon, 02 Jan 2012 12:18:44 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 00/17] mtd: get rid of direct mtd->func use
Date: Mon,  2 Jan 2012 14:20:30 +0200
Message-Id: <1325506847-23470-1-git-send-email-dedekind1@gmail.com>
Cc: linux-fsdevel@vger.kernel.org,
 =?UTF-8?q?J=C3=B6rn=20Engel?= <joern@logfs.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

this patch-set goes on top of the "MTD API rework" patches which I sent
recently:

http://lists.infradead.org/pipermail/linux-mtd/2011-December/039031.html

This patch-set further removes direct mtd function pointers accesses like:

if (mtd->block_isbad)
	blah

This is a part of the big MTD API re-work we have started. The next steps will
be:

1. Rename all the function pointers to make sure we catch all direct uses:
   (s/mtd->func/mtd->_func/g)
2. Move common input parameters check from implementations to the wrapper
   function to get rid of duplication.

Artem.
