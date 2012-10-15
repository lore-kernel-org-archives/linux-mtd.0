Received: from dnvwsmailout1.mcafee.com ([161.69.31.173])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TNc3t-0002Bt-Im
 for linux-mtd@lists.infradead.org; Mon, 15 Oct 2012 04:13:55 +0000
Message-ID: <507B8DE6.6030407@snapgear.com>
Date: Mon, 15 Oct 2012 14:15:34 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 2/2] mtd/uclinux: add a comment about why uclinux_ram_map
 must not be static
References: <1349709952-4332-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1350027693-19528-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1350027693-19528-2-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <1350027693-19528-2-git-send-email-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, Mike
 Frysinger <vapier.adi@gmail.com>, kernel@pengutronix.de,
 Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/10/12 17:41, Uwe Kleine-K=F6nig wrote:
> I was (at least) the second person trying to fix a warning by sparse, so
> document in the code why this is a bad idea.
>
> Signed-off-by: Uwe Kleine-K=C3=B7nig <u.kleine-koenig@pengutronix.de>

Acked-by: Greg Ungerer <gerg@uclinux.org>


> ---
> Hello,
>
> it's a bit exaggerated to claim that sparse is happy now, but at least
> we have one warning less :-)
>
> Uwe
>   drivers/mtd/maps/uclinux.c |    6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
> index f5e8e9a..18cf6d0 100644
> --- a/drivers/mtd/maps/uclinux.c
> +++ b/drivers/mtd/maps/uclinux.c
> @@ -23,6 +23,12 @@
>
>   /**********************************************************************=
******/
>
> +/*
> + * Blackfin uses uclinux_ram_map during startup, so it must not be stati=
c.
> + * Provide a dummy declaration to make sparse happy.
> + */
> +extern struct map_info uclinux_ram_map;
> +
>   struct map_info uclinux_ram_map =3D {
>   	.size =3D 0,
>   };
>


--=20
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
