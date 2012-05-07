Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SRReX-00012d-Dc
 for linux-mtd@lists.infradead.org; Mon, 07 May 2012 17:23:18 +0000
Received: by laap9 with SMTP id p9so1027548laa.36
 for <linux-mtd@lists.infradead.org>; Mon, 07 May 2012 10:23:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1205071145340.722@lnxricardw.se.axis.com>
References: <CADZ6=aumk74QxF3kjenFYqQUZ-OaPT8gmrN-xUGE6NPPyq87NQ@mail.gmail.com>
 <CADZ6=asURkKX6VB_UsmtcMnU5N8Xq_Lv7uRpkvYmQ3YBU7tvhQ@mail.gmail.com>
 <Pine.LNX.4.64.1205020933520.20592@lnxricardw.se.axis.com>
 <CADZ6=asdcCJOnPJfkV67wNHu2CX16NTzmN5z14nDhqGVvHdo4g@mail.gmail.com>
 <Pine.LNX.4.64.1205021047010.20592@lnxricardw.se.axis.com>
 <CADZ6=at5axiWkNF5CiqjqJmzsQdrKiVoPJh27ehy0fGsgLdSjw@mail.gmail.com>
 <0A40042D85E7C84DB443060EC44B3FD3351F9CADFB@dekaexchange07.deka.local>
 <CADZ6=atZPNM+1sXJngdkoWddHX0WzzPqyJPa4Fi2FuiOoaV9dg@mail.gmail.com>
 <Pine.LNX.4.64.1205041054400.27120@lnxricardw.se.axis.com>
 <CADZ6=as7Wz5TvGRbTa=6ydZMcBQHe2VRAPpxNy+3hFKApJEBzw@mail.gmail.com>
 <Pine.LNX.4.64.1205071145340.722@lnxricardw.se.axis.com>
Date: Mon, 7 May 2012 19:23:15 +0200
Message-ID: <CADZ6=atoFf46+U9xTbDh-7AniuTBsuAo2MWKLyeAn4oFa=xSFQ@mail.gmail.com>
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

Hello Ricard,

>> That's a bit much. What do I gain from a kernel in mtd/UBI instead of
>> putting it directly into a plain MTD?
>
> UBI performs bit scrubbing for you if you have a flash that requires it.
> Since the kernel is normally read by a bootloader however, you might have=
 to
> do the occasional read on the kernel when the Linux system is up and runn=
ing
> to trigger it. It still is much less work than "manually" scanning the mt=
d
> and rewritting blocks that seem to have bits flipping.

Agreed. I learned from this thread that scrubbing is almost a
necessity. I'm actually thinking about adding a very simple scrubbing
mechanism to blockrom. One could argue that another scrubbing
mechanism is redundant since UBI already does scrubbing. But then UBI
is r/w and there's a lot of things you don't have to care about if you
limit yourself to r/o access.

> By putting a bunch of UBI volumes in one UBI partition you also get the
> benifit of having UBI manage bad blocks for you, and you can have one lar=
ge
> pool of bad blocks rather than an individual pool of bad blocks for each
> mtd, which in the end translates to better usage of the flash.
>
> These things may or may not be important to you, depending on how much fl=
ash
> you have and how reliable it is.

The most important point for me is whether you use your flash, or a
specific partition of your flash, in read-only or read-write mode.
When operating in r/o mode I don't quite see a point in most of the
more advanced stuff UBI does, e.g. wear leveling.

>>> Technically I suppose one could device a "jffs2a" to run directly on a
>>> UBI
>>> device, but it would be rather pointless; we have a "jffs3" which turne=
d
>>> into ubifs in the end.
>>
>>
>> And I think you did some excellent work with the UBI/UBIFS stack. It's
>> the way to go when you need a flash-aware r/w fs. The drawback is that
>> handling and maintenance of UBI filesystems is still a bit "special"
>> (as in: things don't work like they do with other, more generic, file
>> systems). And one side effect of this "specialness" is that you're
>> currently seem to be limited to the MTD/UBI stack and can't use other
>> file systems on MTDs.
>
>
> The basic problem is that flash devices are not disks. "Normal" file syst=
ems
> are designed to work well with disk-based media. They are not intended to
> (and don't) work well with flash media. Flash Translation Layer solutions
> tend to be clumsy and/or unreliable, because you're basiclly trying to
> pretend a device of one type is really another type. So in the end, if yo=
u
> are using flash-based media you are going to need an fs which is designed
> for the job. I know that that might seem like the properties of the physi=
cal
> layer 'bleeding through' to the file system layer, but on the other hand,=
 if
> you want to look at it that way, it's the same problem with ordinary file
> systems which assume that the underlying meda is a disk with a read/write
> sector size in the kilobyte range, and no penalties for extraneous writes=
.

Ah, okay, I see, and I do completely follow you with this when it's
about r/w file systems. Sometimes it is better to expose specifics of
a lower level if it is only badly abstracted, or, to put it in simpler
words, if you cannot gracefully degrade, then you should escalate.

I do miss a very simple r/o layer, though. I think there is a strong
use case for read-only file systems; especially in the embedded world.
And all things necessary - bad-block handling, scrubbing -
 can be abstracted well enough for a simple r/o block device at a very
low level.

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
