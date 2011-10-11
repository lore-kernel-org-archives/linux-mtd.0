Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RDas1-0007V4-W1
	for linux-mtd@lists.infradead.org; Tue, 11 Oct 2011 11:51:45 +0000
Date: Tue, 11 Oct 2011 13:50:34 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH] Add driver for M-sys / Sandisk diskonchip G4 nand flash
Message-ID: <20111011115034.GA28920@parrot.com>
References: <1318258091-12670-1-git-send-email-mikedunn@newsguy.com>
	<201110101751.19010.marek.vasut@gmail.com>
	<20111010181210.GA23655@parrot.com> <4E935D5D.4050504@newsguy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4E935D5D.4050504@newsguy.com>
Cc: Marek Vasut <marek.vasut@gmail.com>,
	"robert.jarzmik@free.fr" <robert.jarzmik@free.fr>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 10, 2011 at 10:02:21PM +0100, Mike Dunn wrote:
> > Still, I do not understand why you go to great lengths computing syndro=
mes in
> > your code, using a mix of generated remainder tables and Galois field t=
ables.
> >
> > Why don't you just reformat the hw-generated polynomial (cheap, only 56=
 bits
> > to shuffle) and let the BCH library do the whole computation ?
>=20
> Could you elaborate?  What are the 56 bits that the hardware gives me?  I=
t's not
> the syndrome, right?  (BTW, I did verify that the results are correct).

After a more careful examination, I believe your hardware gives you
recv_ecc^calc_ecc, where:

* recv_ecc =3D ecc bytes read from flash =3D  original_data mod g(X)
* calc_ecc =3D ecc bytes computed from ram =3D current_data mod g(X)
* g(X) =3D generator polynomial for m=3D14, t=3D4, primitive=3D0x4443
* data is 520 bytes

When it reads a page, your hw controller not only computes calc_ecc, but it=
 also
XORs the result with previously flashed value recv_ecc.

Furthermore, the hw generator seems to store this polynomial in its registe=
rs
=66rom highest terms to lowest terms, but with reversed bits inside each by=
te.

In other words, you should be able to use function encode_bch() to reproduce
the same bytes as your hw generator as follows:

static const uint8_t reverse8[256] =3D {
/* http://graphics.stanford.edu/~seander/bithacks.html#BitReverseTable */
#   define R2(n) n,     n + 2*64,     n + 1*64,     n + 3*64
#   define R4(n) R2(n), R2(n + 2*16), R2(n + 1*16), R2(n + 3*16)
#   define R6(n) R4(n), R4(n + 2*4 ), R4(n + 1*4 ), R4(n + 3*4 )
    R6(0), R6(2), R6(1), R6(3)
};

static void emulate_docg4_hw(struct bch_control *bch, uint8_t *buf,
       		             uint8_t *ecc_flash)
{
	int i;
	uint8_t ecc_buf[8] =3D {0};

	encode_bch(bch, buf, DOCG4_DATA_LEN, ecc_buf);

	printk("emulated ecc_buf =3D ");
	for (i =3D 0; i < 7; i++) {
		ecc_buf[i] =3D reverse8[ecc_buf[i]] ^ ecc_flash[i];
		printk("%02x", ecc_buf[i]);
	}
}

Note that you must provide ecc_flash bytes (read from oob) to this function.
If you provide ecc_flash[] =3D {0xff,0xff,0xff,0xff,0xff,0xff,0xff,}, (this
happens when you read a blank page) then the output is cf72fc1ba9c7b9, whic=
h is
consistent with your blank_read_hwecc[] array.

If the above assumptions are correct, then you could greatly simplify your =
code
by implementing docg4_correct_data() with something like this:

static int docg4_correct_data(struct mtd_info *mtd, uint8_t *buf, int page)
{
	struct nand_chip *nand =3D mtd->priv;
	struct docg4_priv *doc =3D nand->priv;
	void __iomem *docptr =3D doc->virtadr;
	uint16_t edc_err;
	int i, numerrs, errpos[5];

	/* hardware quirk: read twice */
	edc_err =3D readw(docptr + DOCG4_ECC_CONTROL_1);
	edc_err =3D readw(docptr + DOCG4_ECC_CONTROL_1);

	if (unlikely(debug))
		printk(KERN_DEBUG "docg4_correct_data: "
		       "status =3D 0x%02x\n", edc_err);

	if (!(edc_err & 0x80)) { /* no error bits */
		writew(0, docptr + DOCG4_END_OF_DATA);
		return 0;
	}

	/* data contains error(s); read the 7 hw-generated ecc bytes */
	docg4_read_hw_ecc(docptr, doc->ecc_buf);

	/* check if ecc bytes are those of a blank page */
	if (!memcmp(doc->ecc_buf, blank_read_hwecc, 7)) {
		doc->page_erased =3D true;
		writew(0, docptr + DOCG4_END_OF_DATA);
		return 0;	/* blank page; ecc error normal */
	}

	doc->page_erased =3D false;

	/* ----------------------- MODIFIED PART ------------------------- */
	/* reformat ecc */
	for (i =3D 0; i < 7; i++)
		doc->ecc_buf[i] =3D reverse8[doc->ecc_buf[i]];

	/* decode data and find errors */
	numerrs =3D decode_bch(doc->bch, NULL, DOCG4_DATA_LEN, NULL,
		             doc->ecc_buf, NULL, errorpos);
	if (numerrs =3D=3D -EBADMSG) {
		printk(KERN_WARNING "docg4: "
		       "uncorrectable errors at offset %08x\n", page * 0x200);
		writew(0, docptr + DOCG4_END_OF_DATA);
		return -1;
	}

	/* fix the errors */
	for (i =3D 0; i < numerrs; i++) {
	        errorpos[i] =3D (errorpos[i] & ~7)|(7-(errorpos[i] & 7));
		change_bit(errpos[i], (unsigned long *)buf);
	}
	/* -------------------------------------------------------------- */

	printk(KERN_NOTICE "docg4: %d errors corrected at offset %08x\n",
	       numerrs, page * 0x200);

	writew(0, docptr + DOCG4_END_OF_DATA);
	return numerrs;
}

Is it possible for you to compare your hw generator ecc output with the out=
put
of emulate_docg4_hw() ?

If the above code does not work, I may still find the right permutation
performed by your hw generator on input data. For this I just need a few
samples of hw generated bytes. For instance, hw generated ecc bytes for:
- a page (520 bytes) filled with 0x00, except the first byte set to 0x01
- a page (520 bytes) filled with 0xff, except the first byte set to 0x55

BR,
--

Ivan
