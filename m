Received: from mail.2d3d.co.za ([196.14.185.200])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15FYZg-0000Hw-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Jun 2001 10:59:02 +0100
Date: Thu, 28 Jun 2001 12:05:19 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: Alexandr Andreev <andreev@niisi.msk.ru>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: Making partitions questions.
Message-ID: <20010628120519.B6265@crystal.2d3d.co.za>
References: <3B3B5128.7040006@niisi.msk.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xXmbgvnjoT4axfJE"
Content-Disposition: inline
In-Reply-To: <3B3B5128.7040006@niisi.msk.ru>; from andreev@niisi.msk.ru on Thu, Jun 28, 2001 at 11:45:44 -0400
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

--xXmbgvnjoT4axfJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alexandr!

> 1. I read mtd-jffs-HOWTO, and found that can't launch fdisk and create
> partitions on my flash dynamically. It have to be created and compiled in=
 a
> lowlevel driver. What is the reason? Is anybody working at it?

The reason why this have to be done is that the mtd partition driver needs
to know the partition information before it can register those partitions as
devices (it basically just goes and setup MTD structures for each partition
and register them the normal way).

In order to actually make a userland utility you'd have to implement a
system call to actually send the info to the partition driver which will
have to reregister the devices. Not all that difficult, but I don't think
anybody is working on it right now.

> 2. I wish to have several partitions on my flash. Can i have partitions=
=20
> with
> different filesystems on it? I mean one partition with FTL & ext2 and oth=
er
> with JFFS2 for example.

Yes. As long as you compile your kernel with MTD block device support it,
you can put anything on those block devices. I wouldn't use ext2 on flash
tho since it's not optimised for flash - jffs2 is definitely your best bet.

--=20

Regards
 Abraham

Today is National Existential Ennui Awareness Day.

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--xXmbgvnjoT4axfJE
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7OwFezNXhP0RCUqMRAkt+AJ4q4C3/Iq9/K3HVW2+ur2adwyUoAQCeMLxO
8M8f2+LscF3MPIbdLxWXi80=
=fNse
-----END PGP SIGNATURE-----

--xXmbgvnjoT4axfJE--
