Received: from mail-pa0-f49.google.com ([209.85.220.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TMO2I-0007Rf-30
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2012 19:03:10 +0000
Received: by mail-pa0-f49.google.com with SMTP id bi5so2137938pad.36
 for <linux-mtd@lists.infradead.org>; Thu, 11 Oct 2012 12:03:07 -0700 (PDT)
Subject: Re: [QUESTION] MLC NAND and ECC over OOB area
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: text/plain; charset=us-ascii
From: Charles Hardin <ckhardin@exablox.com>
In-Reply-To: <AD7F07FE-BAD4-48F6-BF24-520FA8BCFCB2@exablox.com>
Date: Thu, 11 Oct 2012 12:02:51 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <11F63AD4-A169-498F-8477-9FA9227EA110@exablox.com>
References: <0A090286-986E-4B22-AEC3-EE1C48EC466E@gmail.com>
 <20121010181307.GB14389@parrot.com>
 <AD7F07FE-BAD4-48F6-BF24-520FA8BCFCB2@exablox.com>
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


On Oct 11, 2012, at 11:22 AM, Charles Hardin wrote:

> Ok, that seems reasonable - and, following this line of thought - then =
the expectation would be to change the nand_bbt.c code to check for the =
"weight of a bad block pattern" instead of looking for an exact match on =
the pattern.
>=20
> For example the following would change:
>=20
> /**
> * check_short_pattern - [GENERIC] check if a pattern is in the buffer
> * @buf: the buffer to search
> * @td: search pattern descriptor
> *
> * Check for a pattern at the given place. Used to search bad block =
tables and
> * good / bad block identifiers. Same as check_pattern, but no optional =
empty
> * check.
> */
> static int check_short_pattern(uint8_t *buf, struct nand_bbt_descr =
*td)
> {
>        int i;
>        uint8_t *p =3D buf;
>=20
>        /* Compare the pattern */
>        for (i =3D 0; i < td->len; i++) {
>                if (p[td->offs + i] !=3D td->pattern[i])
>                        return -1;
>        }
>        return 0;
> }
>=20
> to something like the pseudo code below:
>=20
> static in check_short_pattern(uint8_t *buf, struct nand_bbt_descr *td)
> {
> 	int i;
> 	int weight =3D 0;
> 	int tweight =3D 0;
> 	uint8_t *p =3D buf;
>=20
> 	/* Compute and compare the weight */
> 	for (i =3D 0; i < td->len; i++) {
> 		uint8_t w;
>=20
> 		w =3D p[td->offs+i];
> 		w =3D (w & 0x55) + ((w >> 1) & 0x55);
> 		w =3D (w & 0x33) + ((w >> 2) & 0x33);
> 		w =3D (w & 0x0f) + ((w >> 4) & 0x0f);
> 		weight +=3D w;
>=20
> 		w =3D td->pattern[i];
> 		w =3D (w & 0x55) + ((w >> 1) & 0x55);
> 		w =3D (w & 0x33) + ((w >> 2) & 0x33);
> 		w =3D (w & 0x0f) + ((w >> 4) & 0x0f);
> 		tweight +=3D w;
> 	}
>=20
> 	/* if the weight of the buf is more then half the weight of the =
pattern */
> 	if (weight > (tweight / 2))
> 		return 0;
>=20
> 	return -1;
> }
>=20
> This is a not an overly complex concept for nand_bbt code path, but it =
would change the exact match done currently to a heuristic match done by =
weight. My guess is that this behavior change will be done by the driver =
itself and override the nand_scan_bbt functions. However, I don't see an =
interface to plugin a specific BBT implementation in the underneath the =
nand_scan_bbt and nand_update_bbt functions currently in the hand =
drivers.
>=20
> Regards,
> Charles


Oops, wrong call path - I just looked into nand_base.c and on the =
nand_block_bad function, I was looking at the generation of the in core =
memory bbt - I'll poke around a bit more now on the proper code path to =
construct a better world view.

Regards,
Charles=
