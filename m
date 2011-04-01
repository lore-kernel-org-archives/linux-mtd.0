Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5gZQ-0003KD-A4
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 15:47:33 +0000
Date: Fri, 1 Apr 2011 17:46:48 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [PATCH] Newly erased page read workaround
Message-ID: <20110401154648.GA21475@parrot.com>
References: <1301640710.2789.11.camel@localhost> <4D958DC2.5000607@st.com>
	<1301647180.2789.35.camel@localhost> <4D9595AB.1050604@st.com>
	<20110401121447.GA19151@parrot.com>
	<1301663081.2789.65.camel@localhost>
	<20110401140429.GB19151@parrot.com>
	<1301667361.2789.84.camel@localhost>
	<20110401144906.GC19151@parrot.com>
	<Pine.LNX.4.64.1104011653430.18181@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.1104011653430.18181@lnxricardw.se.axis.com>
Cc: Vipin Kumar <vipin.kumar@st.com>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Viresh KUMAR <viresh.kumar@st.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"David.Woodhouse@intel.com" <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 01, 2011 at 03:58:47PM +0100, Ricard Wanderlof wrote:
> 
> On Fri, 1 Apr 2011, Ivan Djelic wrote:
> 
> >> I'm curious, if the OOB area is so unreliable, how can we trust it to
> >> store our ECC? We need a mini-ECC for the ECC then?
> >
> > The oob area is no different from the data area (same technology).
> > Fortunately, Hamming and BCH codes (and usual ECC codes in general) actually
> > have built-in robustness to corruption.
> 
> At least with Hamming, when the ECC has been calculated, if it differs 
> from the ECC read from the oob, and the difference is just a single bit, 
> it is assumed that the ECC stored in the oob was subjected to a bitflip, 
> and the data is in fact ok. (A long time ago there was a bug in this in 
> mtd, so that a (single) bit flip in the ECC bytes was flagged as an ECC 
> failure).

Exactly, because a single bitflip in data results in a 12-bit flip in a Hamming
24-bit code. Therefore you can easily distinguish a single bitflip in data
(12 bits change) from a single bitflip in the ECC code (1 bit change).

> I don't know how BCH (and other multiple-error-bit algorithms) deals with 
> this though. Does it assume that there will be at most one bitflip within 
> the ECC data (which is much smaller than the bytes covered by the ECC), or 
> does it accept multiple bit errors also in the ECC data? One would assume 
> that it would start to get difficult to distinguish multiple bit errors in 
> the ECC data with valid ECC indicating bit errors in the data, but perhaps 
> this isn't so thanks to the algorithm used?

With BCH and Reed-Solomon codes, data bytes and ecc bytes form a single
codeword. This whole codeword can be corrected, not just the data part.

Think of codewords as points in a space of binary words. In this space of
binary words, distance is measured as the number of differing bits between two
words.

A codeword has a remarkable property: it is distant from other codewords by at
least 2t+1 bits. You program the codeword to flash, and later read it back as a
(potentially) corrupted binary word. If you assume that this binary word is
distant from at most t bits from the original codeword (i.e. no more than t
bitflips occured in flash), then you can retrieve the original codeword (it is
the closest to your binary word).

The whole point of BCH (or RS) codes it to build such a codeword from the input
data, by adding the right ECC bits.

BR,

Ivan
