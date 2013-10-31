Received: from forward11.mail.yandex.net ([2a02:6b8:0:801::1])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbscP-0000Um-MS
 for linux-mtd@lists.infradead.org; Thu, 31 Oct 2013 13:49:03 +0000
Received: from web24j.yandex.ru (web24j.yandex.ru [5.45.198.65])
 by forward11.mail.yandex.net (Yandex) with ESMTP id 3B273E8070C
 for <linux-mtd@lists.infradead.org>; Thu, 31 Oct 2013 17:48:35 +0400 (MSK)
From: Konstantin Tokarev <annulen@yandex.ru>
To: linux-mtd@lists.infradead.org
Subject: Flashing UBIFS image to gluebi mtd
MIME-Version: 1.0
Message-Id: <72811383227314@web24j.yandex.ru>
Date: Thu, 31 Oct 2013 17:48:34 +0400
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

I'm migrating rootfs of device from SquashFS on top of gluebi to UBIFS. However, old version of
firmware upgrade program writes UBIFS image to gluebi mtd device instead of using recommended
volume update procedure. While it works for SquashFS images, writing UBIFS image leads to
the next errors messages in random moments:

UBI error: ubi_io_read: error -77 while reading 76 bytes from PEB 769:26000, read 0 bytes
UBIFS error (pid 383): ubifs_read_node: cannot read node 2 from LEB 347:21904, error -5
UBIFS warning (pid 383): ubifs_ro_mode: switched to read-only mode, error -5

However, when device is rebooted first time after upgrade, UBIFS mounts successfully.

Do you have any idea what is going on and how to destinguish "broken" UBIFS volume from
correctly flashed via ubi volume device?

-- 
Regards,
Konstantin
