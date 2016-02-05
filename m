Date: Fri, 5 Feb 2016 08:35:18 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Kukjin
 Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Josh Wu
 <josh.wu@atmel.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai
 <wens@csie.org>, linux-sunxi@googlegroups.com, Stefan Agner
 <stefan@agner.ch>, Kyungmin Park <kyungmin.park@samsung.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org,
 linux-kernel@vger.kernel.org, punnaiah choudary kalluri
 <punnaia@xilinx.com>, Priit Laes <plaes@plaes.org>
Subject: Re: [PATCH v2 05/51] mtd: add mtd_ooblayout_xxx() helper functions
Message-ID: <20160205083518.7b54e9a7@bbrezillon>
In-Reply-To: <1454580434-32078-6-git-send-email-boris.brezillon@free-electrons.com>
References: <1454580434-32078-1-git-send-email-boris.brezillon@free-electrons.com>
 <1454580434-32078-6-git-send-email-boris.brezillon@free-electrons.com>
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

On Thu,  4 Feb 2016 11:06:28 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> In order to make the ecclayout definition completely dynamic we need to
> rework the way the OOB layout are defined and iterated.
> 
> Create a few mtd_ooblayout_xxx() helpers to ease OOB bytes manipulation
> and hide ecclayout internals to their users.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/mtdcore.c   | 401 ++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/mtd.h |  33 ++++
>  2 files changed, 434 insertions(+)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 3096251..14e46ca 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c

[...]

> +
> +/**
> + * mtd_ooblayout_count_bytes - count the number of bytes in a OOB category
> + * @mtd: mtd info structure
> + * @iter: category iterator
> + *
> + * Count the number of bytes in a given category.
> + *
> + * Returns a positive value on success, a negative error code otherwise.
> + */
> +static int mtd_ooblayout_count_bytes(struct mtd_info *mtd,
> +				int (*iter)(struct mtd_info *,
> +					    int section,
> +					    struct mtd_oob_region *oobregion))
> +{
> +	struct mtd_oob_region oobregion = { };
> +	int section = 0, ret, nbytes = 0;
> +
> +	while (1) {
> +		ret = iter(mtd, section, &oobregion);

				^ section++

Oops, will fix that in next version.

> +		if (ret) {
> +			if (ret == -ERANGE)
> +				ret = nbytes;
> +			break;
> +		}
> +
> +		nbytes += oobregion.length;
> +	}
> +
> +	return ret;
> +}


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
