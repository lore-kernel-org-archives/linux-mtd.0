Received: from rproxy.gmail.com ([64.233.170.200])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DVk1t-0000MC-Ls
	for linux-mtd@lists.infradead.org; Wed, 11 May 2005 01:45:10 -0400
Received: by rproxy.gmail.com with SMTP id y7so57284rne
	for <linux-mtd@lists.infradead.org>;
	Tue, 10 May 2005 22:45:13 -0700 (PDT)
Message-ID: <f6d0cd0605051022453616327@mail.gmail.com>
Date: Wed, 11 May 2005 11:15:13 +0530
From: Niraj Maheshwari <niraj.maheshwari@gmail.com>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
In-Reply-To: <4280D2B6.20501@inf.u-szeged.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <f6d0cd0605051004524bab895b@mail.gmail.com>
	<4280D2B6.20501@inf.u-szeged.hu>
Cc: linux-mtd@lists.infradead.org
Subject: Re: SUMMARY patch for JFFS2
Reply-To: Niraj Maheshwari <niraj.maheshwari@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/10/05, Ferenc Havasi <havasi@inf.u-szeged.hu> wrote:
> Hi Niraj,
>=20
> > It gets mounted..and then i completely full this partition ( 5.5 MB)
> > with data... then i  remove few of the files from this partition..then
> > i do a sync.
> > In the next reboot, i get to see lot of error while mounting this parit=
ion.
>=20
> Can you send some more information about your flash chip? (erase block
> size, ...)


Flash chip is Intel W18 NOR Flash and erase block size is 0x10000,
Flash Size=3D16MB.

=20
> If you also can send us JFFS2 image before it goes wrong and after that
> also would be very big help for us to investigate what the problem is.

I didn't understand..what do you mean by JFFS2 image. As i told in the
earlier mail that we are not flashing the JFFS2 image in the Flash.

Process is explained below.

1. Erase the JFFS2 partition ( 5.5 MB ) of the Flash by using some tool.=20
2. Now boot the kernel in which JFFS2 Summary support is enabled.
3. After booting mount the JFFS2 parition from the flash in SDRAM.
    mount -t jffs2 /dev/mtdblock0 tmp/
4. Try to copy 6 MB of data in the tmp/ directory. As space available is 5.=
5MB,
    it will give Disk  Space Full error..and comes out.
5. "df" command shows 100% full on the mounted parition.
6. Remove few files to make it 80% in the mounted partition.
7. Run "sync" command.
8. Unmount the partition.
9. Reboot the system, then again mount it. You will get lot of errors.
   "Magic bitmask 0x1985 not found at 0x4f0018: 0x00b0 instead"
10. It does mount the partition but files/directories which i removed
in step-6, are
    still there.

Pl. note if i just disable the Summary Option in the Kernel,
everything work smoothly. I have thoroughly tested without Summary
Option.

Let me know if you need further information on this. I just want to
repeat again that the same behaviour is seen in latest MTD code as
well for JFFS3 with Summary Option. Without Summary options, JFFS3
also works fine on the same flash.

Thanks
Niraj
 =20

=20
> Thanks,
> Ferenc
>
