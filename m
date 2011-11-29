Received: from mail.microcatalog.org.uk ([217.6.246.34] helo=root.phytec.de)
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RVI9G-00042o-Qk
 for linux-mtd@lists.infradead.org; Tue, 29 Nov 2011 07:30:40 +0000
In-Reply-To: <1322503912-8221-1-git-send-email-computersforpeace@gmail.com>
References: <CAN8TOE-rh_yh_0hi+unXe3Q5zV9tdBW6rhomRG-h3za5A4ROrg@mail.gmail.com>
 <1322503912-8221-1-git-send-email-computersforpeace@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
Subject: Antwort: [PATCH] nandtest: seed random generator properly
Message-ID: <OF4FD25221.65A13349-ONC1257957.002904C2-C1257957.00293DF7@phytec.de>
From: Jan Weitzel <J.Weitzel@phytec.de>
Date: Tue, 29 Nov 2011 08:30:28 +0100
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian Norris <computersforpeace@gmail.com> schrieb am 28.11.2011 19:11:52:

> Von: Brian Norris <computersforpeace@gmail.com>
> An: <linux-mtd@lists.infradead.org>
> Kopie: Brian Norris <computersforpeace@gmail.com>, Artem Bityutskiy 
> <dedekind1@gmail.com>, Jan Weitzel <j.weitzel@phytec.de>
> Datum: 28.11.2011 19:13
> Betreff: [PATCH] nandtest: seed random generator properly
> 
> This patch fixes two problems in nandtest:
> 
> (1) if a seed is provided it is actually not used. First call is
>     "seed = rand()" killing the given seed.
>     Credit: Jan Weitzel <j.weitzel@phytec.de>
> 
> (2) if a seed is not provided, we use the default rand() values, which
>     produces the same sequence of values every run. It makes more sense
>     to seed with the time to produce more random sequences.
> 
> Cc: Jan Weitzel <j.weitzel@phytec.de>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> Jan: This is an amendment to your patch. Feel free to add a
> "Signed-off-by" if this works for you.
> 
>  nandtest.c |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/nandtest.c b/nandtest.c
> index dc28d09..8cdc816 100644
> --- a/nandtest.c
> +++ b/nandtest.c
> @@ -35,7 +35,7 @@ struct mtd_info_user meminfo;
>  struct mtd_ecc_stats oldstats, newstats;
>  int fd;
>  int markbad=0;
> -int seed;
> +int seed = -1;
> 
>  int erase_and_write(loff_t ofs, unsigned char *data, unsigned char 
*rbuf)
>  {
> @@ -192,6 +192,10 @@ int main(int argc, char **argv)
>     if (argc - optind != 1)
>        usage();
> 
> +   if (seed < 0)
> +      seed = time(NULL);
> +   srand(seed);
> +

So you loose all negative seeds. What is about

int seed = time(NULL);
...
case 's'
        seed = atol(optarg);
...
}
srand(seed);

Jan



>     fd = open(argv[optind], O_RDWR);
>     if (fd < 0) {
>        perror("open");
> -- 
> 1.7.5.4
> 
