Received: from cnshjsmin03.alcatel-sbell.com.cn ([211.144.215.47])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PVyFV-0001c0-Hs
	for linux-mtd@lists.infradead.org; Fri, 24 Dec 2010 03:23:22 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
Subject: RE: UBIFS reboots issue
Date: Fri, 24 Dec 2010 11:23:20 +0800
Message-ID: <EF949E0CEB6551499A3643069FE41ACB034B6DFC@CNSHGSMBS01.ad4.ad.alcatel.com>
In-Reply-To: <39A4B204C321D34DA3490E3B119D5A6C68BF77674A@SBS2008.wellsense.local>
References: <39A4B204C321D34DA3490E3B119D5A6C68BF77673F@SBS2008.wellsense.local><1293049245.2051.4.camel@koala>
	<39A4B204C321D34DA3490E3B119D5A6C68BF77674A@SBS2008.wellsense.local>
From: "ZHOU Zhongjun" <Zhongjun.Zhou@alcatel-sbell.com.cn>
To: "Boaz Ben-David" <boaz.bd@wellsense-tech.com>,
	<linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Why do you not to use YAFFS2 for NAND flash?  It seems that Yaffs2 is =
more popularity.


-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org =
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Boaz =
Ben-David
Sent: Thursday, December 23, 2010 8:52 PM
To: linux-mtd@lists.infradead.org
Subject: Re: UBIFS reboots issue

I am using kernel 2.6.31 for iMX35 and I'm not sure what version of =
UBIFS is patched in there.
What do I need to do in order to patch to the latest version?=20
Is is enough to clone UBIFS 2.6.31 and copy over the fs/ubifs and =
mtd/ubi directories or are there any other directories I need to take =
into account?

Thanks,

Boaz.

On Wed, 2010-12-22 at 22:20 +0200, Artem Bityutskiy wrote:
> On Wed, 2010-12-22 at 16:36 +0200, Boaz Ben-David wrote:
> > Hi all,
> >=20
> > We have an embedded system using a Samsung 2GB MLC NAND and are=20
> > using UBIFS as the file system on it.
> > I have a question regarding UBIFS and hard reboots.
> > After some work with the flash (doing reads and writes to it), some=20
> > times one of our partitions would fail to mount.
> > I suspected this has something to do with a reboot which happens=20
> > during a write to the flash.
> > In order to test this I created a simple script which copies a file=20
> > from to the partition, syncs, then deletes it and does this=20
> > repeatedly until a hard reboot occurs (using the watch dog to cause =
the boot).
> > This process repeats itself until the partition fails to mount.
> > When I performed the test mentioned above, after about 3-4 times the =

> > partition would fail.
> > I am not sure if this behaviour is normal or not.
> > Did someone encounter similiar behaviour?
>=20
> Just curious, did you see this:
>=20
> http://linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_mlc
>=20
> I do not think you can just use UBI/UBIFS on MLC as is, you'd need to=20
> make sure MLC-specific behavior is handled properly.
>=20
> --
> Best Regards,
> Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
>=20

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
