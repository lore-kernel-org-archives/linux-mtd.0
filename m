Date: Mon, 9 Dec 2013 18:08:56 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx: Disable "armada370-nand" compatible
 support
Message-ID: <20131209210855.GB31944@localhost>
References: <1386430787-2962-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131207232315.GC11251@titan.lakedaemon.net>
 <20131208013525.GA4487@localhost>
 <20131208014049.GJ11251@titan.lakedaemon.net>
 <20131209204607.GV27149@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20131209204607.GV27149@ld-irv-0074.broadcom.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>,
 Emilio =?utf-8?B?TMOzcGV6?= <emilio@elopez.com.ar>,
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

On Mon, Dec 09, 2013 at 12:46:07PM -0800, Brian Norris wrote:
> Hi Ezequiel,
> 
> On Sat, Dec 07, 2013 at 08:40:49PM -0500, Jason Cooper wrote:
> > On Sat, Dec 07, 2013 at 10:35:26PM -0300, Ezequiel Garcia wrote:
> > > If we agree to remove the lines, shall we also revert the binding
> > > documentation, removing the compatible from there as well?
> > 
> > I think this is unnecessary.  We're trying to prevent breaking
> > bisection.  No one in their right mind should be developing (and
> > referring to docs) at a random commit.  As long as the docs are correct,
> > leave them alone.
> 
> I agree, we don't need to drop all the docs, just the lines with the
> 'compatible' property. And #if 0 is a no-go; let's just delete the
> lines.
> 
> Yes, the docs will appear in 3.12 and 3.13 even though the driver
> support won't be there until 3.14, but that's OK IMO.
> 
> Do you think this should go to 3.12.y stable? If so, please add the
> appropriate Cc tag. BTW, you moved these lines around in 3.13 so far,
> so the patch probably won't apply 100% clean.
> 
> Can you refresh this patch according to Jason's comments and resend?
> 

Sure!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
