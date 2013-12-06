Date: Fri, 6 Dec 2013 19:12:18 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Jason Cooper <jason@lakedaemon.net>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: Merge order in Armada 370/XP (mvebu) NAND support
Message-ID: <20131206221217.GC2458@localhost>
References: <20131206184544.GA14986@localhost>
 <20131206192540.GU29282@titan.lakedaemon.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131206192540.GU29282@titan.lakedaemon.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Andrew Lunn <andrew@lunn.ch>, Olof Johansson <olof@lixom.net>,
 Lior Amsalem <alior@marvell.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 06, 2013 at 02:25:40PM -0500, Jason Cooper wrote:
> On Fri, Dec 06, 2013 at 03:45:45PM -0300, Ezequiel Garcia wrote:
> > Jason/Brian: What do you think we can do?
> 
> Revert the change adding the compatible string in the first place?
> 

Yes, that probably is the best thing to do.

Brian: what do you think? I can send you a revert of the
"armada370-nand" compatible addition to be pushed for v3.13-rc4?

The compatible can be added on top of l2-mtd.git, after all
the needed support is in the driver.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
