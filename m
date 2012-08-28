Date: Tue, 28 Aug 2012 14:12:47 -0400
From: Jason Cooper <jason@lakedaemon.net>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH] mtd: orion_nand: remove <mach/hardware.h> include
Message-ID: <20120828181247.GH19437@titan.lakedaemon.net>
References: <20120816183708.GT22226@titan.lakedaemon.net>
 <1346110528-30858-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1346110528-30858-2-git-send-email-thomas.petazzoni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1346110528-30858-2-git-send-email-thomas.petazzoni@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
 Ike Pan <ike.pan@canonical.com>, Albert Stone <albert.stone@canonical.com>,
 Nadav Haklai <nadavh@marvell.com>, linux-mtd@lists.infradead.org,
 Ian Molton <ian.molton@codethink.co.uk>, Yehuda Yitschak <yehuday@marvell.com>,
 Jani Monoses <jani.monoses@canonical.com>, Tawfik Bayouk <tawfik@marvell.com>,
 Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>,
 Li Li <li.li@canonical.com>, Leif Lindholm <leif.lindholm@arm.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Jon Masters <jcm@redhat.com>,
 Ben Dooks <ben-linux@fluff.org>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org, Chris Van Hoof <vanhoof@canonical.com>,
 Nicolas Pitre <nico@fluxnic.net>, Artem Bityutskiy <dedekind1@gmail.com>,
 Maen Suleiman <maen@marvell.com>, Shadi Ammouri <shadi@marvell.com>,
 Olof Johansson <olof@lixom.net>, Eric Miao <eric.miao@canonical.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 28, 2012 at 01:35:28AM +0200, Thomas Petazzoni wrote:
> Commit c085d965fb63ac3b4cc7379d45588c0b39e2bdb0 made the ARCH_MVEBU
> platform select PLAT_ORION, which means that now all Orion drivers can
> be enabled on ARCH_MVEBU. This works fine for most drivers, except for
> orion_nand, because it includes <mach/hardware.h>, but mach-mvebu does
> not have a mach/hardware.h header (it is considered as a deprecated
> practice).
> 
> It turns out that the <mach/hardware.h> include in orion_nand is not
> necessary: the driver builds perfectly fine without it, so we simply
> get rid of it.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: linux-mtd@lists.infradead.org
> Cc: Artem Bityutskiy <dedekind1@gmail.com>

Applied to:

git://git.infradead.org/users/jcooper/linux.git boards-for-v3.7-v2

thx,

Jason.
