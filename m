Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KWDvg-0000lH-5b
	for linux-mtd@lists.infradead.org; Thu, 21 Aug 2008 17:26:37 +0000
Subject: Re: ubifs mount size
From: Artem Bityutskiy <dedekind@infradead.org>
To: dfoley <dfoley@telus.net>, Bruce_Leonard@selinc.com
In-Reply-To: <g85ka8$cpi$1@ger.gmane.org>
References: <g85ka8$cpi$1@ger.gmane.org>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 Aug 2008 20:24:35 +0300
Message-Id: <1219339475.18027.87.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello dfoley, Bruce,

On Fri, 2008-08-15 at 21:16 -0700, dfoley wrote:
> Does this look right (info below) ?
> I create a 55MiB volume, but df only shows 33968KiB
> This is linux-2.6.24.4. I've also used linux-2.6.27-rc3.
>=20
>=20
> root@tsi-sa2410:~# ubimkvol /dev/ubi1 -N root -s 55MiB
> Volume ID 0, size 3755 LEBs (57676800 bytes, 55.0 MiB), LEB size 15360=20
> bytes (15.0 KiB), dynamic, name "root", alignment 1
> root@tsi-sa2410:~# mount -t ubifs ubi1:root /mnt/linux2-root/
> UBIFS: default file-system created
> UBIFS: background thread "ubifs_bgt1_0" started, PID 930
> UBIFS: mounted UBI device 1, volume 0, name "root"
> UBIFS: file system size: 57292800 bytes (55950 KiB, 54 MiB, 3730 LEBs)
> UBIFS: journal size: 2872320 bytes (2805 KiB, 2 MiB, 187 LEBs)
> UBIFS: default compressor: LZO
> UBIFS: media format 4, latest format 4
> root@tsi-sa2410:~# df
> Filesystem           1k-blocks      Used Available Use% Mounted on
> rootfs                    8059      5284      2366  69% /
> /dev/root                 8059      5284      2366  69% /
> /dev/root                 8059      5284      2366  69% /dev/.static/dev
> ubi1:root                33968         0     31204   0% /mnt/linux2-root

I've explored this a little. Currently UBIFS indeed reports 15%-20% less
free space than it actually has, and we'll try to fix this.

However, even if we fix this, it'll still report less free space than it
has. I have started writing about this here:
http://www.linux-mtd.infradead.org/doc/ubifs.html

I did not finish my writing yet, and I did not actually write the stuff
which is mostly relevant for your situation. But I wrote other
df-related stuff which UBIFS users should probably know about.

One thing I may say about your setup is that you have small eraseblock
size (16KiB) which leads to large mistakes in calculations because the
maximum amount of wasted space at the end of eraseblock is large in your
case.

On Mon, 2008-08-18 at 16:32 -0700, Bruce_Leonard@selinc.com wrote:
> Oh good. I finally have my 8GiB problem solved (patch forthcoming in
> the=20
> next 24 hours probably), but df -h was only showing 6.8GiB and I
> couldn't=20
> account for the descrpancy. I'm looking forward to being able to do
> that.

Similarly, we will try to make improve the free space reporting, but
it'll lie anyway, but less.

> Thanks for all the hard work on UBI/UBIFS Artem. It's working like a=20
> champ so far. I'm planning on setting LTP up to run for a couple of
> weeks=20
> to really stress it out and I'll let you know how that goes.

Thank you. But I was not the only person working on UBIFS. Adrian
implemented bigger part of it than me.

Stress tests are appreciated and posting the results here is welcomed.

> FYI, it takes about 45 seconds for the UBI module to load for an 8GiB=20
> device when I do it by hand. I think things were a bit faster when UBI
> is=20
> built into the kernel. Once I get that working again I'll update you.

Yeah, bad. One straight way to make it twice as fast is to merge 128KiB
physical eraseblocks to 265KiB ones. Then UBI would read twice as less.
And I wouldn't be surprised if UBIFS would become faster.

I mean, you could hack your NAND driver and teach it to join 2 physical
eraseblocks into one, and make all upper layers think you have 256KiB
eraseblocks. Things would become tricky for bad blocks, and you
effectively would treat good PEBs as bad if their pair is bad. But is
probably is not so bad, comparing to twice as faster UBI attach time.
And you would win the space you wasted because of bad blocks by wasting
less space in both UBI and UBIFS.


--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
