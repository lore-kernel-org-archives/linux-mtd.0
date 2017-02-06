Date: Mon, 6 Feb 2017 20:44:10 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: Marek Vasut <marek.vasut@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] mtd: nand: sunxi: Perfs improvements
Message-ID: <20170206204410.316ce645@bbrezillon>
In-Reply-To: <1483695727-17415-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1483695727-17415-1-git-send-email-boris.brezillon@free-electrons.com>
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

On Fri,  6 Jan 2017 10:42:04 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hello,
> 
> These 3 patches aims at improving the sunxi NAND driver perfs and
> avoiding busy waits on long operations to improve system reactivity.

Applied.

> 
> Regards,
> 
> Boris
> 
> Boris Brezillon (3):
>   mtd: nand: sunxi: Fix the non-polling case in sunxi_nfc_wait_events()
>   mtd: nand: sunxi: Stop using polling mode when waiting for long
>     operations
>   mtd: nand: sunxi: Improve sunxi_nfc_cmd_ctrl()
> 
>  drivers/mtd/nand/sunxi_nand.c | 36 ++++++++++++++++++++++++++----------
>  1 file changed, 26 insertions(+), 10 deletions(-)
> 
