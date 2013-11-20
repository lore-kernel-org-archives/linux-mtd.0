Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vj6lj-0005N5-3x
 for linux-mtd@lists.infradead.org; Wed, 20 Nov 2013 12:20:32 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/2] Regarding NAND core and drivers maintenance
Date: Wed, 20 Nov 2013 09:20:07 -0300
Message-Id: <1384950009-13767-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

As it's obvious from the mailing list activity, in the past months Brian
Norris took the NAND maintainership role. In my opinion, he's been doing
a terrific work and as a result the reviewing cycle is now considerably
shorter.

Great work, Brian!

This position is not at all easy, due to each NAND driver being filled
with hardware controller specificities. For that reason, I think it
would be healthy to take another step in setting maintainership
responsabilites.

My proposal (copy-pasted from the media subsystem) is to define
sub-maintainers, one for each NAND driver, in addition to the top-level
NAND subsystem maintainer.

When a patch comes for a given driver, the _ideal_ situation would be
for the sub-maintainer to Ack-it first.

And to formalize this proposal, I'm pushing a couple patches: the first
adds Brian to MAINTAINERS, as the NAND maintainer.

Then, I'm adding myself as sub-maintainer to the pxa3xx-nand driver.
This way, scripts/get_maintainers.pl will show my mail and I'll get
CCed by occasional or new contributors.

How does this sound?

Ezequiel Garcia (2):
  mtd: Add NAND device drivers to MAINTAINERS
  mtd: Add PXA3xx NAND driver to MAINTAINERS

 MAINTAINERS | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

-- 
1.8.1.5
