Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWXfM-00042H-IP
 for linux-mtd@lists.infradead.org; Mon, 31 Aug 2015 22:35:05 +0000
Received: by pabzx8 with SMTP id zx8so152929008pab.1
 for <linux-mtd@lists.infradead.org>; Mon, 31 Aug 2015 15:34:43 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH mtd-utils 00/11] flash_{un,}lock upgrades
Date: Mon, 31 Aug 2015 15:34:21 -0700
Message-Id: <1441060472-82169-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've done a bit of work to make the flash_lock tool more useful, in order to
help test some new SPI NOR block protection features. Of note:

 * added getopt support
 * further unified flash_unlock and flash_lock -- the only difference now is
   their default feature, and both binaries contain support for all features
 * add support for MEMISLOCKED, so we can query arbitrary regions for
   protection status
 * mtdinfo -M already can dump some block lock information, but you get a
   little more flexibility using flash_lock --info, so both seem worth having
   IMO

Unsolved issues:

 * the MEM{LOCK,UNLOCK,ISLOCKED} ioctls all still use the out-dated 32-bit
   erase_info_user struct, which means they'll have problems supporting >=4GB
   flash. This isn't a mtd-utils problem, per se, and at the moment, Linux NAND
   (the only (?) candidate for >=4GB flash) support doesn't implement any of
   the locking APIs. But just an observation I ran across.
 * Deprecation plan: it would make sense to deprecate and remove flash_unlock
   eventually (in favor of 'flash_lock --unlock'), but this isn't really
   pressing, so I don't see a good reason to spend much effort on it.

Enjoy,
Brian

Brian Norris (11):
  flash_{un,}lock: nest optional parameters in help message
  flash_{un,}lock: switch to getopt library
  flash_{un,}lock: support --version flag
  flash_{un,}lock: document option flags
  flash_{un,}lock: abstract the argument positions
  flash_{un,}lock: move args processing to its own function
  flash_{un,}lock: support both lock/unlock in the same binary
  flash_{un,}lock: add MEMISLOCKED support
  flash_{un,}lock: improve strtol() error handling
  flash_{un,}lock: don't allow "last byte + 1"
  flash_{un,}lock: document block count == -1

 flash_unlock.c | 182 ++++++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 156 insertions(+), 26 deletions(-)

-- 
2.5.0.457.gab17608
