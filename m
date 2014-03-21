Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQuLZ-0003NN-7o
 for linux-mtd@lists.infradead.org; Fri, 21 Mar 2014 07:58:33 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: RE: [RFC PATCH] UBIFS: remove check for all(0xff) for empty pages
Date: Fri, 21 Mar 2014 07:57:57 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB4E0D@DBDE04.ent.ti.com>
References: <1394518992-26969-1-git-send-email-pekon@ti.com>
 <20140311133533.7ae34928@parrot.com>
In-Reply-To: <20140311133533.7ae34928@parrot.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

>From: Matthieu CASTET [mailto:matthieu.castet@parrot.com]
>>Pekon Gupta <pekon@ti.com> a =E9crit :
>
[...]
>
>If the mtd layer check the number of bitflip on empty page why it
>doesn't correct it and UBIFS see all 0xff ?
>
Most drivers already do that. But my question is bit different.
UBI returns UBI_IO_FF_BITFLIP, when it finds bit-flips in erased-pages
Then why can't UBIFS reuse that information, instead of repeating the
check by itself (comparing each byte with 0xff)


>In the other hand if mtd layer is not able to check empty page this is
>very dangerous. What happen if an empty page already have too much
>bitflip ?
>The data we write on this page will be corrupted.
>
It already does so, nand_base.c returns with -EBADMSG when there are
bitflip_count > ecc.strength.


>In my opinion the change should be done on mtd/UBI layer not ubifs.
>The main problem today is that some driver don't read empty page with
>ecc (because their ecc of empty page is not 0xff).
>We can add metadata (in spare because ubifs want power of 2=09
>write unit !) that can help to see it the page is empty or not.
>
We cannot add any extra marker to OOB/spare area because:
(1) That breaks compatibility with ECC layout expected by ROM code.
  Thus, many legacy devices might fail to boot from NAND.

(2) extra marker in ECC layout is itself subjected to bit-flips, thereby
  making an erased-page getting recognized as programmed-page,
  so this is not a fool-proof solution.


Artem,
Can you please review [1], and if there is a way in which we can avoid
UBIFS giving "corrupt white-space" error during scan, then=20
I'll try to get patch for that.

[1] http://lists.infradead.org/pipermail/linux-mtd/2014-March/052513.html


with regards, pekon
