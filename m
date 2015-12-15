From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>, arm@kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org, Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] MTD/NAND cleanups for v4.5
Date: Tue, 15 Dec 2015 17:41:46 +0100
Message-ID: <5642518.pVxm48RVvl@wuerfel>
In-Reply-To: <20151208031306.GP120110@google.com>
References: <20151208031306.GP120110@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 07 December 2015 19:13:06 Brian Norris wrote:
> Two changes for NAND/MTD refactoring. The mtd_to_nand() helper will allow us to
> stop using mtd->priv for NAND drivers.
> 
> 

I've put this into the next/cleanup branch in arm-soc as well now,
so we can see when we get conflicts, and work around them locally.

Thanks,

	Arnd
