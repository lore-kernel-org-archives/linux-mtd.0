Received: from dnvwsmailout1.mcafee.com ([161.69.31.173])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TNvhW-0007Ts-14
 for linux-mtd@lists.infradead.org; Tue, 16 Oct 2012 01:12:06 +0000
Message-ID: <507CB4A1.4080609@snapgear.com>
Date: Tue, 16 Oct 2012 11:13:05 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/2 RFC v2] mtd/uclinux: support ROM and allow passing
 the base address
References: <1349709952-4332-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1350027693-19528-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <507B8DBF.2030104@snapgear.com> <20121015065855.GG639@pengutronix.de>
In-Reply-To: <20121015065855.GG639@pengutronix.de>
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

Hi Uwe,

On 15/10/12 16:58, Uwe Kleine-K=F6nig wrote:
> On Mon, Oct 15, 2012 at 02:14:55PM +1000, Greg Ungerer wrote:
>>>   	mapp->virt =3D ioremap_nocache(mapp->phys, mapp->size);
>>> @@ -76,9 +83,18 @@ static int __init uclinux_mtd_init(void)
>>>
>>>   	simple_map_init(mapp);
>>>
>>> -	mtd =3D do_map_probe("map_ram", mapp);
>>> +	mapp->name =3D "ROM";
>>> +	mtd =3D do_map_probe("map_rom", mapp);
>>> +	if (!mtd) {
>>> +		/* fall back to ram probing for compatibility reasons */
>>> +		mapp->name =3D "RAM";
>>> +		mtd =3D do_map_probe("map_ram", mapp);
>>> +		if (mtd && IS_ENABLED(CONFIG_MTD_ROM))
>>> +			pr_err("Failed to map rom, but ram succeeded. Please report this is=
sue!\n");
>>
>> Do we really want this message?
>> My predominate usage of this code is in RAM mappings. Network
>> loading kernel+filesystem images on bare boards. Anyone who wants
>> to know and is looking in the kernel boot messages will see
>> something like:
>>
>>      Creating 1 MTD partitions on "RAM":
>>      0x000000000000-0x0000000d8000 : "ROMfs"
>>
>> So they will know what type of mapping it was loaded from.
> I want it because if nobody reports it it might well be possible to drop
> map_ram support.

I am not sure I follow. The message is only printed if both ROM and
RAM mappings are enabled. Many of the configs I use only have RAM
mappings enabled.

Regards
Greg

 =20
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
