Received: from mail-gx0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SI0mM-0002Kg-Uh
 for linux-mtd@lists.infradead.org; Wed, 11 Apr 2012 16:52:23 +0000
Received: by ggnk1 with SMTP id k1so648727ggn.36
 for <linux-mtd@lists.infradead.org>; Wed, 11 Apr 2012 09:52:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1334026606-18327-1-git-send-email-b32955@freescale.com>
References: <1334026606-18327-1-git-send-email-b32955@freescale.com>
Date: Wed, 11 Apr 2012 09:52:19 -0700
Message-ID: <CAN8TOE8xz+t1X-JVC1sOy70k64_gRDU-6DkrnqtDkvdbELHQLQ@mail.gmail.com>
Subject: Re: [PATCH] mtd : add parsing code for one kind of Hynix's nand chip
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Huang Shijie <shijie8@gmail.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang,

On Mon, Apr 9, 2012 at 7:56 PM, Huang Shijie <b32955@freescale.com> wrote:
> =A0drivers/mtd/nand/nand_base.c | =A0 43 ++++++++++++++++++++++++++++++++=
++++++++++
> =A01 files changed, 43 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 6315b94..8997023 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3028,6 +3028,49 @@ static struct nand_flash_dev *nand_get_flash_type(=
struct mtd_info *mtd,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mtd->erasesize =3D (128 * =
1024) <<
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(((extid >=
> 1) & 0x04) | (extid & 0x03));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0busw =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else if (id_data[0] =3D=3D NAND_MFR_HYNIX=
 && id_data[1] =3D=3D 0xd7) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Calc pagesize */

I'm not sure this is the beset heuristic. Hynix could easily make a
larger chip that has the same decoding table, so we probably shouldn't
compare dev_id =3D=3D 0xD7. It actually seems like the decoding table
might be intended for all Hynix MLC. What do you think about the
following condition?

+       } else if ((chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
id_data[0] =3D=3D NAND_MFR_HYNIX) {

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Calc oobsize */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 switch (extid & 0x03) {

The table actually includes a third column (bit 6) that corresponds
with the OOB field that, in future revs could have an expanded OOB
size. Personally, I wrote this condition as:

+               switch (((extid >> 2) & 0x04) | (extid & 0x03)) {

That way, we can catch the "default" case as an unknown OOB size.

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_info("Ca=
nnot parse out the oobsize.\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }

I'm not sure if we should just print a message for the default case;
the warning message could easily be missed, and the uninitialized
oobsize would cause problems. Either we should throw an error somehow
or just default to the highest known OOB for this chip type (448
bytes). Personally, I just chose the latter...

BTW, I actually have some patches queued up that I need to complete
properly, where I'm trying to clean up and update NAND detection a
little. So I basically have this same patch, but rebased on top of
some other changes I have ready... I don't mind taking a revised
version of yours, or I can try to clean up my series and send it out
soon.

Either way, please remember to copy me on these type of NAND detection
patches! I've been studying this for a while and have a lot of stuff
queued up to work on sometime, so it's nice to know when others are
touching these areas.

Thanks,
Brian
