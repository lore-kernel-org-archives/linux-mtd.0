Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1elLvo-0003yX-UO
 for linux-mtd@lists.infradead.org; Mon, 12 Feb 2018 21:46:40 +0000
From: Richard Weinberger <richard@nod.at>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 Joern Engel <joern@lazybastard.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Solarflare linux maintainers <linux-net-drivers@solarflare.com>,
 Edward Cree <ecree@solarflare.com>, Bert Kenward <bkenward@solarflare.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org, devel@driverdev.osuosl.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/5] mtd: Get rid of unused fields in struct erase_info
Date: Mon, 12 Feb 2018 22:47:37 +0100
Message-ID: <1968152.T5cfZSldxv@blindfold>
In-Reply-To: <20180212210311.23244-3-boris.brezillon@bootlin.com>
References: <20180212210311.23244-1-boris.brezillon@bootlin.com>
 <20180212210311.23244-3-boris.brezillon@bootlin.com>
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

Am Montag, 12. Februar 2018, 22:03:08 CET schrieb Boris Brezillon:
> Some fields are not used by MTD drivers, users or core code. Moreover,
> those fields are not documented, so get rid of them to avoid any
> confusion.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  include/linux/mtd/mtd.h | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 205ededccc60..2a407dc9beaa 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -48,14 +48,9 @@ struct erase_info {
>  	uint64_t addr;
>  	uint64_t len;
>  	uint64_t fail_addr;
> -	u_long time;
> -	u_long retries;
> -	unsigned dev;
> -	unsigned cell;
>  	void (*callback) (struct erase_info *self);
>  	u_long priv;
>  	u_char state;
> -	struct erase_info *next;
>  };
> 
>  struct mtd_erase_region_info {

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
