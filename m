Received: from ns2.discountwebhost.com ([64.170.22.131] helo=ns1.discountwebhost.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17bnGP-0004DW-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Aug 2002 20:11:33 +0100
Message-Id: <5.1.0.14.0.20020805140501.00af1850@ns.webzsite.com>
Date: Mon, 05 Aug 2002 14:10:24 -0500
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
From: Vipin Malik <vipin@embeddedlinuxworks.com>
Subject: Re: MTD Partition problems
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20020803235032.GA8021@wohnheim.fh-wedel.de>
References: <5.1.0.14.0.20020803112646.00ace9d8@64.170.22.132>
 <5.1.0.14.0.20020803074026.02927a48@64.170.22.132>
 <AB8D0DF31D9BD511BE94000347959DC901996389@MXSFRCOHOU01>
 <AB8D0DF31D9BD511BE94000347959DC901996389@MXSFRCOHOU01>
 <5.1.0.14.0.20020803074026.02927a48@64.170.22.132>
 <5.1.0.14.0.20020803112646.00ace9d8@64.170.22.132>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> > Additionally, (say) /dev/mtdblock2 will really provide a handle to
> > /dev/mtd4 the writable third partition on the partitioned flash chip,=
 thus
> > mounting the JFFS2 fs on the partition originally intended (the third
> > partition).
>
>Almost. /dev/mtd4 should be minor number 8. If you check
>/usr/src/linux/Documentation/devices.txt, you will read the following:
>                   0 =3D /dev/mtd0         First MTD (rw)
>                   1 =3D /dev/mtdr0        First MTD (ro)
>Thus mtd0 has minor 0, mtd1 has minor 2, ...
>
>Also, the third partition is /dev/mtd3, as /dev/mtd0 is the real
>device. Look at the minor numbers for /dev/hda*, just the same.
>
>But what you *meant* is correct.
>
> > Unfortunately, my tests indicate that this is not happening. I know that
> > /dev/mtdblock2 (the intended third partition) is formatted. However=
 JFFS2
> > finds data here and refuses to mount on it. I think it is really being
> > passes a handle to and accesses /dev/mtd2, which is the wrong partition.
>
>See above.


Well, I think there is still a problem somewhere. Regardless of which=20
/dev/mtd<n> device is the actual physical partition (that was a good=20
academic discussion), JFFS2 never gets passed the /dev/mtd<n> device by me-=
=20
only the /dev/mtdblock<n> device.

I can do a 'less -f /dev/mtdblock2' and see that's the partition that I=20
want to mount JFFS2 on (it's all formatted correctly). However, a 'mount -t=
=20
jffs2 /dev/mtdblock2 /mnt/flash' fails as JFFS2 sees a bunch of data to=20
whichever mtd device handle its been passed (by mtdblock2) and refuses to=20
mount as it cannot find any valid JFFS2 nodes there.

Vipin



> > /dev/mtdblock[4,5] do not exist, even though /dev/mtd[4,5] do and=20
> /dev/mtd4
> > is the correct partition that I want!
>
>See above.
>
> > Argh! I'll try your patches if you like.
>
>I would be happy if you did. But you don't need my patches, unless you
>have more than one device that you want to partition. With the two
>thinkos out of the way, you should be doing fine. :)
>
>J=F6rn
>
>--
>Mundie uses a textbook tactic of manipulation: start with some
>reasonable talk, and lead the audience to an unreasonable conclusion.
>-- Bruce Perens
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
