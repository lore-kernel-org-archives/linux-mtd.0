Date: Wed, 13 Apr 2016 17:27:47 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai
 <wens@csie.org>, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 00/16] mtd: nand: sunxi: various improvements/fixes
Message-ID: <20160413172747.5b4a4502@bbrezillon>
In-Reply-To: <1457367513-26069-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1457367513-26069-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon,  7 Mar 2016 17:18:17 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hi,
> 
> This patchset aims at fixing a few minor bugs, and improving performances
> of NAND accesses going through the sunxi NAND controller.
> 
> Note that patch 5 exports functions provided by the core which are needed
> in patch 6 to still support raw OOB accesses. Other patches are just
> fixes or improvements only touching the sunxi driver itself.
> 
> Here are the main improvements:
> - queue CLE/ALE requests instead of forcing the controller to issue each
>   cmd and address cycle separately
> - benefit from ECC correction on protected OOB bytes
> - use polling instead of interrupt-based waiting (avoid scheduling
>   overhead for short wait period)

I'm applying this series since it only touches the sunxi NAND driver,
and I don't expect to have any external reviews :).

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
