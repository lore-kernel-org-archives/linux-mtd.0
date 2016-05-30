Received: from omr1.cc.ipv6.vt.edu ([2607:b400:92:8300:0:c6:2117:b0e]
 helo=omr1.cc.vt.edu)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7Axf-00054j-Hf
 for linux-mtd@lists.infradead.org; Mon, 30 May 2016 00:21:40 +0000
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/15] mtd: nand: samsung: retrieve ECC requirements from
 extended ID
From: Valdis.Kletnieks@vt.edu
In-Reply-To: <1464353701-23233-14-git-send-email-boris.brezillon@free-electrons.com>
References: <1464353701-23233-1-git-send-email-boris.brezillon@free-electrons.com>
 <1464353701-23233-14-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1464567635_2071P";
 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date: Sun, 29 May 2016 20:20:35 -0400
Message-ID: <198040.1464567635@turing-police.cc.vt.edu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--==_Exmh_1464567635_2071P
Content-Type: text/plain; charset=us-ascii

On Fri, 27 May 2016 14:54:59 +0200, Boris Brezillon said:
> From: Hans de Goede <hdegoede@redhat.com>
>
> On some nand controllers with hw-ecc the controller code wants to know
> the ecc strength and size and having these as 0, 0 is not accepted.
>
> Specifying these in devicetree is possible but undesirable as the nand
> may be different in different production runs of the same board, so it
> is better to get this info from the nand id where possible.
>
> This commit adds code to read the ecc strength and size from the nand
> for Samsung extended-id nands. This code is based on the info for the 5th
> id byte in the datasheets for the following Samsung nands: K9GAG08U0E,
> K9GAG08U0F, K9GAG08X0D, K9GBG08U0A, K9GBG08U0B. These all use these bits
> in the exact same way.

Is this correct for all Samsung nand devices supported by this driver?

(If this driver only covers those 5 specific parts, it's OK.  If there's
others, more research is needed....)

--==_Exmh_1464567635_2071P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Exmh version 2.5 07/13/2001

iQIVAwUBV0uHUgdmEQWDXROgAQLseA//UzCtBqcWKLBrGKTXUzsQBCbPOW0EXeYv
18mZTmm9dlqFHkqsP4A6KxD/2nOcPm59sG/PuWLYo5GE3a1LgmpwPZX3unKUF/Mi
CJ0vvfhbsxPktrbEoYFzJhEe2J3Rbc2sCxHqQy4WPUmZrKwV9/enMipIGtiiyoJf
mRR7ns5uJCJ2KbskwXsYk66xdVXQtGD+hEDUrxOucuzlA7TSxaLejjRtHrgVNbdH
qYuQM37DdDE05uAEY5z9lPBUt6TQcrRoSdFvwQTwLcOsf+DymAxfK6gW9zFqcomR
0LnIyK2F0Gk5+rTzWFgyVltNjs7FGuwe5aXYa0SVdHoisWDWT9m0XrmDPlbN41VV
AngZw1t50m6aYSTaclvqaBDaLegzkgjLk2mgdDdgy4h306sQjvYUdzgWFp90xvDM
ylOmv8lRHYGcER37tI3pANHzXS6O5LiTV8q2xkrYHiCQL4+zderIcIOdSnXBubOM
YD0i2kZ70WdVO2Z51AvCsbUarW0MxUloMygv6YFyNY83wxHDly7/f4oNB/r9+Oj0
WYoO/uRAwLnW9m+/KYrFJ1drxsIieh8Juc9OhU29Gw1AkLF0J2GYt5vWL4PV42kS
AGHXb4PWQGyGO2EZDWcBFVsny/caoCyNV8KxVq7OwOM4hgs4y62wqywbJ7LrOboI
5v08dyiOkiQ=
=MqQO
-----END PGP SIGNATURE-----

--==_Exmh_1464567635_2071P--
