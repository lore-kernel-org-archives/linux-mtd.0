Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gArpp-0005Z0-AE
 for linux-mtd@lists.infradead.org; Fri, 12 Oct 2018 07:26:11 +0000
Date: Fri, 12 Oct 2018 09:25:55 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, David
 Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, Arnd
 Bergmann <arnd@arndb.de>, Miquel Raynal <miquel.raynal@bootlin.com>, Marek
 Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] mtd: Fix for 4.19-rc8
Message-ID: <20181012092555.7e92d996@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Greg,

Here is a PR containing a fix for a bug introduced in 4.19-rc1.

Regards,

Boris

The following changes since commit 0238df646e6224016a45505d2c111a24669ebe21:

  Linux 4.19-rc7 (2018-10-07 17:26:02 +0200)

are available in the git repository at:

  git://git.infradead.org/linux-mtd.git tags/mtd/fixes-for-4.19-rc8

for you to fetch changes up to f0fe77f601c3d6a821198f88f7adb0a05b8fe03e:

  lib/bch: fix possible stack overrun (2018-10-12 09:17:46 +0200)

----------------------------------------------------------------
* Fix a stack overflow in lib/bch.c

----------------------------------------------------------------
Arnd Bergmann (1):
      lib/bch: fix possible stack overrun

 lib/Makefile |  1 -
 lib/bch.c    | 17 +++++++++++++----
 2 files changed, 13 insertions(+), 5 deletions(-)


-- 
Boris Brezillon, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
