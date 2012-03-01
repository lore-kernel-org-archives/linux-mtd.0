Received: from gw1.transmode.se ([195.58.98.146])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S38PX-0002S3-Qq
 for linux-mtd@lists.infradead.org; Thu, 01 Mar 2012 15:59:20 +0000
In-Reply-To: <1330613834.5242.YahooMailClassic@web29010.mail.ird.yahoo.com>
References: <OF3A221559.E83A6FE6-ONC12579B3.0080422F-C12579B3.008197D4@transmode.se>
 <1330613834.5242.YahooMailClassic@web29010.mail.ird.yahoo.com>
Subject: Re: [PATCH] mtd: cfi: Wait for Block Erase operation to finish
To: Paul Parsons <lost.distance@yahoo.com>
Message-ID: <OFF2937097.8615D7FE-ONC12579B4.005551DC-C12579B4.0057CFB9@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 1 Mar 2012 16:59:08 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-15
Content-transfer-encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, philipp.zabel@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Paul Parsons <lost.distance@yahoo.com> wrote on 2012/03/01 15:57:14:
>
> --- On Wed, 29/2/12, Joakim Tjernlund <joakim.tjernlund@transmode.se>=
 wrote:
> > This looks like a erase resume problem, cfi driver issues a
> > resume command but the
> > chip fails or is slow to respond. I remember someone having
> > a similar problem
> > some time ago. Don't think we got to bottom of it though,
> > look for subject:
> > =A0 Numonyx NOR and chip->mutex bug?
>
> Yes, that Numonyx NOR problem seems to be the same as mine.
>
> > Try adding extra read status cmds around resume, check if
> > SR.6 is cleared too.
>
> OK, I think I've made some progress here.
>
> The status transitions around the Erase Resume are as follows:
>
> [   58.702774] 108: PUTC: 0: status=3D0x00c000c0 // Before CMD(0xd0)
> [   58.702792] 108: PUTC: 1: status=3D0x00400040 // After CMD(0xd0),C=
MD(0x70)
> [   58.702808] 108: PUTC: 2: status=3D0x00000000 // + cfi_udelay(1)

hmm, this is not ideal. The status bits are only valid if SR.7 is set i=
f I remember correctly?
Maybe SR.6 is an exception?
So reading SR.6 and waiting for it to clear may not work on other chips=
?
Is there some resume to erase time in the specs?


>
> So SR.7 transitions from 1 to 0 after CMD(0xd0), and some time later =
SR.6
> transitions from 1 to 0. So the effects of Erase Resume are not immed=
iate.
> Thus it seemed a good idea to wait for these bits to settle:
>
> diff -upr clean-3.3-rc5/drivers/mtd/chips/cfi_cmdset_0001.c linux-3.3=
-rc5/drivers/mtd/chips/cfi_cmdset_0001.c
> --- clean-3.3-rc5/drivers/mtd/chips/cfi_cmdset_0001.c   2012-02-25 20=
:18:16.000000000 +0000
> +++ linux-3.3-rc5/drivers/mtd/chips/cfi_cmdset_0001.c   2012-03-01 13=
:44:49.529371920 +0000
> @@ -956,6 +956,7 @@ static int get_chip(struct map_info *map
>  static void put_chip(struct map_info *map, struct flchip *chip, unsi=
gned long adr)
>  {
>     struct cfi_private *cfi =3D map->fldrv_priv;
> +   map_word status, status_40 =3D CMD(0x40), status_00 =3D CMD(0x00)=
;
>
>     if (chip->priv) {
>        struct flchip_shared *shared =3D chip->priv;
> @@ -1006,6 +1007,15 @@ static void put_chip(struct map_info *ma
>        map_write(map, CMD(0xd0), adr);
>        map_write(map, CMD(0x70), adr);
>        chip->oldstate =3D FL_READY;
> +      chip->state =3D FL_ERASE_RESUMING;
> +      for (;;) {
> +         status =3D map_read(map, adr);
> +         if (map_word_andequal(map, status, status_40, status_00))
> +                 break;
> +         mutex_unlock(&chip->mutex);
> +         cfi_udelay(1);
> +         mutex_lock(&chip->mutex);
> +      }
>        chip->state =3D FL_ERASING;
>        break;
>
> diff -upr clean-3.3-rc5/include/linux/mtd/flashchip.h linux-3.3-rc5/i=
nclude/linux/mtd/flashchip.h
> --- clean-3.3-rc5/include/linux/mtd/flashchip.h   2012-02-25 20:18:16=
.000000000 +0000
> +++ linux-3.3-rc5/include/linux/mtd/flashchip.h   2012-03-01 13:41:48=
.288232532 +0000
> @@ -36,6 +36,7 @@ typedef enum {
>     FL_ERASING,
>     FL_ERASE_SUSPENDING,
>     FL_ERASE_SUSPENDED,
> +   FL_ERASE_RESUMING,
>     FL_WRITING,
>     FL_WRITING_TO_BUFFER,
>     FL_OTP_WRITE,
>
> This patch adds a wait after Erase Resume, just like the existing one=
 after
> Erase Suspend (but without the timeout). I added the FL_ERASE_RESUMIN=
G
> state to perform the same function as the FL_ERASE_SUSPENDING state: =
to
> stop anyone else touching it.
>
> When I tried this patch in place of my previous one I found it too fi=
xed
> my problem. That's not a surprise because it does the same thing, it =
waits
> for SR.6 to clear, but at an earlier point. Unlike my previous patch,=

> this patch leaves SR.7 and SR.6 in a consistent state before put_chip=
()
> returns (and indeed before the call to wake_up(&chip->wq) at the bott=
om of
> put_chip()).
>
> What I don't know is why not waiting for SR.7 and SR.6 to settle afte=
r
> Erase Resume can then break UBI, in particular provoking the
> "block erase error: (bad VPP)" messages I was seeing earlier.=
