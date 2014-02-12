Received: from mout.gmx.net ([212.227.17.21])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDSz9-0006n6-SU
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2014 06:07:54 +0000
Received: from 3capp-gmx-bs21.server.lan ([172.19.170.73]) by
 mrigmx.server.lan (mrigmx002) with ESMTP (Nemesis) id
 0M21kz-1VJq5j2nwB-00tyfY for <linux-mtd@lists.infradead.org>; Wed, 12 Feb
 2014 07:07:28 +0100
MIME-Version: 1.0
Message-ID: <trinity-3c306925-bc0a-4f44-aa3e-86f4bc665a51-1392185248517@3capp-gmx-bs21>
From: star@gmx.li
To: "Peter Barada" <peter.barada@gmail.com>
Subject: Aw: Re:  Re: Linux MTD: Per Partition ECC
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Feb 2014 07:07:28 +0100 (CET)
In-Reply-To: <52FA4E64.8020200@gmail.com>
References: <trinity-5aec7168-325d-4995-9e70-e4d2ce4b4816-1392119925322@3capp-gmx-bs63>,
 <52FA1B39.2070904@corscience.de>
 <trinity-39536070-43ab-4f9e-9b92-9852f5fd000b-1392133387225@3capp-gmx-bs63>,
 <52FA4E64.8020200@gmail.com>
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org,
 =?UTF-8?Q?=22Andreas_Bie=C3=9Fmann=22?= <andreas.biessmann@corscience.de>,
 Peter Barada <peter.barada@logicpd.com>, biessmann@corscience.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Peter,

that sounds like that you haven't nailed it for your needs right now?

If unloading works fine, maybe best method is to follow this approach of A=
ndreas (if I get it right:
- modify environmont to boot somehow from a ramdisk (of course content of =
this is in flash initially - where else).
- reboot into this ramdisk which just contains tools required for reflash =
and the content of partitions
- unload module / load module with different ecc scheme
- erase and reflash the complete boot chain (uboot, env, kernel, root)

Sorry, if I am asking again - I haven't the experience with that and I am =
far away from understanding mtd at the moment.
If I am looking into mtpart.c=20

add_one_partition(struct mtd_info *master,
		const struct mtd_partition *part, int partno,
		uint64_t cur_offset)

It looks like that all parameters for this new added partition are copied =
from a master.
Couldn't modify (even quick and dirty hardcoded) this a solution together =
with doubling the partition table.
Hence I could access all partitions below x with Soft-ECC and >=3Dx with o=
n-die-ecc?

I guess you guys spend already some time on this, maybe you can explain wh=
y this or other approaches for a switch will fail?

Best regards
Steffen


> Gesendet: Dienstag, 11. Februar 2014 um 17:23 Uhr
> Von: "Peter Barada" <peter.barada@gmail.com>
> An: star@gmx.li, "Andreas Bie=C3=9Fmann" <andreas.biessmann@corscience.d=
e>
> Cc: biessmann@corscience.de, linux-mtd@lists.infradead.org, "Peter Barad=
a" <peter.barada@logicpd.com>
> Betreff: Re: Aw: Re: Linux MTD: Per Partition ECC
>
> On 02/11/2014 10:43 AM, star@gmx.li wrote:
> > Dear Andreas,
> > thanks for quick answer.
> >
> > It is clear to me, that I can't mix ECC at same time.
> > I would like to switch at a certain point of time.
> >
> > In uboot there is a command (nandecc) which does this for me.
> > But howto do this in linux?
>=20
> Currently there is no method to switch ECCs at runtime within Linux w/o
> unloading/reloading the NAND driver module and specify a different ECC.=
=20
> This works great if your rootfs is not NAND-based (where unloading the
> NAND driver can cause it to hang/crash), but in my case I need it to
> work with a NAND-based rootfs.
>=20
> It may be possible to burn the bootloader into NAND using MTD_RAW_MODE
> which _should_ disable all ECC for the operation, but in my case the ECC
> generator is internal to the NAND chip itself and this won't work.
>=20
> I'm working on a possible solution in my linux-3.0 kernel, to modify
> nand_get_device to take an extra pramater "no_ecc" which keys off
> whether the NAND ops mode (if known) is MTD_OOB_RAW, and if so shut off
> all ECC (including the in-chip ECC my NAND requires).    Then every NAND
> operation will enable/disable ECC while getting the controller lock.
>=20
> In the process of using flashtool to burn NAND, it uses write() to burn
> the data portion, and ioctl(MEMWRITEOOB) to burn the OOB area, but this
> causes two writes to the same page, which violates Np for my NAND (i.e.
> only one write per page).  I'm looking at creating a new ioctl entry
> (MEMWRITEDATAOOB?) that takes both the data and oob buffers from
> userspace and then burns them in one operation.
>=20
> >
> > The idea is to boot in a normal way (1 bit SW ECC).
> > I need to copy all needed tools from flash to RAM (flash_eraseall, nan=
dwrite, busybox)
> > After that all partitions (uboot, kernel, root)  will be erased, writt=
en with new ECC scheme and rebooted.
> >
> > Thinking about this - once I read that it is possible to boot a new ke=
rnel out of linux.
> > Not remember the preconditions, but this is probably the more complex =
way.
> > =20
> > mhh.
> >
> > Did I get it right: You managed it to boot your system (using flash co=
ntent ?) and than unload the mtd module,
> > reload it with a differen parameter and you are able to flash xloader?
> > Of course you cannot access all other partitions of flash during that.
> >
> > In general that seems simular to my challenge - with the difference th=
at I have to flash complete chain ...
> > (at least uboot, environment, kernel, root).
> >
> > You mentioned it is not possible to stick a /dev/mtdx to a certain ECC=
 scheme.=20
> > My kernel is also rather old, (2.6.33) - so no hope that there is incl=
uded this already.
> > In kernel source it seems that each partition uses the copy of a so ca=
lled master. Is more than one master possible?
> > I didn't understand the precedure until now-
> >
> > If your are right, it is useless to double my partition scheme. Idea w=
as to boot uboot from /dev/mtd1 but rewrite it with other ECC scheme at /de=
v/mtd6 as every partition is available with 2 names.
> >
> >
> > Best regards
> > Steffen
> >
> >
> >
> >
> >> Gesendet: Dienstag, 11. Februar 2014 um 13:44 Uhr
> >> Von: "Andreas Bie=C3=9Fmann" <andreas.biessmann@corscience.de>
> >> An: star@gmx.li, biessmann@corscience.de, peter.barada@gmail.com, lin=
ux-mtd@lists.infradead.org
> >> Betreff: Re: Linux MTD: Per Partition ECC
> >>
> >> Dear star@gmx.li,
> >>
> >> cc linux-mtd, one may have more information on that topic there.
> >>
> >> On 02/11/2014 12:58 PM, star@gmx.li wrote:
> >>> Dear Peter, dear Andreas,
> >>>
> >>> I just found this during my research:
> >>>
> >>> http://lists.infradead.org/pipermail/linux-mtd/2012-September/044120=
.html=20
> >>>
> >>> I  have simular Problem, to update a device which runs on 1 bit SW-E=
CC out of linux to 'on-die-ECC'
> >>>
> >>> I duplicated the board partition table (Linux 2.6.33) in a first ste=
p. Now each partition can be access  with 2 names
> >>> /dev/mtd4 or /dev/mtd8 as example.
> >> D'oh why the hell should one do that? I dunno if this is sane with
> >> synchronisation between different access layers (e.g. two different
> >> instances of filesystem).
> >>
> >>> But how can I addict a ECC scheme to a certain partition? Do you thi=
nk this is a possible way?
> >>> So access /dev/mtd4 with software ECC and /dev/mtd8 with on-die-ecc?
> >> AFAIK there is no way to do per partition ecc currently. So there is =
no
> >> way to support this without changing the whole mtd framework.
> >> But maybe there was some movement since my last check. Maybe one of t=
he
> >> mtd developers could comment on that.
> >>
> >> Nevertheless the ECC scheme of Linux 1Bit hamming SW ECC is likely to=
 be
> >> different than the Micron (or whatever manufacturer you use)
> >> 'on-die-ECC', therefore there is no chance to support 'partition A' a=
nd
> >> 'partition B' working on the very same hardware with these different =
ECC
> >> schemes. You can only support scheme A _or_ scheme B at a time. I mea=
n
> >> for the whole process of storing the data and reading it out of the
> >> device. Is the data physically written with scheme A it would fail to
> >> read with scheme B and vice versa.
> >>
> >>> Andreas can you provide the complete patch for you version?=20
> >> You just found the complete patch [2] if you red the link mentioned a=
bove.
> >>
> >>> Problem for me is, I am always running on a mtd partition.
> >> Well, my patch provides a solution for a very special case. Doing sys=
tem
> >> update of embedded devices in the field and switching the ECC scheme =
of
> >> one partition (the first one, which boot ROM is reading) to OMAP3 1 b=
it
> >> hamming HW ECC scheme while the rest of the device is 8 bit BCH SW EC=
C
> >> scheme (it is 'HW-assisted', cause of missing ELM in OMAP3; I know th=
ere
> >> were some patches cleaning this up, dunno the current state).
> >> I can do that cause we kexec the update firmware which brings the
> >> omap-nand mtd driver as a module. That module then can be configured =
to
> >> switch the ECC scheme when probing. The trick is to load it twice,
> >> sequential with different setup.
> >> As discussed in [1] this solution is only useful when doing such very
> >> special update strategies. So sorry, I think it won't help you.
> >>
> >>> As a workaround I do have 2 root partitions which can be boot altern=
atively.
> >> Sorry, I fail to understand how that would help here. The point is yo=
u
> >> need to patch your SPL, bootlaoder and kernel to support the newer EC=
C
> >> scheme and update all of them at once. If the procedure fail then you=
r
> >> device is likely to be bricked ...
> >>
> >> Best regards
> >>
> >> Andreas Bie=C3=9Fmann
> >>
> >> [1] http://thread.gmane.org/gmane.linux.drivers.mtd/50364
> >> [2] http://article.gmane.org/gmane.linux.drivers.mtd/43804
> >>
> >>
>=20
>=20
> --=20
> Peter Barada
> peter.barada@gmail.com
>=20
>
