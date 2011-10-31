Received: from smtp.newsguy.com ([74.209.136.69])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RKrjz-00038B-AJ
	for linux-mtd@lists.infradead.org; Mon, 31 Oct 2011 13:17:28 +0000
Received: from [192.168.12.102] (48.sub-166-250-1.myvzw.com [166.250.1.48])
	by smtp.newsguy.com (8.14.3/8.14.3) with ESMTP id p9VDHO5T069970
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 Oct 2011 06:17:25 -0700 (PDT)
	(envelope-from mikedunn@newsguy.com)
Message-ID: <4EAE9FB6.6090200@newsguy.com>
Date: Mon, 31 Oct 2011 06:16:38 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 12/13] mtd/docg3: add ECC correction code
References: <1319824292-11085-1-git-send-email-robert.jarzmik@free.fr>
	<1319824292-11085-13-git-send-email-robert.jarzmik@free.fr>
In-Reply-To: <1319824292-11085-13-git-send-email-robert.jarzmik@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Robert,

A few comments (limited to the bch decode for now)...

On 10/28/2011 10:51 AM, Robert Jarzmik wrote:
>  
>  /**
> + * doc_correct_data - Fix if need be read data from flash
> + * @docg3: the device
> + * @buf: the buffer of read data (512 + 7 + 1 bytes)
> + * @calc_ecc: the hardware calculated ECC


To avoid confusion with the terminology in Ivan's BCH algorithm, I wouldn't call
it calc_ecc.  It's actually recv_ecc ^ calc_ecc, where recv_ecc is what the hw
read from the ecc field of the oob data, and calc_ecc is what the hw calculated
from the page data.  Maybe just hwecc or similiar.


> + *
> + * Checks if the received data matches the ECC, and if an error is detected,
> + * tries to fix the bit flips (at most 4) in the buffer buf.  As the docg3
> + * understands the (data, ecc, syndroms) in an inverted order in comparison to
> + * the BCH library, the function reverses the order of bits (ie. bit7 and bit0,
> + * bit6 and bit 1, ...) for all ECC data.
> + *
> + * Returns number of fixed bits (0, 1, 2, 3, 4) or -EBADMSG if too many bit
> + * errors were detected and cannot be fixed.
> + */
> +static int doc_ecc_bch_fix_data(struct docg3 *docg3, void *buf, u8 *calc_ecc)
> +{
> +	u8 ecc[DOC_ECC_BCH_T + 1];
> +	int errorpos[DOC_ECC_BCH_T + 1], i, numerrs;
> +
> +	for (i = 0; i < DOC_ECC_BCH_SIZE; i++)
> +		ecc[i] = bitrev8(calc_ecc[i]);
> +	numerrs = decode_bch(docg3_bch, NULL, DOC_ECC_BCH_COVERED_BYTES,
> +			     NULL, ecc, NULL, errorpos);


This looks right, with the redefined DOC_ECC_BCH_COVERED_BYTES (now 520).   

Some commentary would be helpful (though maybe I'm too verbose)...

    /*
     * The hardware ecc unit produces oob_ecc ^ calc_ecc.  The kernel's bch
     * algorithm is used to decode this.  However the hw operates on page
     * data in a bit order that is the reverse of that of the bch alg,
     * requiring that the bits be reversed on the result.  Thanks to Ivan
     * Djelic for his analysis.
     */

I recommend you test this.  One way would be to compile the bch algorithm in
userspace and use it to generate the ecc for a 520  byte test vector.  Reverse
the bits of this ecc, then flip a few bits in the test vector and write it to a
page in flash, with your driver modified to write the calculated ecc instead of
that served up by the hardware.  Then when you read the page, the above code
should identify and correct the bits you flipped (assuming a genuine flash error
did not occur while reading back the page).  I have the bch alg modified for
userspace, if that would help.

Alternatively, you could just fill the flash with a fixed pattern, then read all
the pages, waiting for an error to occur so that correct correction (ha) can be
verified.


> +	if (numerrs < 0)
> +		return numerrs;

I recommend you check for the -EINVAL return value and issue a big fat error. 
Maybe BUG_ON(numerrs == -EINVAL), at least for now.

Another explanatory comment here...
    /* undo last step in BCH alg (modulo mirroring not needed) */


> +
> +	for (i = 0; i < numerrs; i++)
> +		errorpos[i] = (errorpos[i] & ~7) | (7 - (errorpos[i] & 7));
> +	for (i = 0; i < numerrs; i++)
> +		change_bit(errorpos[i], buf);
> +
> +	doc_dbg("doc_ecc_bch_fix_data: flipped %d bits\n", numerrs);
> +	return numerrs;
> +}
> +
> +

Thanks,
Mike
