Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SRK2V-0004bj-W9
 for linux-mtd@lists.infradead.org; Mon, 07 May 2012 09:15:33 +0000
Received: by lbbgg6 with SMTP id gg6so4085195lbb.36
 for <linux-mtd@lists.infradead.org>; Mon, 07 May 2012 02:15:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1205041054400.27120@lnxricardw.se.axis.com>
References: <CADZ6=aumk74QxF3kjenFYqQUZ-OaPT8gmrN-xUGE6NPPyq87NQ@mail.gmail.com>
 <CADZ6=asURkKX6VB_UsmtcMnU5N8Xq_Lv7uRpkvYmQ3YBU7tvhQ@mail.gmail.com>
 <Pine.LNX.4.64.1205020933520.20592@lnxricardw.se.axis.com>
 <CADZ6=asdcCJOnPJfkV67wNHu2CX16NTzmN5z14nDhqGVvHdo4g@mail.gmail.com>
 <Pine.LNX.4.64.1205021047010.20592@lnxricardw.se.axis.com>
 <CADZ6=at5axiWkNF5CiqjqJmzsQdrKiVoPJh27ehy0fGsgLdSjw@mail.gmail.com>
 <0A40042D85E7C84DB443060EC44B3FD3351F9CADFB@dekaexchange07.deka.local>
 <CADZ6=atZPNM+1sXJngdkoWddHX0WzzPqyJPa4Fi2FuiOoaV9dg@mail.gmail.com>
 <Pine.LNX.4.64.1205041054400.27120@lnxricardw.se.axis.com>
Date: Mon, 7 May 2012 11:15:29 +0200
Message-ID: <CADZ6=as7Wz5TvGRbTa=6ydZMcBQHe2VRAPpxNy+3hFKApJEBzw@mail.gmail.com>
Subject: Re: State of read-only filesystems in NAND / MTD bad blocks handling
 when reading
From: Thilo Fromm <fromm@dresearch-fe.de>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Atlant Schmidt <aschmidt@dekaresearch.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Ricard,

>>> =C2=A0It contains a maximum of m-fudge_factor LEBs (Logical Erase Block=
s)
>>> =C2=A0of n-ovehead pages each. It can erase whole LEBs, write pages, an=
d
>>> =C2=A0read pages. By providing bad block mapping and wear leveling, it
>>> =C2=A0provides a device which is slightly smaller than the MTD device
>>> =C2=A0it's layered upon, but that device doesn't have bad blocks and
>>> =C2=A0you can't wear out any individual LEB faster than the whole
>>> =C2=A0device wears out. The device remains perfect until its reserve
>>> =C2=A0of replacement (spare) blocks is exhausted as blocks go bad.
>>
>>
>> But unfortunately I can use these features with nothing else than UBIFS?
>
>
> Well, you can use it for large binary objects, such as the Linux kernel, =
if
> you want. There are currently no other filesystems other than ubifs which
> run directly on top of UBI, but if you enable the gluebi layer, you get m=
td
> devices on top of each ubi volume so you can use jffs2 if you want.

That's a bit much. What do I gain from a kernel in mtd/UBI instead of
putting it directly into a plain MTD?

> Gluebi is in many cases not really an option, because it maps _each_ ubi
> volume to an mtd device, thus you cannot for instance mix jffs2 and ubifs=
 on
> a gluebi system. AFAIU it would be possible to extend gluebi so that it
> would be possible to enable the gluebi layer only for selected ubi volume=
s,
> but AFAIK it has not been done (yet).

Ah, okay.

> Technically I suppose one could device a "jffs2a" to run directly on a UB=
I
> device, but it would be rather pointless; we have a "jffs3" which turned
> into ubifs in the end.

And I think you did some excellent work with the UBI/UBIFS stack. It's
the way to go when you need a flash-aware r/w fs. The drawback is that
handling and maintenance of UBI filesystems is still a bit "special"
(as in: things don't work like they do with other, more generic, file
systems). And one side effect of this "specialness" is that you're
currently seem to be limited to the MTD/UBI stack and can't use other
file systems on MTDs.

> While jffs2 is tried-and-tested there is very little development and
> maintenence going on nowadays, with development and bug fixing instead go=
ing
> into ubifs. So over time, jffs2 will probably tend to degrade while ubifs
> will continue to improve.

Concerning flash-aware read/write file system stacks I totally agree
with your opinion about UBIFS vs. JFFS2. It would clearly be UBIFS for
me if I would have to choose a flash-aware r/w FS stack. But I don't
need read-write. I don't even need a file system. I just need a r/o
block device that works for mounts.

>>> =C2=A0UBIfs (on top of UBI on top of MTD) "materializes" a file system.
>>> =C2=A0It contains ordinary Linux/Unix files on a perfect storage medium=
.
>>> =C2=A0It depends upon the perfect storage provided by UBI.
>>
>>
>> I have the impression that we took a shortcut between the last two
>> paragraphs. Can you please elaborate on why i need a second UBI
>> partition within an UBI partition in order to use UBIFS? Or am I wrong
>> with this point?
>
>
> I think you've misunderstood something.
>
> Basically, if you have an mtd partition, say mtd2, then you can attach UB=
I
> to it (or is the terminology 'attach an mtd partition to UBI'; I'm not
> sure):
>
> # ubiattach -m 5 /dev/ubi_ctrl
>
> /dev/mtd2 --> /dev/ubi0
>
> Within each UBI partition, you can then have several volumes, e.g.:
>
> # ubimkvol /dev/ubi0 -N kernel -s 3 MiB -t static
> # ubimkvol /dev/ubi0 -N rootfs -s 25 MiB -t static
> # ubimkvol /dev/ubi0 -N appdata -s 55 MiB -t dynamic
>
> /dev/mtd2 --> /dev/ubi0 --> /dev/ubi0_0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0+-> /dev/ubi0_1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0+-> /dev/ubi0_2
>
> In each volume you can have a file system, i.e. ubifs, which can be mount=
ed:
>
> # mount -t ubifs ubi0:appdata /usr/apps
>
> /dev/mtd2 --> /dev/ubi0 --> /dev/ubi0_0 --> kernel blob
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0+-> /dev/ubi0_1 --> /
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0+-> /dev/ubi0_2 --> /usr/apps
>
> In the simplest case, you can just have one volume in your UBI partition:
>
> /dev/mtd2 --> /dev/ubi0 --> /dev/ubi0_0 --> /usr/apps

Thanks for the walktrhough. However, there are two things I don't like
here: I must use the r/w block layer ubi0, and I'm limited to one
specific (r/w !) FS - ubifs - on top of that.

> But yes, there are two devices, one representing a whole partition under =
UBI
> control, and the other one representing a volume. The underlying mtd devi=
ce
> also still exists. But it's not really stranger than having a classic har=
d
> drive, with e.g. /dev/sda as the 'base' device for the drive, and /dev/sd=
a1
> and /dev/sda2 for the partitions, while also having a /dev/sg1 for certai=
n
> operations.

I beg to differ :)
HDD device nodes and partition device nodes work much more like
MTDBLOCK and the MTD "partitioning" layer. Basically all they to is
mapping relative offsets (partition-based) to absolute offsets
(chip-based). The only obvious difference imho is that the HDD
partitioning driver does not hide the original device.

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
