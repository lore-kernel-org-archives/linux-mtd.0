Received: from smtp.newsguy.com ([74.209.136.69])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RE9xL-0008UA-OC
	for linux-mtd@lists.infradead.org; Thu, 13 Oct 2011 01:19:32 +0000
Message-ID: <4E963C77.70400@newsguy.com>
Date: Wed, 12 Oct 2011 18:18:47 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: [PATCH] Add driver for M-sys / Sandisk diskonchip G4 nand flash
References: <1318258091-12670-1-git-send-email-mikedunn@newsguy.com>
	<201110101751.19010.marek.vasut@gmail.com>
	<20111010181210.GA23655@parrot.com> <4E935D5D.4050504@newsguy.com>
	<20111011115034.GA28920@parrot.com> <4E949642.9020209@newsguy.com>
	<20111012184903.GA9535@parrot.com>
In-Reply-To: <20111012184903.GA9535@parrot.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
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

On 10/12/2011 11:49 AM, Ivan Djelic wrote:
>
> Well, thanks to your ecc samples I have the answer now; the hardware does
> provide recv_ecc^calc_ecc, with a little twist: a parity code in inserted into
> data before performing BCH remainder computations.

Yup, you nailed it!

> I don't really know how the parity byte in step 3 is generated, or what its
> purpose is; it may be there to allow oob reading without performing a full BCH
> decode, but the code seems too small to me to protect anything in a useful way.
> The nice thing is, we don't really need this code to perform BCH decoding.

Yes, it's a hw-generated hamming code, and it's supposed to cover the 7 oob
bytes preceding it.  Yes, for reading oob only.  One of my TODOs is to check the
hamming code when reading oob only.  So I did know about that and was including
it in my tests.  What escaped me is the fact that all the page data needed to be
bit-reversed in order to get the same ecc from your code as was written in oob. 
And prior to that, the fact that the hw generates calc_ecc ^ recvd_ecc, until
you pointed that out.

> Could you try this in your driver and tell me if it matches your errorpos[]
> results ?

Done.  I left the original code in the driver when I added the new code, and
added some additional lines to verify identical results.  All's well.

Thanks again for all the help.  Nice to know what's going on, and not duplicate
your bch code needlessly.  Thanks also for the pointers to the table-based bit
reversal alg.

Mike
