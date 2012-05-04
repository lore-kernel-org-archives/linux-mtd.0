Received: from anubis.se.axis.com ([195.60.68.12])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SQEWW-000096-Cd
 for linux-mtd@lists.infradead.org; Fri, 04 May 2012 09:10:01 +0000
Date: Fri, 4 May 2012 11:09:54 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Thilo Fromm <fromm@dresearch-fe.de>
Subject: Re: State of read-only filesystems in NAND / MTD bad blocks handling
 when reading
In-Reply-To: <CADZ6=atZPNM+1sXJngdkoWddHX0WzzPqyJPa4Fi2FuiOoaV9dg@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1205041054400.27120@lnxricardw.se.axis.com>
References: <CADZ6=aumk74QxF3kjenFYqQUZ-OaPT8gmrN-xUGE6NPPyq87NQ@mail.gmail.com>
 <CADZ6=asURkKX6VB_UsmtcMnU5N8Xq_Lv7uRpkvYmQ3YBU7tvhQ@mail.gmail.com>
 <Pine.LNX.4.64.1205020933520.20592@lnxricardw.se.axis.com>
 <CADZ6=asdcCJOnPJfkV67wNHu2CX16NTzmN5z14nDhqGVvHdo4g@mail.gmail.com>
 <Pine.LNX.4.64.1205021047010.20592@lnxricardw.se.axis.com>
 <CADZ6=at5axiWkNF5CiqjqJmzsQdrKiVoPJh27ehy0fGsgLdSjw@mail.gmail.com>
 <0A40042D85E7C84DB443060EC44B3FD3351F9CADFB@dekaexchange07.deka.local>
 <CADZ6=atZPNM+1sXJngdkoWddHX0WzzPqyJPa4Fi2FuiOoaV9dg@mail.gmail.com>
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


On Fri, 4 May 2012, Thilo Fromm wrote:

>> =A0It contains a maximum of m-fudge_factor LEBs (Logical Erase Blocks)
>> =A0of n-ovehead pages each. It can erase whole LEBs, write pages, and
>> =A0read pages. By providing bad block mapping and wear leveling, it
>> =A0provides a device which is slightly smaller than the MTD device
>> =A0it's layered upon, but that device doesn't have bad blocks and
>> =A0you can't wear out any individual LEB faster than the whole
>> =A0device wears out. The device remains perfect until its reserve
>> =A0of replacement (spare) blocks is exhausted as blocks go bad.
>
> But unfortunately I can use these features with nothing else than UBIFS?

Well, you can use it for large binary objects, such as the Linux kernel,=20
if you want. There are currently no other filesystems other than ubifs=20
which run directly on top of UBI, but if you enable the gluebi layer, you=
=20
get mtd devices on top of each ubi volume so you can use jffs2 if you=20
want.

Gluebi is in many cases not really an option, because it maps _each_ ubi=20
volume to an mtd device, thus you cannot for instance mix jffs2 and ubifs=
=20
on a gluebi system. AFAIU it would be possible to extend gluebi so that it=
=20
would be possible to enable the gluebi layer only for selected ubi=20
volumes, but AFAIK it has not been done (yet).

Technically I suppose one could device a "jffs2a" to run directly on a UBI=
=20
device, but it would be rather pointless; we have a "jffs3" which turned=20
into ubifs in the end.

While jffs2 is tried-and-tested there is very little development and=20
maintenence going on nowadays, with development and bug fixing instead=20
going into ubifs. So over time, jffs2 will probably tend to degrade while=
=20
ubifs will continue to improve.

>> =A0UBIfs (on top of UBI on top of MTD) "materializes" a file system.
>> =A0It contains ordinary Linux/Unix files on a perfect storage medium.
>> =A0It depends upon the perfect storage provided by UBI.
>
> I have the impression that we took a shortcut between the last two
> paragraphs. Can you please elaborate on why i need a second UBI
> partition within an UBI partition in order to use UBIFS? Or am I wrong
> with this point?

I think you've misunderstood something.

Basically, if you have an mtd partition, say mtd2, then you can attach UBI=
=20
to it (or is the terminology 'attach an mtd partition to UBI'; I'm not=20
sure):

# ubiattach -m 5 /dev/ubi_ctrl

/dev/mtd2 --> /dev/ubi0

Within each UBI partition, you can then have several volumes, e.g.:

# ubimkvol /dev/ubi0 -N kernel -s 3 MiB -t static
# ubimkvol /dev/ubi0 -N rootfs -s 25 MiB -t static
# ubimkvol /dev/ubi0 -N appdata -s 55 MiB -t dynamic

/dev/mtd2 --> /dev/ubi0 --> /dev/ubi0_0
                         +-> /dev/ubi0_1
                         +-> /dev/ubi0_2

In each volume you can have a file system, i.e. ubifs, which can be=20
mounted:

# mount -t ubifs ubi0:appdata /usr/apps

/dev/mtd2 --> /dev/ubi0 --> /dev/ubi0_0 --> kernel blob
                         +-> /dev/ubi0_1 --> /
                         +-> /dev/ubi0_2 --> /usr/apps

In the simplest case, you can just have one volume in your UBI partition:

/dev/mtd2 --> /dev/ubi0 --> /dev/ubi0_0 --> /usr/apps

But yes, there are two devices, one representing a whole partition under=20
UBI control, and the other one representing a volume. The underlying mtd=20
device also still exists. But it's not really stranger than having a=20
classic hard drive, with e.g. /dev/sda as the 'base' device for the drive,=
=20
and /dev/sda1 and /dev/sda2 for the partitions, while also having a=20
/dev/sg1 for certain operations.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
