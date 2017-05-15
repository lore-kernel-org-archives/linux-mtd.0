Date: Mon, 15 May 2017 21:36:13 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger
 <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Viresh Kumar
 <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Linus Walleij
 <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/3] mtd: nand: fsmc: support SDR timing configuration
Message-ID: <20170515213613.47bfa595@bbrezillon>
In-Reply-To: <1493455956-18362-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1493455956-18362-1-git-send-email-thomas.petazzoni@free-electrons.com>
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

On Sat, 29 Apr 2017 10:52:33 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> This patch series add support for configuring the FSMC NAND controller
> timings according to the SDR timings exposed by the NAND chip.
> 
> Changes since v1:
> 
>  - Dropped all patches from the series that have already been merged
>    in nand/next.
> 
>  - Rework the implementation as suggested by Boris Brezillon, i.e by
>    implementing ->setup_data_interface() only when we are going to use
>    the NAND SDR timings. If there is a "timings" DT property, we keep
>    using the old strategy without ->setup_data_interface().
> 
> The patch series is based on the nand/next branch.

Applied to nand/next.

Thanks,

Boris

> 
> Best regards,
> 
> Thomas
> 
> Thomas Petazzoni (3):
>   mtd: nand: fsmc: reduce number of arguments of fsmc_nand_setup()
>   mtd: nand: fsmc: add support for SDR timings
>   mtd: nand: fsmc: remove default timings
> 
>  drivers/mtd/nand/fsmc_nand.c | 120 +++++++++++++++++++++++++++++++++----------
>  1 file changed, 94 insertions(+), 26 deletions(-)
> 
