Received: from sky.skycomputers.com ([198.4.246.2])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BQmjo-00042M-SS
	for linux-mtd@lists.infradead.org; Thu, 20 May 2004 13:33:29 +0100
From: Brian Waite <waite@skycomputers.com>
To: munro.biswal@smartbridges.com, linux-mtd@lists.infradead.org
Date: Thu, 20 May 2004 08:33:05 -0400
References: <40AC99E1.40904@smartbridges.com>
In-Reply-To: <40AC99E1.40904@smartbridges.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Message-Id: <200405200833.05829.waite@skycomputers.com>
Subject: Re: Read only jffs2 filesystem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I think the default mount options are ro for mtd. To change this, , you can=
 do=20
2 things:

1) On the Linux cmdline root=3D/dev/mtdblockN rw
2) From the prompt/init scripts:  mount -oremount,rw -t jffs2 /dev/mtdblock=
N /

Or you may have set the partitions to be read only oin the MTD map you=20
created. (Check the mask_flags)=20

=46inally, depending on your FLASH chips, the chips may always powerup in t=
he=20
Locked state, mine do, and you will need to unlock them before writing. I d=
o=20
thins under u-boot but iy could also be done with the unlock mtd command.

Those are my suggestions.

Thanks
Brian


On Thursday 20 May 2004 07:43 am, Munro Biswal wrote:
> Iam using a 6 MTD partition structure wherein i have two jffs2
>     filesystems and when i boot up, it  mounts the filesystem as
>     readonly.Even if i reboot my board, i get the root filesystem to be
>     mounted readonly.
>     I cannot write anything to the filesystem
>     What could be the problem??
>
>
> Thanks in advance!
> Regards,
> Munro.
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQFArKWBmxLCz0u+Ko8RAkvjAKCltIjy5NZBFoe4/VsYrD46TuxQbgCfbYIX
yr3/q4S8Juq4vFXF6HOr7Co=3D
=3D2hU/
=2D----END PGP SIGNATURE-----
