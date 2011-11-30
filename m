Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RVopv-0003p6-EJ
 for linux-mtd@lists.infradead.org; Wed, 30 Nov 2011 18:24:52 +0000
Received: by eaac10 with SMTP id c10so1271014eaa.36
 for <linux-mtd@lists.infradead.org>; Wed, 30 Nov 2011 10:24:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <OF4FD25221.65A13349-ONC1257957.002904C2-C1257957.00293DF7@phytec.de>
References: <CAN8TOE-rh_yh_0hi+unXe3Q5zV9tdBW6rhomRG-h3za5A4ROrg@mail.gmail.com>
 <1322503912-8221-1-git-send-email-computersforpeace@gmail.com>
 <OF4FD25221.65A13349-ONC1257957.002904C2-C1257957.00293DF7@phytec.de>
Date: Wed, 30 Nov 2011 10:24:49 -0800
Message-ID: <CAN8TOE-zTCY-SRrVpsFExu32yq_3j7FJGgVUBN3CEt_E_qzS8Q@mail.gmail.com>
Subject: Re: [PATCH] nandtest: seed random generator properly
From: Brian Norris <computersforpeace@gmail.com>
To: Jan Weitzel <J.Weitzel@phytec.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 28, 2011 at 11:30 PM, Jan Weitzel <J.Weitzel@phytec.de> wrote:
> Brian Norris <computersforpeace@gmail.com> schrieb am 28.11.2011 19:11:52=
:
>> + =A0 if (seed < 0)
>> + =A0 =A0 =A0seed =3D time(NULL);
>> + =A0 srand(seed);
>
> So you loose all negative seeds.

Well, srand() technically takes unsigned ints, so all seeds are
technically positive. But that just means we're parsing and storing
seeds wrong (not a big deal, really).

> What is about
>
> int seed =3D time(NULL);
> ...
> case 's'
> =A0 =A0 =A0 =A0seed =3D atol(optarg);
> ...
> }
> srand(seed);

Not sure if I understand the question perfectly (clarify if I'm
wrong). My patch was intended to:
(1) use the user-supplied seed (--seed=3DX) if supplied
(2) use a random seed (based on time()) if the seed is left
uninitialized (i.e., -1)

Anyway, I see a problem with my method. How about the following patch,
which saves the time first, then overwrites it with the supplied seed
if provided.

>From 4df0643c4819f5de5db54b855406852da0dc6bf1 Mon Sep 17 00:00:00 2001
From: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 28 Nov 2011 10:03:30 -0800
Subject: [PATCH] nandtest: seed random generator properly

This patch fixes two problems in nandtest:

* if a seed is provided it is actually not used. First call is
  "seed =3D rand()" killing the given seed.
  Credit: Jan Weitzel <j.weitzel@phytec.de>

* if a seed is not provided, we use the default rand() values, which
  produces the same sequence of values every run.r

To solve these problems, we seed the random number generator with either
the time() or the supplied seed.

Cc: Jan Weitzel <j.weitzel@phytec.de>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 nandtest.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/nandtest.c b/nandtest.c
index dc28d09..7811be2 100644
--- a/nandtest.c
+++ b/nandtest.c
@@ -140,6 +140,8 @@ int main(int argc, char **argv)
        uint32_t offset =3D 0;
        uint32_t length =3D -1;

+       seed =3D time(NULL);
+
        for (;;) {
                static const char *short_options=3D"hkl:mo:p:s:";
                static const struct option long_options[] =3D {
@@ -243,6 +245,8 @@ int main(int argc, char **argv)
        printf("Bad blocks     : %d\n", oldstats.badblocks);
        printf("BBT blocks     : %d\n", oldstats.bbtblocks);

+       srand(seed);
+
        for (pass =3D 0; pass < nr_passes; pass++) {
                loff_t test_ofs;

--=20
1.7.5.4
