From: Russ.Dill@asu.edu (Russ Dill)
Date: 03 Mar 2003 18:51:28 -0700
Subject: AMD - Am29LV160B
In-Reply-To: <1046720379.1638.5.camel@gobbles>
References: <04C8EDC5AE3FD611ABE40002B39CF69B07F2D9@ntah901e.savan.com>
 <1046720379.1638.5.camel@gobbles>
Message-ID: <1046742660.3368.1.camel@gobbles>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Mon, 2003-03-03 at 12:39, Russ Dill wrote:
> On Mon, 2003-03-03 at 07:08, Amit.Lubovsky at infineon.com wrote:
> > Hi,
> > 
> > Has anyone used the mtd device with the AMD
> > Am29LV160B chips? They are 16 Megabit (2M x 8-Bit/1M x 16-Bit) chips
> > and are CFI-compatible.
> > 
> > I work with kernel 2.4.6 and am trying to detect 4MB,
> > 2 x16 bit devices in parallel (32 bit access) at address 0,
> 
> they work great on my device (as well as the Am29LV800B, which are not
> CFI)
> 
> > #define BUSWIDTH 2
> 
> I'm away from my code right now, but shouldn't this be 32?

replying to myself here, the correct buswidth for 2 x16 devices in
parallel is 4
