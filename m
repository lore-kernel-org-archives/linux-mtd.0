Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SRhLq-0008AX-MT
 for linux-mtd@lists.infradead.org; Tue, 08 May 2012 10:09:04 +0000
Received: by lbbgg6 with SMTP id gg6so5083312lbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 08 May 2012 03:09:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1205080853310.27120@lnxricardw.se.axis.com>
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
 <CADZ6=atoFf46+U9xTbDh-7AniuTBsuAo2MWKLyeAn4oFa=xSFQ@mail.gmail.com>
 <Pine.LNX.4.64.1205080853310.27120@lnxricardw.se.axis.com>
Date: Tue, 8 May 2012 12:08:59 +0200
Message-ID: <CADZ6=as6DeHBpnTmamzaMDR-b8OgqYx=ZFwBLTB5wpKSLZH0ZQ@mail.gmail.com>
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

>>> By putting a bunch of UBI volumes in one UBI partition you also get the
>>> benifit of having UBI manage bad blocks for you, and you can have one
>>> large
>>> pool of bad blocks rather than an individual pool of bad blocks for eac=
h
>>> mtd, which in the end translates to better usage of the flash.
>>>
>>> These things may or may not be important to you, depending on how much
>>> flash you have and how reliable it is.
>>
>>
>> The most important point for me is whether you use your flash, or a
>> specific partition of your flash, in read-only or read-write mode.
>> When operating in r/o mode I don't quite see a point in most of the
>> more advanced stuff UBI does, e.g. wear leveling.
>
>
> One could argue though that once you start using UBI for bit scrubbing, t=
hen
> wear levelling becomes an issue even on a r/o file system.

I do understand your argument and I can follow you with this - it's a
conclusion easily reached from the r/w point of view. That is, if you
consider r/o functionality a subset of r/w functionality, then it's
easy to re-use all the comfy functions from r/w that you already have
at your disposal.

However, from a read-only point of view even with scrubbing there's
still no absolute necessity for wear leveling. Since we do bad block
mapping anyways and since writes are very rare (bit scrubbing and
full-image writes) wearing off the blocks evenly is not a requirement.
If a block dies during image write, then it is mapped out and never
used again. If a block dies during bit scrub, one could map it, then
re-write all succeeding blocks. With a MTD only allowing for r/o
access even a robust implementation of scrubbing / block rewrite
should be easy to do. With r/w this would be madness.

Please keep in mind that re-write events (or even bit scrubbing)
should be extremely rare since, well, we're r/o. My argument here is
that when limiting oneself to r/o access a lot of these robustness
features can be provided in a much simpler way, allowing for code that
is both simple and easy to maintain. Also I can do this at a low level
(the MTD level) instead of a higher layer.

>> I do miss a very simple r/o layer, though. I think there is a strong
>> use case for read-only file systems; especially in the embedded world.
>> And all things necessary - bad-block handling, scrubbing -
>> can be abstracted well enough for a simple r/o block device at a very
>> low level.
>
>
> I'm not too sure. There is a r/o mode in UBI, so-called static volumes,
> which have a fixed size after creation or writing data to them, and have
> built-in checksums for validation. They are primarily intended for blobs
> such as a kernel, but can also be used for read/write file systems.

How would I put a squashfs into that and then mount it upon boot?

> My biggest gripe about adding another "simple" r/o layer is this: Since U=
BI
> is stable and maintained, it seems a bit pointless to dilute future
> development and maintenence efforts by introducing another layer which
> basically is a subset of UBI. For instance, future changes to the mtd API
> that affect the layers above will have to be maintained not just for UBI =
but
> for other mtd users as well. Sure, a parallel layer may be simpler, but w=
ith
> UBI already in place and working well, I'm not convinced it actually make=
s a
> practical difference in the end.

I do understand your skepticism. And you're right with the extra
maintenance effort required. I think we differ in opinion only
concerning the complexity of a read-only block access implementation
w/ bad block skipping and bit scrubbing. How about you take a look at
blockrom.c, and maybe at blockrom_scrub.c after I come up with this
(probably next week, or the week after that). Then we can decide about
the implementation's usability, its weaknesses, and most importantly,
its complexity (especially concerning maintainability).

You once wrote that flashes are actually not disks, and that some of
the specifics of flashes must be exposed to upper layers in order to
be handled adequately. From a r/w point of view I do follow your
argument completely. However, I think that a flash device allowing
only for r/o generic accesses can indeed be reasonably abstracted to
look exactly like a disk.

And I think it can be done with only few code, so it should be of low
complexity, easy to maintain, while still supporting a (imho) strong
use case (i.e. a generic r/o fs in a MTD block device).

> Especially if you are using UBI in your system anyway, but not necessaril=
y
> for you root file system, adding another parallel layer seems rather
> pointless. You've got UBI in your system anyway, why add something else t=
hat
> does the same thing just because UBI seems overly convoluted for readonly
> file systems. It does the job and does it well and doesn't cost anything
> since it's there anyway.

I want a simple (and guaranteed r/o) root fs so that if anybody
power-circles our devices at any point I'd still end up with a working
root fs. I can guarantee this behavior with MTD + blockrom because the
stack is simple enough to see through. I would not be able to
guarantee this with an UBI root fs which is inherently writable, even
if mounted read-only. Writes would happen because wear leveling, bit
scrubbing and all the other maintenance operations must account for a
r/w device. Way more complex, way more risky.

> If you are really pressed for space in the kernel (in terms of required
> space on the flash or the amount of RAM it consumes run time) I could
> understand that replacing the Big and Grand UBI with something smaller mi=
ght
> have some value.

It's not actually a small footprint requirement I'm trying to fulfill
but a low-complexity one for robustness reasons. But you're right,
another use case for the blockrom FTL would be if you're low on space.

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
