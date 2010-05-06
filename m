Received: from tyo202.gate.nec.co.jp ([202.32.8.206])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9rwL-0002er-Vj
	for linux-mtd@lists.infradead.org; Thu, 06 May 2010 03:40:00 +0000
Received: from mailgate3.nec.co.jp ([10.7.69.197])
	by tyo202.gate.nec.co.jp (8.13.8/8.13.4) with ESMTP id o463dmEP024162
	for <linux-mtd@lists.infradead.org>;
	Thu, 6 May 2010 12:39:48 +0900 (JST)
Received: (from root@localhost) by mailgate3.nec.co.jp
	(8.11.7/3.7W-MAILGATE-NEC)
	id o463dlP17632 for linux-mtd@lists.infradead.org;
	Thu, 6 May 2010 12:39:47 +0900 (JST)
Received: from relay11.aps.necel.com ([10.29.19.46]) by vgate01.nec.co.jp
	(8.11.7/3.7W-MAILSV-NEC) with ESMTP
	id o463dlu11131 for <linux-mtd@lists.infradead.org>;
	Thu, 6 May 2010 12:39:47 +0900 (JST)
Message-ID: <4BE23A03.1030001@renesas.com>
Date: Thu, 06 May 2010 12:39:47 +0900
From: Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: A few cleanups against Linus' master
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: shinya.kuribayashi.px@renesas.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Noticed and fixed while learning UBI subsystems.  As for comment fixes
a double-check by native speaker would be appricated.

p.s. UBI fixes can be squashed into one at your option, thanks.


Shinya Kuribayashi (3):
       UBI: Fix s/then/than/ typos
       UBI: Remaining typos and comments cleanups
       mtd: Remove empty mtd/mtdbdi.c and mtd/internal.h files

  drivers/mtd/ubi/Kconfig |    2 +-
  drivers/mtd/ubi/io.c    |    4 ++--
  drivers/mtd/ubi/kapi.c  |    6 +++---
  drivers/mtd/ubi/scan.c  |    4 ++--
  drivers/mtd/ubi/vtbl.c  |    4 ++--
  drivers/mtd/ubi/wl.c    |    2 +-
  6 files changed, 11 insertions(+), 11 deletions(-)
  delete mode 100644 drivers/mtd/internal.h
  delete mode 100644 drivers/mtd/mtdbdi.c

-- 
Shinya Kuribayashi
Renesas Electronics
