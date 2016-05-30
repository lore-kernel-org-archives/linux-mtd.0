Received: from omr1.cc.ipv6.vt.edu ([2607:b400:92:8300:0:c6:2117:b0e]
 helo=omr1.cc.vt.edu)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7UG6-0001hF-FC
 for linux-mtd@lists.infradead.org; Mon, 30 May 2016 20:57:59 +0000
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/15] mtd: nand: samsung: retrieve ECC requirements from
 extended ID
From: Valdis.Kletnieks@vt.edu
In-Reply-To: <20160530094446.5edec3ac@bbrezillon>
References: <1464353701-23233-1-git-send-email-boris.brezillon@free-electrons.com>
 <1464353701-23233-14-git-send-email-boris.brezillon@free-electrons.com>
 <198040.1464567635@turing-police.cc.vt.edu>
 <20160530094446.5edec3ac@bbrezillon>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1464641769_2071P";
 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Date: Mon, 30 May 2016 16:56:09 -0400
Message-ID: <137285.1464641769@turing-police.cc.vt.edu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--==_Exmh_1464641769_2071P
Content-Type: text/plain; charset=us-ascii

On Mon, 30 May 2016 09:44:46 +0200, Boris Brezillon said:
> Hi Valdis,

> Actually, that was my first reaction [1], but the more I think about it
> the more I realize it's a non-issue.
> AFAICT, there's no full-id entries for Samsung NANDs in the nand_ids
> table, so this either means there's no real users of Samsung MLCs or
> NAND controller drivers connecting to those chips don't care about the
> ->ecc_{step_ds,strength_ds} fields.

I'm mostly, though not totally convinced (not having looked closely at
the existing code).  There's still a possible issue with the distinction
between:

A) "driver never references the variable" and

B) driver check if it's zero, and acts like it doesn't care if it is, but if
it's non-zero, it goes ahead and uses it, with possible hilarity ensuing if the
value is wrong.

Should be pretty easy for somebody who knows the code better than I to rule
out case B fairly quickly...

> I agree that the solution is not perfect, but I'd prefer seeing the
> NAND detection code iteratively improved than rejecting everything
> until we're 100% sure that all cases are correctly handled (which might
> never happen since NAND vendors introduce new NAND ID scheme if they
> need to).
>
> BTW, do you have Samsung datasheets describing a different NAND ID
> format, or is it purely hypothetical?

Mostly hypothetical.  I've just seen too many patches that assume "all chips
from  vendor XYZ do *this*" that were not at all corrrect.


--==_Exmh_1464641769_2071P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Exmh version 2.5 07/13/2001

iQIVAwUBV0yo6QdmEQWDXROgAQIX5BAAoQW268qTXx0WZt/1U7B/AHt6kdCKAu+6
eGVaNN3HUTt+TwqSonHxfhapwNjMAKAI79lGpxJMaDbf+eBtg0zmIpjr+vaCmPfG
ag8eVMIXA7pmlVOF989ckwDVQxz0wl0y+6UoGH99B2+NRCF7k16cRmLHHP4WkXOJ
5TtCZm8O867L3CJ44b+isu1kq6iKBgSMtExEJs2bpbjxXDGEyVBQ/1Al+7sQXed6
UpptQCzLVAiqrbH6aNp0PA5iq5n2w1J/O1OolHOCqDYuHKOVzOIYPb/sYXzeYy0u
saRm/5ZZEuQcB0S2msmDpSn94JZmc4VUkuX9YymoDfO5eilDlK7p1jpCDxiK984D
TUWBs63Aps4yMp9+pkUepgCkP7Y30ZbwiK7ONFjbgUW5yvE8IZYkz8uE0XCKGROY
Zwv2KUCfXQR76Vuy9PSqYlHo5VVGg92Rvj19OaINkPCspS9Vze9KoFc5RCEU96l1
2RU2a+svJXNrB8qaD5YpaEysmUp4VnXWzOiXyd/98PigS5CCsSEpaekzWWddmrmG
uMph4wRyUCGVDMxAukhev7mlt60Wr0NY5kO4qmyOa8CfsUoA2zxePSRqgYIr2U9j
Nt/6z8VctDGf0pPyTojlQlffpt+QU9Ebz5nOIGExM3JtbOQQtGc4scv8dfYN424B
S45cfP6Byys=
=L//p
-----END PGP SIGNATURE-----

--==_Exmh_1464641769_2071P--
