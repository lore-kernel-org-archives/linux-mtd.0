Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13RQ8U-0005zu-00
	for mtd-list@infradead.org; Wed, 23 Aug 2000 03:19:26 +0100
Received: from [63.205.240.210] (helo=lain.internal.chaoticdreams.org)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13RQ8S-0005zo-00
	for mtd@infradead.org; Wed, 23 Aug 2000 03:19:25 +0100
Date: Tue, 22 Aug 2000 19:19:11 -0700
From: major@chaoticdreams.org
To: Bjorn Eriksson <mdeans@algonet.se>
Cc: mtd@infradead.org
Subject: Re: pmc551.c doesn't compile w/ egcs-2.91.66
Message-ID: <20000822191911.A1823@chaoticdreams.org>
References: <14787.966367168@cygnus.co.uk> <000f01c00c73$bcdac480$0800a8c0@win95.inteloop.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <000f01c00c73$bcdac480$0800a8c0@win95.inteloop.se>; from mdeans@algonet.se on Tue, Aug 22, 2000 at 10:01:19PM +0200
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

If you send me a copy of the output from egcs for when it fails I might b=
e
able to do something with it tonight.  Else will need to wait till tomarr=
ow
when I get back into work with all the toys.

On Tue, Aug 22, 2000 at 10:01:19PM +0200, Bjorn Eriksson wrote:
>=20
>  FYI: I can't get my egcs-2.91.66 to compile pmc551.c w/o adding either=
 -O1
> (or -O0) or -g. I have no idea why, it just stops right before the last
> 'defined but unreferenced static'-warning.
>=20
>=20
> //Bj=F6rnen.
>=20
>=20
>=20
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
>=20

--=20
        "That is precisely what common sense is for, to be jarred into
         uncommon sense."
	     ++ Eric Temple Bell, Mathmatics: Queen of the Sciences

   Mark Ferrell    :   Major'Trips'
   Programmer      :   Chaotic Dreams Development Team
   URL             :   http://www.chaoticdreams.org
   E-Mail          :   major@chaoticdreams.org


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
