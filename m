Received: from bitbox.plus.com ([81.174.226.42] helo=galago.localnet)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UIxDu-0002wX-Ov
 for linux-mtd@lists.infradead.org; Fri, 22 Mar 2013 08:21:18 +0000
Message-ID: <514C147B.3030609@bitbox.co.uk>
Date: Fri, 22 Mar 2013 08:21:15 +0000
From: Peter Horton <phorton@bitbox.co.uk>
MIME-Version: 1.0
To: David Mosberger-Tang <dmosberger@gmail.com>
Subject: Re: on-die ECC support
References: <CACwUX0M-04vCTkA8WwNR9si=7N-xuYOTy6aWO7ty8xa1+S3rUw@mail.gmail.com>
In-Reply-To: <CACwUX0M-04vCTkA8WwNR9si=7N-xuYOTy6aWO7ty8xa1+S3rUw@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 21/03/2013 20:00, David Mosberger-Tang wrote:
>
> I missed your email until now.  You said:
>
>   > Be careful using the NAND status register to indicate bit flips. The
>   > chips we were using set the status bit for any correction and this can
>   > result in very high error counts. Some of the pages had bits which are
>   > permanently 0 or 1 meaning they might need correction every read. We
>   > worked around this by re-reading any page that the chip flagged as
>   > corrected and using the software BCH to work out the actual number of
>   > bits in error.
>
> Ouch.  I think you are right: it looks to me that the chip sets the
> REWRITE_RECOMMENDED bit
> for any bit flips.  Is the Linux BCH code compatible with the Micron code?
>
> Yes, using software BCH to figure out actual number of bitflips would
> be the right approach then.
> Is there a patch for that somewhere?

Not a patch but the driver file is here :-

http://files.bitbox.co.uk/public/nand-on-die-ecc/10CUL494_nand_2.6.37.c

Credit for the Micron ECC layout goes to Ivan Djelic IIRC.

P.
