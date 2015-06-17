Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z5GLH-0006xL-5o
 for linux-mtd@lists.infradead.org; Wed, 17 Jun 2015 16:37:36 +0000
From: Kamil Debski <kamil.debski@imgtec.com>
To: <linux-mtd@lists.infradead.org>
Subject: [RFC 0/2] Common NAND Bad Block Management
Date: Wed, 17 Jun 2015 17:40:33 +0100
Message-ID: <1434559235-3617-1-git-send-email-kamil.debski@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Ionela.Voinescu@imgtec.com, Kamil Debski <kamil.debski@imgtec.com>,
 kyungmin.park@samsung.com, ezequiel@vanguardiasur.com.ar,
 computersforpeace@gmail.com, James.Hartley@imgtec.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Here is my first approach on the subject of the bad block management of
NAND memory devices. I marked is it as an RFC as I am interested in your
comments and I want to know whether I am going in the right direction.

I have initially described the problem in my previous email to the mailing
list [1]. I think that it is also worth to describe it in this email.

Basically the reason for this patchset is the following - we want to introduce
a driver for a NAND chip with an SPI interface. To do that it is necessary to
introduce a new type of an MTD device - the spi-nand device.

One of previous attempt at this was done by Ezequiel Garcia [2]. His spi-nand
core used the nand core to do (among others) the bad block management. Thus
the stack looked like this:

| Userspace     |
| MTD core      |
| NAND core     |
| SPI NAND core |
| SPI driver    |
| NAND chip     |

After some discussion it was decided that linking the MTD core and SPI NAND
core directly is better. Peter Pan from Micron published a version that followed
this design principle [3]. The stack is presented below:

| Userspace     |
| MTD core      |
| SPI NAND core |
| SPI driver    |
| NAND chip     |

The problem with Peter Pan's patchset was that it included quite an amount of
code duplicated from the NAND core. This included the bad block handling part
that was devised from nand_bbt.c file of the NAND core. The patchset brought
about further discussion. The conclusion was that bad block handling should be
separated from the NAND core,such that it could be used in both NAND core and
SPI NAND core [4].

Since then, there wasn't much activity in this topic. I was asked to help with
upstreaming of the SPI NAND core and SPI NAND drivers. This resulted in my
previous email [1].

What I noticed is that the bad block handling is also done in OneNAND core. Thus
I had the idea that bad block management could be shared by NAND, SPI NAND and
OneNAND core. OneNAND introduced a bbm_info struct that is supposed to hold
information needed for bad block handling. My idea was to use this struct in
the common BBM code.

All of the above resulted in this RFC. I am happy to hear your comments :)

Best wishes,
Kamil Debski

[1] http://lists.infradead.org/pipermail/linux-mtd/2015-June/059776.html
[2] http://lists.infradead.org/pipermail/linux-mtd/2014-December/056763.html
[3] http://lists.infradead.org/pipermail/linux-mtd/2015-January/057223.html
[4] http://lists.infradead.org/pipermail/linux-mtd/2015-January/057639.html

Kamil Debski (2):
  mtd: nand: Separate bad block management from the nand core
  mtd: nand: onenand: Switch OneNAND core to use the common BBM code

 drivers/mtd/nand/nand_base.c       |  203 ++++++++++++++++-----
 drivers/mtd/nand/nand_bbt.c        |  353 ++++++++++++++----------------------
 drivers/mtd/onenand/onenand_base.c |   71 +++++++-
 drivers/mtd/onenand/onenand_bbt.c  |  201 +-------------------
 include/linux/mtd/bbm.h            |   46 ++++-
 include/linux/mtd/mtd.h            |    4 +
 include/linux/mtd/nand.h           |    9 -
 include/linux/mtd/onenand.h        |    2 -
 8 files changed, 411 insertions(+), 478 deletions(-)

-- 
1.7.9.5
