Date: Sat, 7 Dec 2013 20:40:49 -0500
From: Jason Cooper <jason@lakedaemon.net>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx: Disable "armada370-nand" compatible
 support
Message-ID: <20131208014049.GJ11251@titan.lakedaemon.net>
References: <1386430787-2962-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20131207232315.GC11251@titan.lakedaemon.net>
 <20131208013525.GA4487@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131208013525.GA4487@localhost>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
 Lior Amsalem <alior@marvell.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Dec 07, 2013 at 10:35:26PM -0300, Ezequiel Garcia wrote:
> If we agree to remove the lines, shall we also revert the binding
> documentation, removing the compatible from there as well?

I think this is unnecessary.  We're trying to prevent breaking
bisection.  No one in their right mind should be developing (and
referring to docs) at a random commit.  As long as the docs are correct,
leave them alone.

thx,

Jason.
