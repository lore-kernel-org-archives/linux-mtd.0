Date: Mon, 14 Dec 2015 10:31:12 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Roger Quadros <rogerq@ti.com>, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] mtd: omap_elm: print interrupt resource using %pr
Message-ID: <20151214183112.GB10460@google.com>
References: <2101351.RbJOfbsbGX@wuerfel> <20151212011056.GA144873@google.com>
 <1472979.NmboBT3Vms@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1472979.NmboBT3Vms@wuerfel>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Dec 12, 2015 at 03:41:31PM +0100, Arnd Bergmann wrote:
> On Friday 11 December 2015 17:10:56 Brian Norris wrote:
> > drivers/mtd/nand/omap_elm.c:417 elm_probe() error: '%pr' expects argument of type struct resource *, but argument 3 has type 'struct resource**' [smatch]
> 
> Ah, good catch. Do you want to fix it up yourself, or should I send a new version?

Can you send a new one?
