Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Un63P-0001pU-W6
 for linux-mtd@lists.infradead.org; Thu, 13 Jun 2013 11:51:01 +0000
Date: Thu, 13 Jun 2013 13:50:31 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: Helmut Raiger <helmut.raiger@hale.at>
Subject: Re: UBIFS: How to reserve space to be used right before power cut
Message-ID: <20130613135031.59037201@parrot.com>
In-Reply-To: <51B9B01A.1090504@hale.at>
References: <51B9B01A.1090504@hale.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Why do you do this in ubifs ?

If you do it in ubi/mtd this will be a lot's of easier.



Matthieu


Le Thu, 13 Jun 2013 12:42:18 +0100,
Helmut Raiger <helmut.raiger@hale.at> a =E9crit :

> Hi,
>=20
>      we try the following:
>=20
> 1) setup some data in an 8kByte block in RAM
> 2) frequently modify this data during normal operation
> 3) on a power fail signal write the block to a file on an UBIFS
> partition 4) recover from the written data after the power cut
>=20
>    The time between power failure notification and the uP-reset is=20
> guaranteed by hardware
> and is about 20ms.
>=20
> We first thought about using fallocate() to allocate a corresponding=20
> block on the partition
> but soon found that UBIFS does not implement a native fallocate() and=20
> thus the generic
> one simply wrote the file to 8k of zeros. This of course will not
> help.
>=20
> Simply fsync()ing the file in case of a power cut does not seem=20
> reliable, for
>    - the file system might be full
>    - write back cache operation may interfere with the synch-ing of
> our file
>    - the garbage collector might run to free dirty LEBs and erase the=20
> corresponding PEBs
> The latter 2 overstretching our timing requirements.
>=20
> This is on an embedded system (i.mx31, arm1136@532MHz) running Linux=20
> 3.something
> (we are quite flexible in adapting new kernel versions), currently=20
> testing on 3.0.45.
>=20
> Could someone hint the course to follow for this szenario?
>=20
> Any pointers appreciated,
> Helmut
>=20
>=20
> --
> Scanned by MailScanner.
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
