Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RE3se-0004sU-L3
	for linux-mtd@lists.infradead.org; Wed, 12 Oct 2011 18:50:17 +0000
Date: Wed, 12 Oct 2011 20:49:03 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH] Add driver for M-sys / Sandisk diskonchip G4 nand flash
Message-ID: <20111012184903.GA9535@parrot.com>
References: <1318258091-12670-1-git-send-email-mikedunn@newsguy.com>
	<201110101751.19010.marek.vasut@gmail.com>
	<20111010181210.GA23655@parrot.com> <4E935D5D.4050504@newsguy.com>
	<20111011115034.GA28920@parrot.com> <4E949642.9020209@newsguy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4E949642.9020209@newsguy.com>
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

On Tue, Oct 11, 2011 at 08:17:22PM +0100, Mike Dunn wrote:
> On 10/11/2011 04:50 AM, Ivan Djelic wrote:
> >
> > After a more careful examination, I believe your hardware gives you
> > recv_ecc^calc_ecc
> 
> It might be a little more complicated.

Well, thanks to your ecc samples I have the answer now; the hardware does
provide recv_ecc^calc_ecc, with a little twist: a parity code in inserted into
data before performing BCH remainder computations.
Here is a more precise description:

writing algorithm:
-----------------
1. 512 bytes of data are sent to HW generator
2. 7 bytes of user data (oob[0] to oob[6]) are sent to HW generator
3. A Hamming (?) parity byte is generated (from oob[0]...oob[6]?) and sent to
   HW generator
4. The BCH engine completes its polynomial remainder computation on the above
   520 bytes

Note that the HW generator reads and writes bytes in reversed bit order.

I don't really know how the parity byte in step 3 is generated, or what its
purpose is; it may be there to allow oob reading without performing a full BCH
decode, but the code seems too small to me to protect anything in a useful way.
The nice thing is, we don't really need this code to perform BCH decoding.

Here is an updated version of my function emulating hw ecc:

static const uint8_t reverse8[256] = {
/* http://graphics.stanford.edu/~seander/bithacks.html#BitReverseTable */
#   define R2(n) n,     n + 2*64,     n + 1*64,     n + 3*64
#   define R4(n) R2(n), R2(n + 2*16), R2(n + 1*16), R2(n + 3*16)
#   define R6(n) R4(n), R4(n + 2*4 ), R4(n + 1*4 ), R4(n + 3*4 )
    R6(0), R6(2), R6(1), R6(3)
};

static void emulate_docg4_hw(struct bch_control *bch, uint8_t *buf,
                             uint8_t *ecc_flash, uint8_t hamming)
{
        int i;
	uint8_t data[DOCG4_DATA_LEN];
        uint8_t ecc_buf[8] = {0};

	for (i = 0; i < DOCG4_DATA_LEN-1; i++)
	    data[i] = reverse8[buf[i]];
	data[DOCG4_DATA_LEN-1] = reverse8[hamming];

        encode_bch(bch, data, DOCG4_DATA_LEN, ecc_buf);

        printk("emulated ecc_buf = ");
        for (i = 0; i < 7; i++) {
                ecc_buf[i] = reverse8[ecc_buf[i]] ^ ecc_flash[i];
                printk("%02x", ecc_buf[i]);
        }
}

If you pass ecc_flash[]={0,0,0,0,0,0,0} to this function, and the proper parity
code corresponding to your data, you should get the same ecc bytes as what your
hardware generates on a write operation.
Note the new parameter 'hamming', required to perform BCH encoding.
Using this function on your samples:

- a page (520 bytes) filled with 0x00, except the first byte set to 0x01
  with hamming=0x01, emulate_docg4_hw() outputs the correct d47899c27e7c7f code

- a page (520 bytes) filled with 0xff, except the first byte set to 0x55
  with hamming=0x31, emulate_docg4_hw() outputs the correct 70f363ce4b969a code

In both cases, Hamming codes were found by brute force searching. Again, those
codes are not needed to perform decoding.

In my previous message, I provided a simplified docg4_correct_data() function
with the following piece of code:

        /* ----------------------- MODIFIED PART ------------------------- */
        /* reformat ecc */
        for (i = 0; i < 7; i++)
                doc->ecc_buf[i] = reverse8[doc->ecc_buf[i]];

        /* decode data and find errors */
        numerrs = decode_bch(doc->bch, NULL, DOCG4_DATA_LEN, NULL,
                             doc->ecc_buf, NULL, errorpos);
        if (numerrs == -EBADMSG) {
                printk(KERN_WARNING "docg4: "
                       "uncorrectable errors at offset %08x\n", page * 0x200);
                writew(0, docptr + DOCG4_END_OF_DATA);
                return -1;
        }

        /* fix the errors */
        for (i = 0; i < numerrs; i++) {
                errorpos[i] = (errorpos[i] & ~7)|(7-(errorpos[i] & 7));
                change_bit(errpos[i], (unsigned long *)buf);
        }
        /* -------------------------------------------------------------- */

I simulated bitflips on your data samples and verified that the code above
generates the same syndrome (and by consequence the same errorpos[] array) as
your function docg4_find_errbits().
Could you try this in your driver and tell me if it matches your errorpos[]
results ?

Thanks,
--
Ivan
