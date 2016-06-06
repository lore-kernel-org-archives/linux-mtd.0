Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b9nOu-00009M-Aq
 for linux-mtd@lists.infradead.org; Mon, 06 Jun 2016 05:48:40 +0000
Date: Mon, 6 Jun 2016 07:47:59 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: <devicetree@vger.kernel.org>, Tony Lindgren <tony@atomide.com>,
 <linux-kernel@vger.kernel.org>, Linux mtd <linux-mtd@lists.infradead.org>,
 Benoit Cousson <bcousson@baylibre.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 0/4] mtd: nand: Add support for Evatronix
 NANDFLASH-CTRL
In-Reply-To: <20160602180059.11928d40@bbrezillon>
Message-ID: <alpine.DEB.2.02.1606060742210.23377@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1606020944180.19416@lnxricardw1.se.axis.com>
 <20160602180059.11928d40@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 2 Jun 2016, Boris Brezillon wrote:

> Hi Ricard,
> 
> I was not in Cc of this series, so you're either developing an old
> kernel version, or you didn't check the MAINTAINERS file (or didn't run
> get_maintainer.pl on your series).

The patch is intended to apply to the mtd l2 tree, and I did check 
MAINTAINERS, however, for whatever reason I failed to notice that the NAND 
flash subsystem has its own entry (going for the general MTD entry), so 
both you and Richard got left off the CC list. Sorry about that. I'll 
rectify it on subsequent patch submissions.

> And please, next time make sure patches 1 to X are sent in replies to 
> your cover letter.

Ok. Will do.

> I'll to review the driver soon.

Much appreciated.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
