Received: from nwd2mime2.analog.com ([137.71.25.114])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Kiql-0006Xs-00
	for <linux-mtd@lists.infradead.org>; Wed, 19 Jun 2002 18:02:31 +0100
Message-ID: <3D10B918.AF04267F@analog.com>
Date: Wed, 19 Jun 2002 10:02:16 -0700
From: Justin Wojdacki <justin.wojdacki@analog.com>
Reply-To: justin.wojdacki@analog.com
MIME-Version: 1.0
To: =?iso-8859-1?Q?=C1=BA=B2=A8?= <nielsen@eyou.com>
CC: david@forcedpotato.com, linux-mtd@lists.infradead.org
Subject: Re: boot from jffs
References: <20020619102527.64195.qmail@eyou.com>
Content-Type: text/plain; charset=iso-8859-1
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

"=C1=BA=B2=A8" wrote:
>=20
> Hi,everybody
> I would like to use mkfs.jffs to create a flash image I can burn into f=
lash.
>=20
> but the question is I don't know how to boot from this image.
>=20
> the kernel of our system is 2.4.18 and the platform is ppc 8xx_io
> series(ppc823)
>=20
> How to setup jffs/mtd as the root filesystem/dev for our system?
>=20
> Thanks,
>=20
>    -- nielsen
>=20

Is your kernel in the filesystem? If it is, then your bootloader needs
to be able to load the kernel into memory from the filesystem. It's
not that hard to do. Easiest thing to do is the following:

1. Hardcode path to kernel. Let's use "/boot/vmlinuz" in this example.
2. Find the jffs2_raw_dirent for the "/boot" directory and record it's
inode number
3. Find the jffs2_raw_dirent for "vmlinuz" that has parent inode =3D=3D
"/boot"'s inode and record it's inode number
4. Process all the jffs2_raw_inode's that have the same above's inode
number
5. Jump to kernel entry point

Also, how are you partitioning your flash? You'll probably want to
setup an MTD map for the flash (drivers/mtd/maps), and as part of the
init function, you use MKDEV() to specify the root paritition.=20

--=20
-------------------------------------------------
Justin Wojdacki       =20
justin.wojdacki@analog.com         (408) 350-5032
Communications Processors Group -- Analog Devices
