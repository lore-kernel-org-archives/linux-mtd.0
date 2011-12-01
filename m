Received: from mail.visioncatalog.de ([217.6.246.34] helo=root.phytec.de)
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RW1v6-0003ZV-3g
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2011 08:23:05 +0000
Subject: Re: [PATCH] nandtest: seed random generator properly
From: Jan Weitzel <J.Weitzel@phytec.de>
To: Brian Norris <computersforpeace@gmail.com>
In-Reply-To: <CAN8TOE-zTCY-SRrVpsFExu32yq_3j7FJGgVUBN3CEt_E_qzS8Q@mail.gmail.com>
References: <CAN8TOE-rh_yh_0hi+unXe3Q5zV9tdBW6rhomRG-h3za5A4ROrg@mail.gmail.com>
 <1322503912-8221-1-git-send-email-computersforpeace@gmail.com>
 <OF4FD25221.65A13349-ONC1257957.002904C2-C1257957.00293DF7@phytec.de>
 <CAN8TOE-zTCY-SRrVpsFExu32yq_3j7FJGgVUBN3CEt_E_qzS8Q@mail.gmail.com>
Date: Thu, 01 Dec 2011 09:23:01 +0100
Message-ID: <1322727781.4543.31.camel@lws-weitzel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="UTF-8"
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: J.Weitzel@phytec.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Mittwoch, den 30.11.2011, 10:24 -0800 schrieb Brian Norris:
> On Mon, Nov 28, 2011 at 11:30 PM, Jan Weitzel <J.Weitzel@phytec.de> wrote:
> > Brian Norris <computersforpeace@gmail.com> schrieb am 28.11.2011 19:11:52:
> >> +   if (seed < 0)
> >> +      seed = time(NULL);
> >> +   srand(seed);
> >
> > So you loose all negative seeds.
> 
> Well, srand() technically takes unsigned ints, so all seeds are
> technically positive. But that just means we're parsing and storing
> seeds wrong (not a big deal, really).
> 
> > What is about
> >
> > int seed = time(NULL);
> > ...
> > case 's'
> >        seed = atol(optarg);
> > ...
> > }
> > srand(seed);
> 
> Not sure if I understand the question perfectly (clarify if I'm
> wrong). My patch was intended to:
> (1) use the user-supplied seed (--seed=X) if supplied
> (2) use a random seed (based on time()) if the seed is left
> uninitialized (i.e., -1)
> 
> Anyway, I see a problem with my method. How about the following patch,
> which saves the time first, then overwrites it with the supplied seed
> if provided.
Acked-by: Jan Weitzel <j.weitzel@phytec.de>

Maybe you need to rebase it, because my former patch just got pushed.

> From 4df0643c4819f5de5db54b855406852da0dc6bf1 Mon Sep 17 00:00:00 2001
> From: Brian Norris <computersforpeace@gmail.com>
> Date: Mon, 28 Nov 2011 10:03:30 -0800
> Subject: [PATCH] nandtest: seed random generator properly
> 
> This patch fixes two problems in nandtest:
> 
> * if a seed is provided it is actually not used. First call is
>   "seed = rand()" killing the given seed.
>   Credit: Jan Weitzel <j.weitzel@phytec.de>
> 
> * if a seed is not provided, we use the default rand() values, which
>   produces the same sequence of values every run.r
> 
> To solve these problems, we seed the random number generator with either
> the time() or the supplied seed.
> 
> Cc: Jan Weitzel <j.weitzel@phytec.de>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  nandtest.c |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/nandtest.c b/nandtest.c
> index dc28d09..7811be2 100644
> --- a/nandtest.c
> +++ b/nandtest.c
> @@ -140,6 +140,8 @@ int main(int argc, char **argv)
>         uint32_t offset = 0;
>         uint32_t length = -1;
> 
> +       seed = time(NULL);
> +
>         for (;;) {
>                 static const char *short_options="hkl:mo:p:s:";
>                 static const struct option long_options[] = {
> @@ -243,6 +245,8 @@ int main(int argc, char **argv)
>         printf("Bad blocks     : %d\n", oldstats.badblocks);
>         printf("BBT blocks     : %d\n", oldstats.bbtblocks);
> 
> +       srand(seed);
> +
>         for (pass = 0; pass < nr_passes; pass++) {
>                 loff_t test_ofs;
> 
