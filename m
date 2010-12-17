Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PTWgd-0002q1-I7
	for linux-mtd@lists.infradead.org; Fri, 17 Dec 2010 09:33:16 +0000
Date: Fri, 17 Dec 2010 10:33:12 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: Static UBI volumes and ubiupdatevol ?
In-Reply-To: <1292516353.2364.101.camel@localhost>
Message-ID: <Pine.LNX.4.64.1012170946190.7024@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1012150855090.6187@lnxricardw.se.axis.com>
	<1292516353.2364.101.camel@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: =?utf-8?B?UmljYXJkIFdhbmRlcmzDtmY=?= <ricardw@axis.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 16 Dec 2010, Artem Bityutskiy wrote:

> > Using 'static' UBI volumes seems to be the preferred way of creating re=
ad=20
> > only file systems.
>=20
> No, I think the _original_ idea behind static volumes was storing some
> important r/o blobs there without any FS. So UBI static volumes simplify
> this by making the volume size being =3D the contents size, even if the
> contents size is not multiple of LEB size, and static volumes also
> protect the data with CRC-32.

That's good news, because that's what exactly what I'd need.

> But UBIFS has its own CRC32 protection, so does not need UBI static
> volume services.
> [...]=20
> All eraseblocks are protected with CRC-32. Fist time the static volume
> is openend, it is checked. See the 'ubi_check_volume()' function. It is
> also checked after it has been updated.

The thing is, I'd like to be able to checksum, or otherwise verify, a=20
couple of read-only partitions on the flash _before_ attempting to boot=20
Linux. No point in trying to boot Linux if the kernel or the root file=20
system is not intact. So although it is nice that UBI verifies static=20
volumes during attach, and UBIFS during mount, it is really too late as I=
=20
need to do this in the boot loader.

Of course, extending the bootloader to be able to verify UBI volumes is=20
probably doable. I could then use cramfs, squashfs or similar for the root=
=20
file system, with gluebi, and use the static volume UBI CRC32 for=20
verification by the bootloader. Makeing the boot loader understand UBIFS I=
=20
think would be too much work.

>> With a system based on mtd+jffs2 it is actually possible to reflash the
>> partition with the [read only] root file system on it without unmounting=
,
>> as long as no accesses are made to the physical flash during the rewrite
>> or afterwards. In other words, immediately after reflashing the system
>> must be rebooted.
> The same with UBIFS - we never write when we are mounted R/O. There are
> many ubifs_assert()s to check this as well.

=2E.. but UBI might still do writes during the course of scrubbing I guess,=
=20
unless ...

> [ ... ] you need to make sure all the backgound stuff like moving and=20
> eraseing eraseblocs is done before doing this by doing fsync() on your=20
> /dev/ubiX_Y device (UBI volume character device), see the=20
> 'vol_cdev_fsync()' function. Ah, and of course you need to sync UBIFS=20
> before this.

That would be no problem, it is basically the same stuff we need to do=20
with JFFS2 before reflashing.

> >  so it is possible to use a=20
> > simple checksum to verify data integrity.
>=20
> You can do this with UBIFS I think, did not try though.

What I meant was 'a simple checksum on the raw mtd partition', which can't=
=20
work with UBIFS as the UBI erase counters etc can change over time as a=20
result of scrubbing.

I guess I could read from the /dev/ubix_y device to just get the raw UBIFS=
=20
data which shouldn't change even in the event of scrubbing? Or should I=20
use gluebi to get both a raw mtd partition corresponding to the raw UBIFS=
=20
data, as well as using UBIFS (on /dev/ubix_y) for the file system?

> The difference between JFFS2 and UBIFS is that JFFS2 cannot distinguish
> between nodes corrupted because of power cuts, and nodes corrupted
> because something bad happened to the flash. UBIFS does better job here
> - it recovers only from errors which could possibly be caused by power
> cuts, and it switches to R/O mode for other errors.
> [...]
> Just call sync(), then fsync on the UBI volume, and you won't have
> background processes if there is not I/O.
>
> Be beware, even reading from UBIFS can cause scrubbing in UBI.

That's very good. My basic problem though is still that I need to verify=20
the integrity before booting, although it is very nice that the file=20
system can detect errors during mount. With JFFS2 there's always a=20
nagging idea that errors will go undetected and we won't notice until a=20
file is missing or contains zeros.

I often get complaints from other developers in our company saying "can't=
=20
we suppress these 'jffs2 crc error' messages if they don't actually=20
indicate a failure. My answer is always a) We don't know if they indicate=
=20
a failure or not and b) Since mostly they are harmless, come back when you=
=20
have found that a file has disappeared from the file system or other file=
=20
problem. So far no one has come back with any complaints referring to b).

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
