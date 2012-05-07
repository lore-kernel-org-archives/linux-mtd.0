Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SRKeb-00080c-SX
 for linux-mtd@lists.infradead.org; Mon, 07 May 2012 09:54:54 +0000
Date: Mon, 7 May 2012 11:54:48 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Thilo Fromm <fromm@dresearch-fe.de>
Subject: Re: State of read-only filesystems in NAND / MTD bad blocks handling
 when reading
In-Reply-To: <CADZ6=as7Wz5TvGRbTa=6ydZMcBQHe2VRAPpxNy+3hFKApJEBzw@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1205071145340.722@lnxricardw.se.axis.com>
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
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
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


On Mon, 7 May 2012, Thilo Fromm wrote:

>>> But unfortunately I can use these features with nothing else than UBIFS=
?
>>
>> Well, you can use it for large binary objects, such as the Linux kernel,=
 if
>> you want. There are currently no other filesystems other than ubifs whic=
h
>> run directly on top of UBI, but if you enable the gluebi layer, you get =
mtd
>> devices on top of each ubi volume so you can use jffs2 if you want.
>
> That's a bit much. What do I gain from a kernel in mtd/UBI instead of
> putting it directly into a plain MTD?

UBI performs bit scrubbing for you if you have a flash that requires it.=20
Since the kernel is normally read by a bootloader however, you might have=
=20
to do the occasional read on the kernel when the Linux system is up and=20
running to trigger it. It still is much less work than "manually" scanning=
=20
the mtd and rewritting blocks that seem to have bits flipping.

By putting a bunch of UBI volumes in one UBI partition you also get the=20
benifit of having UBI manage bad blocks for you, and you can have one=20
large pool of bad blocks rather than an individual pool of bad blocks for=
=20
each mtd, which in the end translates to better usage of the flash.

These things may or may not be important to you, depending on how much=20
flash you have and how reliable it is.

>> Technically I suppose one could device a "jffs2a" to run directly on a U=
BI
>> device, but it would be rather pointless; we have a "jffs3" which turned
>> into ubifs in the end.
>
> And I think you did some excellent work with the UBI/UBIFS stack. It's
> the way to go when you need a flash-aware r/w fs. The drawback is that
> handling and maintenance of UBI filesystems is still a bit "special"
> (as in: things don't work like they do with other, more generic, file
> systems). And one side effect of this "specialness" is that you're
> currently seem to be limited to the MTD/UBI stack and can't use other
> file systems on MTDs.

The basic problem is that flash devices are not disks. "Normal" file=20
systems are designed to work well with disk-based media. They are not=20
intended to (and don't) work well with flash media. Flash Translation=20
Layer solutions tend to be clumsy and/or unreliable, because you're=20
basiclly trying to pretend a device of one type is really another type. So=
=20
in the end, if you are using flash-based media you are going to need an fs=
=20
which is designed for the job. I know that that might seem like the=20
properties of the physical layer 'bleeding through' to the file system=20
layer, but on the other hand, if you want to look at it that way, it's the=
=20
same problem with ordinary file systems which assume that the underlying=20
meda is a disk with a read/write sector size in the kilobyte range, and no=
=20
penalties for extraneous writes.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
