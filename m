Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T2J8X-0008EG-Nk
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 09:46:38 +0000
Message-ID: <1345197081.27859.37.camel@sauron.fi.intel.com>
Subject: Re: MLC NAND: all 0xff after erase?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Date: Fri, 17 Aug 2012 12:51:21 +0300
In-Reply-To: <20120711174309.GA25743@parrot.com>
References: <CAN8TOE9RyUuRtEfyqBfxt0W3Cfg2_SD6Hp4rMS0S+MgKsPY9UQ@mail.gmail.com>
 <20120711174309.GA25743@parrot.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-UKgai+LtR8JlHckLpbk9"
Mime-Version: 1.0
Cc: Mike Dunn <mikedunn@newsguy.com>, Richard Weinberger <richard@nod.at>,
 Kevin Cernekee <cernekee@gmail.com>, Jim Quinlan <jim2101024@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Joel Reardon <reardonj@inf.ethz.ch>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-UKgai+LtR8JlHckLpbk9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-07-11 at 19:43 +0200, Ivan Djelic wrote:
> Or, conversely, we could decide that erased pages are simply not
> ecc-protected
> (which is the actual truth with many drivers), can contain anything
> (including
> bitflips), and should be signalled as erased and dealt with in upper
> layers...=20

I did not not investigate this in details, but I believe UBI and UBIFS
can be changed and they can allow for a number of bit-flips. There are
only few places (may be even 2 - one in UBI and one in UBIFS) which
check if the area contains all 0xFFs. I do not see any obstacles
improving this and implement a smarter functions which would take a
buffer, it's length, ecc step size, and max allowable bit-flips as a
parameter, and check if the page is empty. This could even be an MTD
helper, something like 'mtd_area_is_empty()'.

I think in UBI we only verify if an area is empty in the debugging code,
to make sure we never write over older data. Should be easily fixable.

In UBIFS probably in scanning/recovery code we need to find where free
space starts, probably in a couple of places. E.g., if we are scanning
the journal, and then hit a corrupted node, we want to know if it is the
last node or not. We check this by looking if the empty space starts
after the corruption - in the next min. I/O unit (NAND page), taking
into account the node length.

So I think we only need someone brave enough to implement this.

--=20
Best Regards,
Artem Bityutskiy

--=-UKgai+LtR8JlHckLpbk9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLhQZAAoJECmIfjd9wqK0w+cQAMNd9q+rHpIenyjz6m9ejI6Q
B0c+SDMJY3l8GPc4267tTize+o0AOerwHBxxwYldfa63TZiZDUuw8qlL+Iv5eQ8o
36GnG3g4MYnVrj4TALOU8NU6pY6K5svItaTlpTrj9OyVtCvYtW0F+jQZOP7Abkn+
wB1TxZVn16qg06rfORRqrp0E4wlTN5OyqZHdTcJkQ+syetXvIpb4Td+n94jlv+Zf
0Iv8lsV0OUezjWT14Q6dp8dgXR0oQA9iCyYDMogUGfFjRWrMhswXEC4Pb3ixxyrV
UscDMrgwKhVoJnBRaj6Dlj9eOlqsLAjDjz4HxfmoO5oPP4Opr6fSKVTCaHjgtMPZ
r28Km46FBEzZXf8dNzwElUUewwY6lVBFSSYVpAzZI2Iw17rbRoTKMXwnsSiMjpW1
bnU9HpNCqgZLSjhKUTDRevRfQ8nUJcIeMVyKqtR16ydXRvo4tFS9Fi7nvRkBXsAy
Cvq8zYNjFEgVL5izCi7P2Sk12jxchojXl7g+svdmSMbxusH4Ei62wl/+nYWaXMvb
oDTwL6som4vm/ADQeoRFkdIFXJHuOl8WdA6X24r3YZMKxVt7qNPo4qNdOAOEEYFO
MdDX+tPGoh+tWSKfUsOB/NwzRIkUfdfP6c+GpkHu8EYi/AmY9hUzItIQ4Hh4a/zY
RlvXH78nxeyAc6Svklrk
=aryF
-----END PGP SIGNATURE-----

--=-UKgai+LtR8JlHckLpbk9--
