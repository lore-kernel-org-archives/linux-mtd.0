Received: from mail.2d3d.co.za ([196.14.185.200] helo=crystal.2d3d.co.za)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 159MAr-0005N3-00
	for <linux-mtd@lists.infradead.org>; Mon, 11 Jun 2001 08:31:45 +0100
Date: Mon, 11 Jun 2001 09:37:11 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: =?iso-8859-1?Q?K=E1ri_Dav=ED=F0sson?= <kd@flaga.is>
Cc: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: partitioning bug
Message-ID: <20010611093711.A23639@crystal.2d3d.co.za>
References: <EADB10BAC266A14A85ECBF8686A73E310A9191@kolkrabbi.flaga.is>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline
In-Reply-To: <EADB10BAC266A14A85ECBF8686A73E310A9191@kolkrabbi.flaga.is>; from kd@flaga.is on Sun, Jun 10, 2001 at 13:19:21 -0000
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

--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi K=E1ri!

> Are you using virtual regions?

virtual regions?

> How are your partitions defined?

------------< snip <------< snip <------< snip <------------
#ifdef HAVE_PARTITIONS
static struct mtd_partition lart_partitions[] =3D
{
   /* blob */
   {
           name: "blob",
         offset: BLOB_START,
           size: BLOB_LEN,
     mask_flags: 0
   },
   /* kernel */
   {
           name: "kernel",
         offset: KERNEL_START,          /* MTDPART_OFS_APPEND */
           size: KERNEL_LEN,
     mask_flags: 0
   },
   /* initial ramdisk */
   {
           name: "initial ramdisk",
         offset: INITRD_START,          /* MTDPART_OFS_APPEND */
           size: INITRD_LEN,            /* MTDPART_SIZ_FULL */
     mask_flags: 0
   }
};
#endif
------------< snip <------< snip <------< snip <------------

--=20

Regards
 Abraham

The most exciting phrase to hear in science, the one that heralds new
discoveries, is not "Eureka!" (I found it!) but "That's funny ..."
		-- Isaac Asimov

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7JHUmzNXhP0RCUqMRAiBxAJ9eAvaqfqa1oEqIhia7g8w6r495BgCfZTLm
q+ubGwHN+l9AmER/O4yWpkw=
=MRH1
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--
