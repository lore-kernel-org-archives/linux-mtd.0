Received: from zproxy.gmail.com ([64.233.162.202])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EUDBI-0000AP-MG
	for linux-mtd@lists.infradead.org; Mon, 24 Oct 2005 21:00:49 -0400
Received: by zproxy.gmail.com with SMTP id 13so455618nzn
	for <linux-mtd@lists.infradead.org>;
	Mon, 24 Oct 2005 18:00:25 -0700 (PDT)
Message-ID: <6934efce0510241800y4c3111a4gf4f34dc5c8ac2853@mail.gmail.com>
Date: Mon, 24 Oct 2005 18:00:24 -0700
From: Jared Hulbert <jaredeh@gmail.com>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1130173789.15275.1.camel@windu.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <1129819053.4219.10.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.64.0510201141520.5288@localhost.localdomain>
	<6934efce0510201038h2dbc72abvc610c894a9763bce@mail.gmail.com>
	<1130173789.15275.1.camel@windu.rchland.ibm.com>
Cc: linux-mtd@lists.infradead.org, Nicolas Pitre <nico@cam.org>
Subject: Re: Wrong CFI offset in cfi_cmdset_0001.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry. It took me longer than it should have to track down a P30 part
and get it on my machine.  Does this work for you?

Is this format ok?

[MTD] CHIPS: fix for P30 cfi parsing

Change to the extended cfi table parsing for Intel NOR flash that uses
the info in the extended table to 'walk' the table rather than using
hard coding for various primary extended query table version numbers.
[From: Jared Hulbert <jaredeh@gmail.com>]

Index: trunk/drivers/mtd/chips/cfi_cmdset_0001.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- trunk/drivers/mtd/chips/cfi_cmdset_0001.c=09(revision 8)
+++ trunk/drivers/mtd/chips/cfi_cmdset_0001.c=09(revision 10)
@@ -285,7 +285,7 @@
 =09=09=09      sizeof(struct cfi_intelext_otpinfo);

 =09=09/* Burst Read info */
-=09=09extra_size +=3D (extp->MinorVersion < '4') ? 6 : 5;
+=09=09extra_size +=3D (unsigned int)extp->extra[extra_size+1]+2;

 =09=09/* Number of hardware-partitions */
 =09=09extra_size +=3D 1;
@@ -519,7 +519,7 @@
 =09=09       sizeof(struct cfi_intelext_otpinfo);

 =09=09/* Burst Read info */
-=09=09offs +=3D (extp->MinorVersion < '4') ? 6 : 5;
+=09=09offs +=3D (int)extp->extra[offs+1]+2;

 =09=09/* Number of partition regions */
 =09=09numregions =3D extp->extra[offs];
