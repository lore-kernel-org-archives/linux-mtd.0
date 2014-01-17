Received: from forward3m.mail.yandex.net ([2a02:6b8:0:2519::3:12])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W45uS-00046X-Kg
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2014 09:40:18 +0000
Received: from web25m.yandex.ru (web25m.yandex.ru [37.140.138.116])
 by forward3m.mail.yandex.net (Yandex) with ESMTP id F10C26B60774
 for <linux-mtd@lists.infradead.org>; Fri, 17 Jan 2014 13:39:45 +0400 (MSK)
From: Konstantin Tokarev <annulen@yandex.ru>
To: linux-mtd@lists.infradead.org
Subject: Find & remove orphan LEBs from UBIFS partition
MIME-Version: 1.0
Message-Id: <123921389951584@web25m.yandex.ru>
Date: Fri, 17 Jan 2014 13:39:44 +0400
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

How can I find and remove LEBs which don't correspond to known files
using internal API of UBIFS?

AFAIU, somethinng like this is done on recovery during mount, but in
my case superblock is not dirty, so I'd like to force cleanup with
custom mount option.

-- 
Regards,
Konstantin
