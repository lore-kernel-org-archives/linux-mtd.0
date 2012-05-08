Received: from anubis.se.axis.com ([195.60.68.12])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SReWJ-0001py-1P
 for linux-mtd@lists.infradead.org; Tue, 08 May 2012 07:07:40 +0000
Date: Tue, 8 May 2012 09:07:29 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Thilo Fromm <fromm@dresearch-fe.de>
Subject: Re: State of read-only filesystems in NAND / MTD bad blocks handling
 when reading
In-Reply-To: <CADZ6=atoFf46+U9xTbDh-7AniuTBsuAo2MWKLyeAn4oFa=xSFQ@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1205080853310.27120@lnxricardw.se.axis.com>
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


On Mon, 7 May 2012, Thilo Fromm wrote:

> Agreed. I learned from this thread that scrubbing is almost a
> necessity. I'm actually thinking about adding a very simple scrubbing
> mechanism to blockrom. One could argue that another scrubbing
> mechanism is redundant since UBI already does scrubbing. But then UBI
> is r/w and there's a lot of things you don't have to care about if you
> limit yourself to r/o access.


>> By putting a bunch of UBI volumes in one UBI partition you also get the
>> benifit of having UBI manage bad blocks for you, and you can have one la=
rge
>> pool of bad blocks rather than an individual pool of bad blocks for each
>> mtd, which in the end translates to better usage of the flash.
>>
>> These things may or may not be important to you, depending on how much f=
lash
>> you have and how reliable it is.
>
> The most important point for me is whether you use your flash, or a
> specific partition of your flash, in read-only or read-write mode.
> When operating in r/o mode I don't quite see a point in most of the
> more advanced stuff UBI does, e.g. wear leveling.

One could argue though that once you start using UBI for bit scrubbing,=20
then wear levelling becomes an issue even on a r/o file system.

> I do miss a very simple r/o layer, though. I think there is a strong
> use case for read-only file systems; especially in the embedded world.
> And all things necessary - bad-block handling, scrubbing -
> can be abstracted well enough for a simple r/o block device at a very
> low level.

I'm not too sure. There is a r/o mode in UBI, so-called static volumes,=20
which have a fixed size after creation or writing data to them, and have=20
built-in checksums for validation. They are primarily intended for blobs=20
such as a kernel, but can also be used for read/write file systems.

My biggest gripe about adding another "simple" r/o layer is this: Since=20
UBI is stable and maintained, it seems a bit pointless to dilute future=20
development and maintenence efforts by introducing another layer which=20
basically is a subset of UBI. For instance, future changes to the=20
mtd API that affect the layers above will have to be maintained not just=20
for UBI but for other mtd users as well. Sure, a parallel layer may be=20
simpler, but with UBI already in place and working well, I'm not convinced=
=20
it actually makes a practical difference in the end.

Especially if you are using UBI in your system anyway, but not necessarily=
=20
for you root file system, adding another parallel layer seems rather=20
pointless. You've got UBI in your system anyway, why add something else=20
that does the same thing just because UBI seems overly convoluted for=20
readonly file systems. It does the job and does it well and doesn't cost=20
anything since it's there anyway.

If you are really pressed for space in the kernel (in terms of required=20
space on the flash or the amount of RAM it consumes run time) I could=20
understand that replacing the Big and Grand UBI with something smaller=20
might have some value.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
