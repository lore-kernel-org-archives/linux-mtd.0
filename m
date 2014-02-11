Received: from mout.gmx.net ([212.227.15.18])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDFUm-00076V-8e
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2014 15:43:38 +0000
Received: from 3capp-gmx-bs63.server.lan ([172.19.170.147]) by
 mrigmx.server.lan (mrigmx001) with ESMTP (Nemesis) id
 0MARzI-1W1kEj21sY-00Bf2o for <linux-mtd@lists.infradead.org>; Tue, 11 Feb
 2014 16:43:07 +0100
MIME-Version: 1.0
Message-ID: <trinity-39536070-43ab-4f9e-9b92-9852f5fd000b-1392133387225@3capp-gmx-bs63>
From: star@gmx.li
To: =?UTF-8?Q?=22Andreas_Bie=C3=9Fmann=22?= <andreas.biessmann@corscience.de>
Subject: Aw: Re: Linux MTD: Per Partition ECC
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Feb 2014 16:43:07 +0100 (CET)
In-Reply-To: <52FA1B39.2070904@corscience.de>
References: <trinity-5aec7168-325d-4995-9e70-e4d2ce4b4816-1392119925322@3capp-gmx-bs63>,
 <52FA1B39.2070904@corscience.de>
Content-Transfer-Encoding: quoted-printable
Cc: peter.barada@gmail.com, linux-mtd@lists.infradead.org,
 biessmann@corscience.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Andreas,
thanks for quick answer.

It is clear to me, that I can't mix ECC at same time.
I would like to switch at a certain point of time.

In uboot there is a command (nandecc) which does this for me.
But howto do this in linux?

The idea is to boot in a normal way (1 bit SW ECC).
I need to copy all needed tools from flash to RAM (flash_eraseall, nandwri=
te, busybox)
After that all partitions (uboot, kernel, root)  will be erased, written w=
ith new ECC scheme and rebooted.

Thinking about this - once I read that it is possible to boot a new kernel=
 out of linux.
Not remember the preconditions, but this is probably the more complex way.
=20
mhh.

Did I get it right: You managed it to boot your system (using flash conten=
t ?) and than unload the mtd module,
reload it with a differen parameter and you are able to flash xloader?
Of course you cannot access all other partitions of flash during that.

In general that seems simular to my challenge - with the difference that I=
 have to flash complete chain ...
(at least uboot, environment, kernel, root).

You mentioned it is not possible to stick a /dev/mtdx to a certain ECC sch=
eme.=20
My kernel is also rather old, (2.6.33) - so no hope that there is included=
 this already.
In kernel source it seems that each partition uses the copy of a so called=
 master. Is more than one master possible?
I didn't understand the precedure until now-

If your are right, it is useless to double my partition scheme. Idea was t=
o boot uboot from /dev/mtd1 but rewrite it with other ECC scheme at /dev/mt=
d6 as every partition is available with 2 names.


Best regards
Steffen




> Gesendet: Dienstag, 11. Februar 2014 um 13:44 Uhr
> Von: "Andreas Bie=C3=9Fmann" <andreas.biessmann@corscience.de>
> An: star@gmx.li, biessmann@corscience.de, peter.barada@gmail.com, linux-=
mtd@lists.infradead.org
> Betreff: Re: Linux MTD: Per Partition ECC
>
> Dear star@gmx.li,
>=20
> cc linux-mtd, one may have more information on that topic there.
>=20
> On 02/11/2014 12:58 PM, star@gmx.li wrote:
> > Dear Peter, dear Andreas,
> >=20
> > I just found this during my research:
> >=20
> > http://lists.infradead.org/pipermail/linux-mtd/2012-September/044120.h=
tml=20
> >
> > I  have simular Problem, to update a device which runs on 1 bit SW-ECC=
 out of linux to 'on-die-ECC'
> >=20
> > I duplicated the board partition table (Linux 2.6.33) in a first step.=
 Now each partition can be access  with 2 names
> > /dev/mtd4 or /dev/mtd8 as example.
>=20
> D'oh why the hell should one do that? I dunno if this is sane with
> synchronisation between different access layers (e.g. two different
> instances of filesystem).
>=20
> > But how can I addict a ECC scheme to a certain partition? Do you think=
 this is a possible way?
> > So access /dev/mtd4 with software ECC and /dev/mtd8 with on-die-ecc?
>=20
> AFAIK there is no way to do per partition ecc currently. So there is no
> way to support this without changing the whole mtd framework.
> But maybe there was some movement since my last check. Maybe one of the
> mtd developers could comment on that.
>=20
> Nevertheless the ECC scheme of Linux 1Bit hamming SW ECC is likely to be
> different than the Micron (or whatever manufacturer you use)
> 'on-die-ECC', therefore there is no chance to support 'partition A' and
> 'partition B' working on the very same hardware with these different ECC
> schemes. You can only support scheme A _or_ scheme B at a time. I mean
> for the whole process of storing the data and reading it out of the
> device. Is the data physically written with scheme A it would fail to
> read with scheme B and vice versa.
>=20
> > Andreas can you provide the complete patch for you version?=20
>=20
> You just found the complete patch [2] if you red the link mentioned abov=
e.
>=20
> > Problem for me is, I am always running on a mtd partition.
>=20
> Well, my patch provides a solution for a very special case. Doing system
> update of embedded devices in the field and switching the ECC scheme of
> one partition (the first one, which boot ROM is reading) to OMAP3 1 bit
> hamming HW ECC scheme while the rest of the device is 8 bit BCH SW ECC
> scheme (it is 'HW-assisted', cause of missing ELM in OMAP3; I know there
> were some patches cleaning this up, dunno the current state).
> I can do that cause we kexec the update firmware which brings the
> omap-nand mtd driver as a module. That module then can be configured to
> switch the ECC scheme when probing. The trick is to load it twice,
> sequential with different setup.
> As discussed in [1] this solution is only useful when doing such very
> special update strategies. So sorry, I think it won't help you.
>=20
> > As a workaround I do have 2 root partitions which can be boot alternat=
ively.
>=20
> Sorry, I fail to understand how that would help here. The point is you
> need to patch your SPL, bootlaoder and kernel to support the newer ECC
> scheme and update all of them at once. If the procedure fail then your
> device is likely to be bricked ...
>=20
> Best regards
>=20
> Andreas Bie=C3=9Fmann
>=20
> [1] http://thread.gmane.org/gmane.linux.drivers.mtd/50364
> [2] http://article.gmane.org/gmane.linux.drivers.mtd/43804
>=20
>
