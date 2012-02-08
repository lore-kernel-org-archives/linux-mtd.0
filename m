Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rv9Ko-0003os-V1
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2012 15:21:27 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/9] mtd: MTD API rework
Date: Wed,  8 Feb 2012 17:21:16 +0200
Message-Id: <1328714485-19536-1-git-send-email-dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Hi,

here are the latest MTD API rework patches. I have plans to also harmonize the
OOB-related functions, try to harmonize alignment checking in erase and write
functions as well. Not sure I'll have time for this, though, will see.

Please, do test the changes if you use MTD - it is easy to break something when
you are trying to clean-up ancient crap.

Artem.
