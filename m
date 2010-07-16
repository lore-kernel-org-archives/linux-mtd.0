Received: from faui40.informatik.uni-erlangen.de ([131.188.34.40])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OZk4F-0005xw-Q0
	for linux-mtd@lists.infradead.org; Fri, 16 Jul 2010 12:31:04 +0000
Date: Fri, 16 Jul 2010 14:28:56 +0200
From: Christian Dietrich <qy03fugy@stud.informatik.uni-erlangen.de>
To: Milton Miller <miltonm@bga.com>, Josh Boyer <jwboyer@linux.vnet.ibm.com>,
	Matt Porter <mporter@kernel.crashing.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>, Solomon Peachy <solomon@linux-wlan.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Mike Frysinger <vapier@gentoo.org>, Jiri Kosina <jkosina@suse.cz>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Alexander Kurz <linux@kbdbabel.org>,
	Russell King <rmk+kernel@arm.linux.org.uk>,
	Ralf Baechle <ralf@linux-mips.org>, Manuel Lauss <manuel.lauss@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Randy Dunlap <randy.dunlap@oracle.com>, John Linn <john.linn@xilinx.com>,
	Florian Fainelli <florian@openwrt.org>,
	Nicolas Pitre <nico@fluxnic.net>, Joe Perches <joe@perches.com>,
	Ladislav Michl <ladis@linux-mips.org>,
	David Brown <davidb@quicinc.com>, linuxppc-dev@ozlabs.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org
Subject: [PATCH 0/2] Removing dead code
Message-ID: <cover.1279282865.git.qy03fugy@stud.informatik.uni-erlangen.de>
References: <4f07b3092cafbbba37d61d367cc7484e24d18d2a.1279116162.git.qy03fugy@stud.informatik.uni-erlangen.de>
	<redwood56-reply-1-miltonm@bga.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <redwood56-reply-1-miltonm@bga.com>
Cc: vamos-dev@i4.informatik.uni-erlangen.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all!

I merged the two patches from Christoph Egger[1] to remove the
REDWOOD_[456] config depends. And wrote a second patch, which removes
the redwood/mtd mapping module. I hope this is now acceptable to bring
it into the kernel, if this options are really dead.       

Regards

        Christian Dietrich

[0] http://vamos1.informatik.uni-erlangen.de/
[1] Message-Id: <adba61f63f4439ac17f2e428429f01ae5e65ab15.1279110895.git.siccegge@cs.fau.de>

Christian Dietrich (2):
  Remove REDWOOD_[456] config options and conditional code
  Removed redwood/mtd mapping

 arch/powerpc/platforms/40x/Kconfig |   16 ----
 drivers/mtd/maps/Kconfig           |    8 --
 drivers/mtd/maps/Makefile          |    1 -
 drivers/mtd/maps/redwood.c         |  174 ------------------------------------
 drivers/net/Kconfig                |    2 +-
 drivers/net/smc91x.h               |   37 --------
 6 files changed, 1 insertions(+), 237 deletions(-)
 delete mode 100644 drivers/mtd/maps/redwood.c
