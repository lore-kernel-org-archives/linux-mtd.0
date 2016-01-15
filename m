Date: Fri, 15 Jan 2016 10:03:29 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Wan ZongShun <mcuos.com@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nuc900_nand: read correct SMISR register
Message-ID: <20160115180329.GU109450@google.com>
References: <9019174.GYajdpGP8V@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9019174.GYajdpGP8V@wuerfel>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 13, 2016 at 10:38:08PM +0100, Arnd Bergmann wrote:
> The nuc900_nand driver has always passed an incorrect register
> address in its nuc900_check_rb() function, which cannot possibly
> work, and in some configurations gives us a build warning:
> 
> drivers/mtd/nand/nuc900_nand.c: In function 'nuc900_check_rb':
> drivers/mtd/nand/nuc900_nand.c:27:23: warning: passing argument 1 of '__raw_readl' makes pointer from integer without a cast [-Wint-conversion]
>  #define REG_SMISR     0xac
> drivers/mtd/nand/nuc900_nand.c:118:20: note: in expansion of macro 'REG_SMISR'
>   val = __raw_readl(REG_SMISR);
> 
> This makes sure we actually read from the register rather than
> from (void *)0x000000ac in user space.
> 
> I suspect nobody noticed this before because the nuc900_nand_devready()
> function never gets called, or nobody uses this driver on an upstream
> kernel. Possibly even both.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Pushed to l2-mtd.git. Thanks.
