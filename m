Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPbuT-000651-Mk
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 15:56:10 +0000
Received: by lbbgg6 with SMTP id gg6so671919lbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 08:56:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1205021047010.20592@lnxricardw.se.axis.com>
References: <CADZ6=aumk74QxF3kjenFYqQUZ-OaPT8gmrN-xUGE6NPPyq87NQ@mail.gmail.com>
 <CADZ6=asURkKX6VB_UsmtcMnU5N8Xq_Lv7uRpkvYmQ3YBU7tvhQ@mail.gmail.com>
 <Pine.LNX.4.64.1205020933520.20592@lnxricardw.se.axis.com>
 <CADZ6=asdcCJOnPJfkV67wNHu2CX16NTzmN5z14nDhqGVvHdo4g@mail.gmail.com>
 <Pine.LNX.4.64.1205021047010.20592@lnxricardw.se.axis.com>
Date: Wed, 2 May 2012 17:56:07 +0200
Message-ID: <CADZ6=at5axiWkNF5CiqjqJmzsQdrKiVoPJh27ehy0fGsgLdSjw@mail.gmail.com>
Subject: Re: State of read-only filesystems in NAND / MTD bad blocks handling
 when reading
From: Thilo Fromm <fromm@dresearch-fe.de>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, Richard,

[ MTD read might return bad blocks ]
>>> One way is to use a file system intended for flashes, but mount it
>>> read-only. I.e. use a jffs2 filesystem, mounted readonly.
>>
>>
>> Yupp, or I coud hack up SquashFS to be bad blocks aware. However, it
>> feels kind of wrong to me to leave bad block handling to the file
>> system layer. Because I would have to provide bad block awareness to
>> every read-only FS I am planning to use. Over and over again.
>
>
> I principally agree, however, jffs2 is doing just that, managing bad bloc=
ks.
> Whether that is a good idea or not is debatable of course. Technically it
> mixes up file system and device properties. Also, you might not plan to
> change read-only FS's very often so the effort might be quite minimal in
> practice.

It still feels like the wrong place to do this. Every FS would just
skip this block, and be done with it.

>>> Or, let UBI handle the flash, and use ubifs in a static volume, which
>>> means
>>> it will be non-writable. Last time I checked it wasn't possible to use
>>> file
>>> systems such as cramfs on UBI, because UBI did not supply a block devic=
e
>>> which is required by cramfs. I seem to remember some patch to add block
>>> devices to UBI, not sure what the state of that is.
>>
>>
>> I think a simpler option would be to have your (read-only squash-)root
>> FS image in a static UBI volume and mount it via loop-back. This is
>> currently our fallback option. Still this feels like way too much
>> overhead for what we're looking for.
>
>
> Interting, it never occurred to me that that was possible. I always think=
 of
> loopback mounts for mounting things like files as cdrom drives. How do yo=
u
> specify a loopback mount for the rootfs on the kernel command line?

I don't know; I would have done the necessary preparations in an
initrd, then pivot_root into the loopback mount.

[ bad-block-skip read is easy for boot loader, user space ]
>> Unfortunately it seems to be impossible to provide this read behavior
>> via an MTD API to other parts of the linux kernel. All the workarounds
>> seem such a waste, and this bad block-free read-only API seems such a
>> good idea for a lot of things I'm really curious why the work on
>> something as cool as MTD_BLOCK_RO_BBFREE =C2=A0ceased in 2006.
>
>
> I don't know for sure, but I think the majority of flash subsystem effort
> has been centered around UBI and ubifs; for instance, there is very littl=
e
> (if any) development on jffs2 nowadays, with all the effort going into ub=
ifs
> (and yaffs, different mailing list). One of the main points of UBI is to
> handle bad blocks, consequently with UBI in the mainstream kernel for a
> while now, most other efforts have a limited appeal.

I find this whole MTD / UBI thing, let alone UBIFS, incredibly blurry.
There seems to be no consequent abstraction between the "layers" mtd,
ubi, ubifs, let alone unique responsibilities for either of the
layers.

> Linutronix have made a small UBI library for reading static UBI volumes
> which is suitable for boot loaders, so that one can have the kernel resid=
ing
> in a UBI volume and get all the benefits of bad block management etc even=
 at
> that level.

I already get everything I need from the way our boot loader (u-boot)
handles MTD writes (it skips bad blocks) and MTD reads (it skips bad
blocks). I do not, for instance, have trouble booting a kernel image
which was written into a NAND partition with bad blocks. U-boot will
read all the sane blocks back just fine, so I can boot. There is
actually no issue I need to fix inside u-boot.

>> Since I really like the idea of a MTD block device that skips bad
>> blocks when reading I'm currently in the process of re-animating the
>> BBFREE patch
>> <http://lists.infradead.org/pipermail/linux-mtd/2006-November/016835.htm=
l>:
>> it compiles for me, but still has some major issues. I'll keep this
>> list up to date on my progress.
>
>
> All pathes would be welcome; I'm sure there are others who would find suc=
h
> an approach beneficial, even if I think UBI is probably the way to go the=
se
> days.

Apart from the fact that my NAND SW stack will then be two layers
higher than it actually needs to be (and the added complexity this
brings to boot loader and kernel) -  as far as I know UBI does not
provide the functionality we require: being able to store a read-only
file system image, and mount it at boot time. At least we don't get
this without another boot step (initrd, see above).


Regards,
Thilo

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228 =C2=A0 mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle
