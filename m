Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SaNNC-0007pZ-QE
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 08:38:19 +0000
Message-ID: <1338540121.2536.150.camel@sauron.fi.intel.com>
Subject: Re: mtd nand erase and bad block
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Angus CLARK <angus.clark@st.com>
Date: Fri, 01 Jun 2012 11:42:01 +0300
In-Reply-To: <4FC87D62.6020402@st.com>
References: <4FC76039.6020701@sirius-es.it> <4FC771EC.4090500@intel.com>
 <4FC78012.5010704@sirius-es.it> <4FC8601C.5070708@intel.com>
 <Pine.LNX.4.64.1206010837100.4247@lnxricardw.se.axis.com>
 <4FC87D62.6020402@st.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-/ulfK6gUNs/9XZSVkdfl"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-/ulfK6gUNs/9XZSVkdfl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-06-01 at 09:29 +0100, Angus CLARK wrote:
> I have to do this regularly for testing new NAND drivers.  After getting =
fed up
> with doing temporary hacks all the time, I ended up adding a
> 'nand_erasebadblock' entry to debugfs, which overrides the check in
> nand_erase_nand():
> ...
> 	if (!nand_erasebadblock &&
> 	    nand_block_checkbad(mtd, ((loff_t) page) <<
> 				chip->page_shift, 0, allowbbt)) {
> ...
>=20
> The sequence in userspace would then be something like:
>=20
> 	target% echo 1 > /sys/kernel/debug/nand_erasebadblock
> 	target% flash_erase -N /dev/mtd6 0x00200000 1
> 	target% echo 0 > /sys/kernel/debug/nand_erasebadblock
>=20
> You need to be careful to only erase marked bad blocks that you know are
> actually good, or else you risk loosing the factory-programmed bad block =
markers.
>=20
> This method is also useful for erasing the BBTs, which will then force th=
e
> driver to re-scan for OOB markers on the next boot.  Again care needs to =
be
> taken, as you may loose information about blocks that have gone bad throu=
gh
> wear.  (The recent patch "mtd: nand: write BBM to OOB even with flash-bas=
ed BBT"
> partly overcomes this issue.)
>=20
> Typically, debugfs is only enabled in development environments, and even =
then it
> requires explicit user action, so this method of enabling erasing bad blo=
cks is
> safe enough for our needs.

Sounds ok to me, especially if you send the patch together with a piece
of doc for the mtd web-site. I just think it is important to document
this feature. Is this doable?

--=20
Best Regards,
Artem Bityutskiy

--=-/ulfK6gUNs/9XZSVkdfl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPyIBZAAoJECmIfjd9wqK0wVwQAMcQeCHvg6TbQae9DLUNtzJB
p+ie1kfabMkx6NL5Y29bqgmH2PYbwwha7wwP14s9Nydn7b0YzdRfX82qPlYmGlyu
zqxMXxJj2iI16dloxPEO75+hFJ71l1+kSKWJkoRhxXTegyiwfz9fbERe5ab2fnzf
FTbr0dutFsYKnUDR8DxGelmCUuY6ch6FplDceqU1o+s6SpjULzmnQwTk61Et28Tm
rXnst+8Py24jUDPQqrbD61ZdM4uAFt9inNp312KahZ+G0U1OWVWCiz89DHyFQe8n
8WCZNRHpokc5YF8YgfxNMU03JXQa0QUAYWHtIj4+Nf+XfTkANHBdIGqcQjLRZ9fy
iKeMBsXhgPXEiRLUZYYNyheLMmoSQdR5Na+gqLeLsh1yH5odvtoHOI+IbI8CXoSM
SxDiPGCD8ziqTYyDFJYbPl9aeYqvEBpljS2cc5ceod6XjwaukJ72LpcxcXMC4hL8
TbzILZqpqJM6b2wZ19DUmrhoR0WfKsaCOW0vWMQgcLZDHjLMR2szhSJb9rC2hj1V
gciky7zg5F3+s19sM6XjxdK7tVRTvu2oJBc+AvlIVvgwq8er2I33Sco+zwm39AF+
N3pmBXFynKULroFAnjtBgOuvpQKV+wQATdvyR1qjP4l3MEffEO7d5QzGqbBzfR9I
jDHboy/Y7LLs6UvNAeYI
=w+fB
-----END PGP SIGNATURE-----

--=-/ulfK6gUNs/9XZSVkdfl--
