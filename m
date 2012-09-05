Received: from db3ehsobe003.messaging.microsoft.com ([213.199.154.141]
 helo=db3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T954U-0003ty-UN
 for linux-mtd@lists.infradead.org; Wed, 05 Sep 2012 02:10:28 +0000
Message-ID: <5046B504.6000608@freescale.com>
Date: Wed, 5 Sep 2012 10:12:20 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: [PATCH 1/3] mtd: cmdlinepart: make the partitions rule more strict
References: <1346001700-26895-1-git-send-email-shijie8@gmail.com>
 <1346656701.3061.8.camel@sauron.fi.intel.com>
 <CAMiH66GX7h5tve9CLHzj8MMrUv90fL+4BWYPZ6KQkP5bbXY9ag@mail.gmail.com>
 <1346686544.3061.75.camel@sauron.fi.intel.com>
 <20120904144826.7b9b7518@halley>
In-Reply-To: <20120904144826.7b9b7518@halley>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Huang Shijie <shijie8@gmail.com>, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2012=E5=B9=B409=E6=9C=8804=E6=97=A5 19:48, Shmulik Ladkani =E5=86=
=99=E9=81=93:
> On Mon, 03 Sep 2012 18:35:44 +0300 Artem Bityutskiy<dedekind1@gmail.com=
>  wrote:
>> With the logic I suggested, for this case what I said would basically:
>>
>> 1. Sort. This leads to
>>
>> 100m@100m(kernel)
>> 1g@200m(rootfs)
>> 100m(boot)
>>
>> "OFFSET_CONTINOUS" is always the largest and will be at the end when
>> sorting.
>>
>> 2. Verification.
>>
>> We verify for overlaps and gaps. And refuse this one.
> Artem, Huang,
>
> Sorry for the long delay, got busy with urgent matters (found out I nee=
d
> to go thru some surgery), I will probably not be available in the
> upcoming days, but I've read the correspondance and wanted to share my
> two cents...
>
> My POV is that sorting and verification is not needed, is troublesome,
> and might affect users in ways they don't expect.
>
> So far, mtdparts commandline parsing has been very lenient and liberal.
> I think we should keep this approach; give the user the flexibility,
> he'll be responsible to provide meaningful cmdline parts for his
> system.
>
> Actually, Huang's initial complaint was that 'parse_cmdline_partitions'
> was too strict - the truncated partition was not registered!
>
> Now, philosophy aside, let's talk about some usecases that might break.
>
> I remember overlapping partitions (more precisely, partition that is a
> subset of another) being common in some embedded systems, where the
> "rootfs" and "kernel" partitions are a subset of the "overall image"
> partition.
> Why break this? if users enjoy the flexibility, and careful not to
> create silly partitions, I'm in favor of keeping the flexibility.
>
> Same goes for sorting.
> If one has a system hacked to work with mtd0 hardcodedly, but mtd0's
> physical location is somewhere at the end of the device, why reorder th=
e
> partitions enumeration affecting this system?
>
> I'd say keep it simple and flexible.
yes, it's really simple and flexible.
But I think it's not wise to export the 0-size partition to user.
The user may confused at this.

And the mtd-utils, such as mtd-info/mtd-debug, do they can work with a=20
0-size partition?

thanks
Huang Shijie

> I trust the user to provide meaningful partitions in the cmdline.
>
> Anyways, please consider this approach.
>
> My patch suggestion might look as (and might need some rework):
>
> diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
> index 17b0bd4..f5df613 100644
> --- a/drivers/mtd/cmdlinepart.c
> +++ b/drivers/mtd/cmdlinepart.c
> @@ -324,7 +324,6 @@ static int parse_cmdline_partitions(struct mtd_info=
 *master,
>                                                 "%s: partitioning excee=
ds flash size, truncating\n",
>                                                 part->mtd_id);
>                                          part->parts[i].size =3D master=
->size - offset;
> -                                       part->num_parts =3D i;
>                                  }
>                                  offset +=3D part->parts[i].size;
>                          }
>
> Regards,
> Shmulik
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
