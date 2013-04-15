Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UReF6-0003O5-9j
 for linux-mtd@lists.infradead.org; Mon, 15 Apr 2013 07:54:25 +0000
Message-ID: <516BB279.9000000@freescale.com>
Date: Mon, 15 Apr 2013 15:55:37 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: cfi_cmdset_0002: do_write_buffer timeouts
References: <CAN8TOE8dVYxBbb8MtozFio8dS-ypq14U8RuKTo38QcAtXM5Qrw@mail.gmail.com>	<CAN8TOE8BRhgi_ep8xypA_OwF4qfJikztmUcc-+XDB7hjnopuUA@mail.gmail.com>	<5167A87A.3030002@aimvalley.nl>
 <CAN8TOE_Em4g9vb=PYYimGvK9_7O5xPAWQwNs_wX9cnskTaXP5Q@mail.gmail.com>
In-Reply-To: <CAN8TOE_Em4g9vb=PYYimGvK9_7O5xPAWQwNs_wX9cnskTaXP5Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>, Kevin Cernekee <cernekee@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Norbert van Bolhuis <nvbolhuis@aimvalley.nl>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B404=E6=9C=8813=E6=97=A5 10:59, Brian Norris =E5=86=99=
=E9=81=93:
> Disabling CONFIG_NO_HZ doesn't fix my problem.
I also disable the CONFIG_NO_HZ, and it does not fix my problem too.

But after i remove the mutex_unlock/mutex_lock in=20
UDELAY/INVALIDATE_CACHE_UDELAY,
my problem disappears. I run for three days, no timeout occurs. (I do=20
not enable the CONFIG_MTD_XIP).


--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1043,17 +1043,13 @@ static void __xipram xip_udelay(struct map_info=20
*map, struct flchip *chip,

#define UDELAY(map, chip, adr, usec) \
do { \
- mutex_unlock(&chip->mutex); \
cfi_udelay(usec); \
- mutex_lock(&chip->mutex); \
} while (0)

#define INVALIDATE_CACHE_UDELAY(map, chip, adr, len, usec) \
do { \
- mutex_unlock(&chip->mutex); \
INVALIDATE_CACHED_RANGE(map, adr, len); \
cfi_udelay(usec); \
- mutex_lock(&chip->mutex); \
} while (0)

#endif
--=20




thanks
Huang Shijie
