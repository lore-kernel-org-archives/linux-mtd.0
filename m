Received: from mail-pa0-f49.google.com ([209.85.220.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TMNOt-0006SK-8i
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2012 18:22:28 +0000
Received: by mail-pa0-f49.google.com with SMTP id bi5so2103811pad.36
 for <linux-mtd@lists.infradead.org>; Thu, 11 Oct 2012 11:22:23 -0700 (PDT)
Subject: Re: [QUESTION] MLC NAND and ECC over OOB area
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=us-ascii
From: Charles Hardin <ckhardin@exablox.com>
In-Reply-To: <20121010181307.GB14389@parrot.com>
Date: Thu, 11 Oct 2012 11:22:18 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <AD7F07FE-BAD4-48F6-BF24-520FA8BCFCB2@exablox.com>
References: <0A090286-986E-4B22-AEC3-EE1C48EC466E@gmail.com>
 <20121010181307.GB14389@parrot.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Cc: Mike Dunn <mikedunn@newsguy.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jeremy Fitzhardinge <jeremy@exablox.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Oct 10, 2012, at 11:13 AM, Ivan Djelic wrote:

>=20
> Hi Charles,
>=20
> The OOB area is primarily used to store:
> - a bad block marker
> - ECC bytes
>=20
> The ECC is generally designed to protect the data area, and the ECC =
bytes themselves (data+ECC bytes form a long codeword).
> The bad block marker normally has two useful values only: 0xff or =
0x00, therefore it can be successfully read even with
> several bitflips, by looking at its Hamming weight (the number of 1s =
in the byte).
>=20
> Now, if you want to store additional stuff (metadata) in the OOB area, =
_then_ you will need an ECC that covers data + metadata.
> This is possible with some drivers; this can also be done with the =
software BCH library (with a patch).
>=20
> But the general trend is to avoid using the OOB area for that, because =
you never know how much space the next NAND generation
> will require for ECC, and you'll be in trouble once your metadata does =
not fit anymore in the remaining space.
>=20
> BR,
> --=20
> Ivan


Ok, that seems reasonable - and, following this line of thought - then =
the expectation would be to change the nand_bbt.c code to check for the =
"weight of a bad block pattern" instead of looking for an exact match on =
the pattern.

For example the following would change:

/**
 * check_short_pattern - [GENERIC] check if a pattern is in the buffer
 * @buf: the buffer to search
 * @td: search pattern descriptor
 *
 * Check for a pattern at the given place. Used to search bad block =
tables and
 * good / bad block identifiers. Same as check_pattern, but no optional =
empty
 * check.
 */
static int check_short_pattern(uint8_t *buf, struct nand_bbt_descr *td)
{
        int i;
        uint8_t *p =3D buf;

        /* Compare the pattern */
        for (i =3D 0; i < td->len; i++) {
                if (p[td->offs + i] !=3D td->pattern[i])
                        return -1;
        }
        return 0;
}

to something like the pseudo code below:

static in check_short_pattern(uint8_t *buf, struct nand_bbt_descr *td)
{
	int i;
	int weight =3D 0;
	int tweight =3D 0;
	uint8_t *p =3D buf;

	/* Compute and compare the weight */
	for (i =3D 0; i < td->len; i++) {
		uint8_t w;

		w =3D p[td->offs+i];
		w =3D (w & 0x55) + ((w >> 1) & 0x55);
		w =3D (w & 0x33) + ((w >> 2) & 0x33);
		w =3D (w & 0x0f) + ((w >> 4) & 0x0f);
		weight +=3D w;

		w =3D td->pattern[i];
		w =3D (w & 0x55) + ((w >> 1) & 0x55);
		w =3D (w & 0x33) + ((w >> 2) & 0x33);
		w =3D (w & 0x0f) + ((w >> 4) & 0x0f);
		tweight +=3D w;
	}

	/* if the weight of the buf is more then half the weight of the =
pattern */
	if (weight > (tweight / 2))
		return 0;

	return -1;
}

This is a not an overly complex concept for nand_bbt code path, but it =
would change the exact match done currently to a heuristic match done by =
weight. My guess is that this behavior change will be done by the driver =
itself and override the nand_scan_bbt functions. However, I don't see an =
interface to plugin a specific BBT implementation in the underneath the =
nand_scan_bbt and nand_update_bbt functions currently in the hand =
drivers.

Regards,
Charles

--
Bits go in, bytes go out
