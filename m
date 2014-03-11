Received: from mail.aswsp.com ([193.34.35.150])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNLuW-0004BQ-DC
 for linux-mtd@lists.infradead.org; Tue, 11 Mar 2014 12:35:57 +0000
Date: Tue, 11 Mar 2014 13:35:33 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [RFC PATCH] UBIFS: remove check for all(0xff) for empty pages
Message-ID: <20140311133533.7ae34928@parrot.com>
In-Reply-To: <1394518992-26969-1-git-send-email-pekon@ti.com>
References: <1394518992-26969-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
Cc: Kent Li <Kent.Li@radisys.com>, Stefan Roese <sr@denx.de>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 HOUR Frderic <frederic.hour@safran-engineering.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le Tue, 11 Mar 2014 11:53:12 +0530,
Pekon Gupta <pekon@ti.com> a =E9crit :

> UBIFS throws following error if an blank page does not contain perfect al=
l(0xff)
> data, during LEB scan, even though if number of bit-flips is within ecc.s=
trength
> 	"UBIFS error (pid 1): ubifs_scan: corrupt empty space at LEB 417:53168"
>=20
> But newer technology devices (like MLC NAND) are prone to read-disturb bi=
t-flips
> and so having perfect all(0xff) data on empty-pages is practically not fe=
asible
> on these newer technology devices (like MLC NAND).
> Also, such device spec suggest using stronger ECC schemes (like BCH16), a=
nd have
> large OOB size to guarantee longer field life.
>=20
> So this check of perfect all(0xff) data can be safely removed from UBIFS,=
 as
> UBI and MTD layers already these before passing the data to UBIFS:
>  if (number-of-bitflips < mtd->bitflip_threshold)
>         Driver's ECC scheme is strong enough to handle existing bit-flips=
 in
>         future, so both MTD and UBI ignore such bit-flips.
>  if (number-of-bitflips >=3D mtd->bitflip_threshold)
>         MTD flags -EUCLEAN.
>         UBI schedules the block for scrubbing.
>  if (number-of-bitflips > nand_chip->ecc.strength)
>         MTD flags -EBADMSG.
>         UBI tries to extract data relevant data from block based on sanit=
y of
>         its headers, and then schedule it for re-erase.

If the mtd layer check the number of bitflip on empty page why it
doesn't correct it and UBIFS see all 0xff ?

In the other hand if mtd layer is not able to check empty page this is
very dangerous. What happen if an empty page already have too much
bitflip ?
The data we write on this page will be corrupted.

In my opinion the change should be done on mtd/UBI layer not ubifs.=20
The main problem today is that some driver don't read empty page with
ecc (because their ecc of empty page is not 0xff).
We can add metadata (in spare because ubifs want power of 2
write unit !) that can help to see it the page is empty or not.


Matthieu
