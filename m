Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMK90-0007Cf-Va
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 18:07:27 +0000
Received: by padck2 with SMTP id ck2so95384812pad.0
 for <linux-mtd@lists.infradead.org>; Mon, 03 Aug 2015 11:07:05 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: MTD Mailing List <linux-mtd@lists.infradead.org>
Cc: Peter Korsgaard <jacmet@sunsite.dk>, Josh Boyer <jwboyer@gmail.com>,
 Riku Voipio <riku.voipio@linaro.org>
Subject: [ANNOUNCE] mtd-utils-1.5.2 is released
Date: Mon,  3 Aug 2015 11:06:53 -0700
Message-Id: <1438625213-136957-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

mtd-utils-1.5.2 is released.

Tarball:               ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-1.5.2.tar.bz2
Tarball gpg signature: ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-1.5.2.tar.bz2.asc
Signed git tag:        git://git.infradead.org/mtd-utils.git v1.5.2

FYI, this is my first release. Let me know if you see any problems.

(Note: git://git.infradead.org/ is temporarily down. ssh, http, and ftp are
still up.)

Major features:
 * fix build with GCC 5.1
 * add 'mtdpart' utility
 * add 'nandtest --reads' option
 * it's been over a year, so why not?

Enjoy,
Brian
