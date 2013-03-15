Received: from bitbox.plus.com ([81.174.226.42] helo=galago.localnet)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UGYtw-0002B1-Iu
 for linux-mtd@lists.infradead.org; Fri, 15 Mar 2013 17:58:45 +0000
Received: from [172.16.79.1] (sea-squirt.localnet [172.16.79.1])
 by galago.localnet (Postfix) with ESMTP id 18E5320FC7
 for <linux-mtd@lists.infradead.org>; Fri, 15 Mar 2013 17:58:41 +0000 (GMT)
Message-ID: <51436157.5000609@bitbox.co.uk>
Date: Fri, 15 Mar 2013 17:58:47 +0000
From: Peter Horton <phorton@bitbox.co.uk>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: on-die ECC support
References: <CACwUX0O=_mXexe6RLgGznVThUdMiMFAEMdzdOWBdKxYa1pHcAQ@mail.gmail.com>
In-Reply-To: <CACwUX0O=_mXexe6RLgGznVThUdMiMFAEMdzdOWBdKxYa1pHcAQ@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15/03/2013 16:08, David Mosberger-Tang wrote:
> We need to be able to support 4-bit-correcting ECC with a
> micro-controller that doesn't have hardware-support for that.  We are
> planning to use the on-die ECC controller supported by Micron flash
> chips.  I suppose we could use the BCH swecc support in the Linux
> kernel, but I'm concerned about the performance implication of that
> and we'd also have to add BCH ecc to our bootloader, which would mean
> more development and testing.
>

Be careful using the NAND status register to indicate bit flips. The 
chips we were using set the status bit for any correction and this can 
result in very high error counts. Some of the pages had bits which are 
permanently 0 or 1 meaning they might need correction every read. We 
worked around this by re-reading any page that the chip flagged as 
corrected and using the software BCH to work out the actual number of 
bits in error.

P.
