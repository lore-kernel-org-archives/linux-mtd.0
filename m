Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SPVN2-0002S3-4C
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 08:57:12 +0000
Date: Wed, 2 May 2012 10:57:07 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Thilo Fromm <fromm@dresearch-fe.de>
Subject: Re: State of read-only filesystems in NAND / MTD bad blocks handling
 when reading
In-Reply-To: <CADZ6=asdcCJOnPJfkV67wNHu2CX16NTzmN5z14nDhqGVvHdo4g@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1205021047010.20592@lnxricardw.se.axis.com>
References: <CADZ6=aumk74QxF3kjenFYqQUZ-OaPT8gmrN-xUGE6NPPyq87NQ@mail.gmail.com>
 <CADZ6=asURkKX6VB_UsmtcMnU5N8Xq_Lv7uRpkvYmQ3YBU7tvhQ@mail.gmail.com>
 <Pine.LNX.4.64.1205020933520.20592@lnxricardw.se.axis.com>
 <CADZ6=asdcCJOnPJfkV67wNHu2CX16NTzmN5z14nDhqGVvHdo4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 2 May 2012, Thilo Fromm wrote:

>> One way is to use a file system intended for flashes, but mount it
>> read-only. I.e. use a jffs2 filesystem, mounted readonly.
>
> Yupp, or I coud hack up SquashFS to be bad blocks aware. However, it
> feels kind of wrong to me to leave bad block handling to the file
> system layer. Because I would have to provide bad block awareness to
> every read-only FS I am planning to use. Over and over again.

I principally agree, however, jffs2 is doing just that, managing bad=20
blocks. Whether that is a good idea or not is debatable of course.=20
Technically it mixes up file system and device properties. Also, you might=
=20
not plan to change read-only FS's very often so the effort might be quite=
=20
minimal in practice.

>> Or, let UBI handle the flash, and use ubifs in a static volume, which me=
ans
>> it will be non-writable. Last time I checked it wasn't possible to use f=
ile
>> systems such as cramfs on UBI, because UBI did not supply a block device
>> which is required by cramfs. I seem to remember some patch to add block
>> devices to UBI, not sure what the state of that is.
>
> I think a simpler option would be to have your (read-only squash-)root
> FS image in a static UBI volume and mount it via loop-back. This is
> currently our fallback option. Still this feels like way too much
> overhead for what we're looking for.

Interting, it never occurred to me that that was possible. I always think=
=20
of loopback mounts for mounting things like files as cdrom drives. How do=
=20
you specify a loopback mount for the rootfs on the kernel command line?

> It's rather easy for both boot loader and Linux to write to a raw
> flash device, skipping bad blocks along the way. It's also easy for
> the boot loader to read back what was written, also skipping bad
> blocks. Finally, using an user space tool like "nanddump", I can read
> back what *really* has been written without a problem.
>
> Unfortunately it seems to be impossible to provide this read behavior
> via an MTD API to other parts of the linux kernel. All the workarounds
> seem such a waste, and this bad block-free read-only API seems such a
> good idea for a lot of things I'm really curious why the work on
> something as cool as MTD_BLOCK_RO_BBFREE  ceased in 2006.

I don't know for sure, but I think the majority of flash subsystem effort=
=20
has been centered around UBI and ubifs; for instance, there is very little=
=20
(if any) development on jffs2 nowadays, with all the effort going into=20
ubifs (and yaffs, different mailing list). One of the main points of UBI=20
is to handle bad blocks, consequently with UBI in the mainstream kernel=20
for a while now, most other efforts have a limited appeal.

Linutronix have made a small UBI library for reading static UBI volumes=20
which is suitable for boot loaders, so that one can have the kernel=20
residing in a UBI volume and get all the benefits of bad block management=
=20
etc even at that level.

> Since I really like the idea of a MTD block device that skips bad
> blocks when reading I'm currently in the process of re-animating the
> BBFREE patch <http://lists.infradead.org/pipermail/linux-mtd/2006-Novembe=
r/016835.html>:
> it compiles for me, but still has some major issues. I'll keep this
> list up to date on my progress.

All pathes would be welcome; I'm sure there are others who would find such=
=20
an approach beneficial, even if I think UBI is probably the way to go=20
these days.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
