Date: Wed, 18 Dec 2013 18:46:25 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] Partially revert "mtd: nand: pxa3xx: Introduce
 'marvell,armada370-nand' compatible string"
Message-ID: <20131218214624.GA14465@localhost>
References: <1386624986-404-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131212230715.GX27149@ld-irv-0074.broadcom.com>
 <20131218004245.GB10369@localhost>
 <20131218071258.GA5551@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131218071258.GA5551@norris-Latitude-E6410>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
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

On Tue, Dec 17, 2013 at 11:12:58PM -0800, Brian Norris wrote:
> Hi Ezequiel,
> 
> On Tue, Dec 17, 2013 at 09:42:45PM -0300, Ezequiel Garcia wrote:
> > Just to have some context, this compatible was removed because it was
> > wrongly added and it doesn't belong at v3.12 and v3.13.
> > 
> > Now the revert is in place in v3.13-rc4 and it should be queued for
> > v3.12.x, so we are good. Thanks for taking care of it!
> > 
> > On the other side, all the work needed for the driver to work OK on
> > Armada 370/XP SoC is already in l2-mtd.git master, and I have some fixes
> > ready to support 2048B pages.
> > 
> > In conclusion, I think it's safe to add the compatible on top of such work,
> > and queue it for v3.14.
> 
> Let's get any last patches in, and add the compatible string last.
> Please resend any remaining patches, since I think you have at least one
> which you mislabeled as necessary for 3.13.
> 

OK, I've just submitted the patches for 3.14. FWIW, I don't have any other
pending stuff for this driver, except the re-adding the compatible.

Thanks,
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
