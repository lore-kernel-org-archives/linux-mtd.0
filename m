Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TM0mO-00076u-2R
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 18:13:13 +0000
Date: Wed, 10 Oct 2012 20:13:07 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Charles Hardin <ckhardin@exablox.com>
Subject: Re: [QUESTION] MLC NAND and ECC over OOB area
Message-ID: <20121010181307.GB14389@parrot.com>
References: <0A090286-986E-4B22-AEC3-EE1C48EC466E@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0A090286-986E-4B22-AEC3-EE1C48EC466E@gmail.com>
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

On Wed, Oct 10, 2012 at 06:31:08PM +0100, Charles Hardin wrote:
> All,
> 
> So, in working with the latest linux MTD driver updates to support BCH ECC and other requirements for MLC NAND parts, I noticed something that was a bit odd from the data sheets and a few conversations with some Flash Hardware engineers that bit errors are expected in the OOB area as well.
> 
> For instance, on a MT29F16G08CBACA - the error correction is stated in the data sheet to be 24-bit over 1080 bytes (which I thought was a typo and should have been 1024).
> 
> This makes sense once you get the stats of the NAND part that is 
> 
> Page Size: 4096
> OOB: 224
> Total: 4096 + 224 = 4320
> From the data sheet: 1080 * 4 = 4320
> 
> After testing the NAND I did find bit errors in the OOB (the bad block marker pattern in particular) so ECC is required over the "mtd->writesize + mtd->oobsize".
> 
> This is not supported in the latest mtd drivers in the 3.6 or 3.5 because of some assumptions in nand_base.c like…
> 
> int nand_scan_tail(struct mtd_info *mtd)
> {
> 	… snip snip snip …
> 
>         /*
>          * Set the number of read / write steps for one page depending on ECC
>          * mode.
>          */
>         chip->ecc.steps = mtd->writesize / chip->ecc.size;
>         if (chip->ecc.steps * chip->ecc.size != mtd->writesize) {
>                 pr_warn("Invalid ECC parameters\n");
>                 BUG();
>         }
>         chip->ecc.total = chip->ecc.steps * chip->ecc.bytes;
> 
> 	… snip snip snip …
> }
> 
> This assumption that the ecc is only over the "write size" might permeate more of the code, so I really have two questions
> - Is anyone already working on handling ECC including the OOB as well?
> - Is the expectation that this is going to have to be flagged as specific to MLC or a generic relayout of the ECC when using BCH over the entire data set instead of the write payload alone?

Hi Charles,

The OOB area is primarily used to store:
- a bad block marker
- ECC bytes

The ECC is generally designed to protect the data area, and the ECC bytes themselves (data+ECC bytes form a long codeword).
The bad block marker normally has two useful values only: 0xff or 0x00, therefore it can be successfully read even with
several bitflips, by looking at its Hamming weight (the number of 1s in the byte).

Now, if you want to store additional stuff (metadata) in the OOB area, _then_ you will need an ECC that covers data + metadata.
This is possible with some drivers; this can also be done with the software BCH library (with a patch).

But the general trend is to avoid using the OOB area for that, because you never know how much space the next NAND generation
will require for ECC, and you'll be in trouble once your metadata does not fit anymore in the remaining space.

BR,
-- 
Ivan
