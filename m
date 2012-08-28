MIME-Version: 1.0
In-Reply-To: <20120828091139.GC31704@lunn.ch>
References: <20120816183708.GT22226@titan.lakedaemon.net>
 <1346110528-30858-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1346110528-30858-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20120828091139.GC31704@lunn.ch>
Date: Tue, 28 Aug 2012 11:31:37 +0200
Message-ID: <CABJ1b_QgJU_xLL2Z=-r_hs51O+d4W+oLZPPf9-6UmeO5B+chPg@mail.gmail.com>
Subject: Re: [PATCH] mtd: orion_nand: remove <mach/hardware.h> include
From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Lior Amsalem <alior@marvell.com>, Ike Pan <ike.pan@canonical.com>,
 Albert Stone <albert.stone@canonical.com>, Nadav Haklai <nadavh@marvell.com>,
 linux-mtd@lists.infradead.org, Ian Molton <ian.molton@codethink.co.uk>,
 Yehuda Yitschak <yehuday@marvell.com>,
 Jani Monoses <jani.monoses@canonical.com>, Tawfik Bayouk <tawfik@marvell.com>,
 Dan Frazier <dann.frazier@canonical.com>, Eran Ben-Avi <benavi@marvell.com>,
 Li Li <li.li@canonical.com>, Leif Lindholm <leif.lindholm@arm.com>,
 Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>,
 Jon Masters <jcm@redhat.com>, Ben Dooks <ben-linux@fluff.org>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Chris Van Hoof <vanhoof@canonical.com>, Nicolas Pitre <nico@fluxnic.net>,
 Artem Bityutskiy <dedekind1@gmail.com>, Maen Suleiman <maen@marvell.com>,
 Shadi Ammouri <shadi@marvell.com>, Olof Johansson <olof@lixom.net>,
 Eric Miao <eric.miao@canonical.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8/28/12, Andrew Lunn <andrew@lunn.ch> wrote:
> One other driver you might want to look at is:
>
> drivers/watchdog/orion_wdt.c
> It uses <mach/bridge-regs.h>

Andrew, Thomas,

both current watchdog and timer are using the bridge-regs to clear the
interrupt cause. On orion the cause register is located in bridge-regs.
>From the work on timer together with Gregory, I expect Armada 370/XP
to have the watchdog cause bit also within timer registers.

Sebastian
