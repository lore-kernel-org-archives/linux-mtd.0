Received: from mail-vb0-x22b.google.com ([2607:f8b0:400c:c02::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1USaA3-0007WZ-7I
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2013 21:45:04 +0000
Received: by mail-vb0-f43.google.com with SMTP id q12so1649506vbe.2
 for <linux-mtd@lists.infradead.org>; Wed, 17 Apr 2013 14:45:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <516BB279.9000000@freescale.com>
References: <CAN8TOE8dVYxBbb8MtozFio8dS-ypq14U8RuKTo38QcAtXM5Qrw@mail.gmail.com>
 <CAN8TOE8BRhgi_ep8xypA_OwF4qfJikztmUcc-+XDB7hjnopuUA@mail.gmail.com>
 <5167A87A.3030002@aimvalley.nl>
 <CAN8TOE_Em4g9vb=PYYimGvK9_7O5xPAWQwNs_wX9cnskTaXP5Q@mail.gmail.com>
 <516BB279.9000000@freescale.com>
Date: Wed, 17 Apr 2013 14:45:00 -0700
Message-ID: <CAN8TOE-_cj6E_zuUyWdAwehC0aaNQB=Ks71Ub7EEHTQbiYpLtg@mail.gmail.com>
Subject: Re: cfi_cmdset_0002: do_write_buffer timeouts
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=GB2312
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

On Mon, Apr 15, 2013 at 12:55 AM, Huang Shijie <b32955@freescale.com> wrote=
:
> =D3=DA 2013=C4=EA04=D4=C213=C8=D5 10:59, Brian Norris =D0=B4=B5=C0:
>
>> Disabling CONFIG_NO_HZ doesn't fix my problem.
>
> I also disable the CONFIG_NO_HZ, and it does not fix my problem too.
>
> But after i remove the mutex_unlock/mutex_lock in
> UDELAY/INVALIDATE_CACHE_UDELAY,
> my problem disappears. I run for three days, no timeout occurs. (I do not
> enable the CONFIG_MTD_XIP).
>
>
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -1043,17 +1043,13 @@ static void __xipram xip_udelay(struct map_info
> *map, struct flchip *chip,
>
> #define UDELAY(map, chip, adr, usec) \
> do { \
> - mutex_unlock(&chip->mutex); \
> cfi_udelay(usec); \
> - mutex_lock(&chip->mutex); \
> } while (0)
>
> #define INVALIDATE_CACHE_UDELAY(map, chip, adr, len, usec) \
> do { \
> - mutex_unlock(&chip->mutex); \
> INVALIDATE_CACHED_RANGE(map, adr, len); \
> cfi_udelay(usec); \
> - mutex_lock(&chip->mutex); \
> } while (0)
>
> #endif

This patch doesn't solve my problem, so it seems that Huang and I
probably are seeing different root causes for these timeouts.

I tried applying this patch and then timing the exact delay seen by
the time we "time out" (by directly accessing the CPU count register),
and the delay is always very close to 4ms (with my kernel, HZ=3D250, so
4ms is expected). So it seems like my system is waiting plenty long
(according to the flash part specification) but if I wait even longer,
the operation does complete successfully.

I'll continue to look at this issue, but I thought I'd post my results so f=
ar.

Brian
