Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1exfmg-00077y-3Y
 for linux-mtd@lists.infradead.org; Sun, 18 Mar 2018 21:24:11 +0000
Date: Sun, 18 Mar 2018 22:23:44 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 richard@nod.at, linux-mtd@lists.infradead.org
Subject: Re: [PATCH mtd-utils] mtd: tests: check erase block count in page test
Message-ID: <20180318222344.2739ebdd@bbrezillon>
In-Reply-To: <20180303223946.18636-1-stefan@agner.ch>
References: <20180303223946.18636-1-stefan@agner.ch>
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

On Sat,  3 Mar 2018 23:39:46 +0100
Stefan Agner <stefan@agner.ch> wrote:

> When there is only a single erase block, the cross erase test
> does not report sensible errors. Warn in case there is only
> a single erase block instead of executing the test.

Applied.

Thanks,

Boris

> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  tests/mtd-tests/nandpagetest.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/mtd-tests/nandpagetest.c b/tests/mtd-tests/nandpagetest.c
> index c6812df..115cedb 100644
> --- a/tests/mtd-tests/nandpagetest.c
> +++ b/tests/mtd-tests/nandpagetest.c
> @@ -551,8 +551,12 @@ int main(int argc, char **argv)
>  	}
>  	printf("verified %u eraseblocks\n", i);
>  
> -	if (crosstest())
> -		goto out;
> +	if (ebcnt > 1) {
> +		if (crosstest())
> +			goto out;
> +	} else {
> +		printf("skipping erasecrosstest, 2 erase blocks needed\n");
> +	}
>  
>  	if (erasecrosstest())
>  		goto out;



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
