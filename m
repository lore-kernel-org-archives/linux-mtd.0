Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PsZ6i-0001oT-Kc
	for linux-mtd@lists.infradead.org; Thu, 24 Feb 2011 11:11:41 +0000
Date: Thu, 24 Feb 2011 12:10:21 +0100
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Vipin Kumar <vipin.kumar@st.com>
Subject: Re: [PATCH] Newly erased page read workaround
Message-ID: <20110224111021.GA8650@parrot.com>
References: <c7baa4a77775b54f2ef8450d8d1f44d1dc011b41.1298527669.git.viresh.kumar@st.com>
	<20110224093800.GA7880@parrot.com> <4D66310B.1050706@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4D66310B.1050706@st.com>
Cc: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
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

On Thu, Feb 24, 2011 at 10:20:59AM +0000, Vipin Kumar wrote:
> On 2/24/2011 3:08 PM, Ivan Djelic wrote:
(...)
> > Just a suggestion: maybe you could mention in your comments the fact that you
> > cannot workaround the problem using a mask to get a valid ECC on erased pages,
> > because your controller does not allow it ?
> > 
> > If you plan to use your workaround on recent NAND devices with UBIFS, you may
> > still experience problems because of uncorrected bitflips on erased pages, and
> > get errors such as:
> > 
> 
> Let me explain the problem again.
> 
> The problem is that the BCH algorithm (used by this controller to generate ecc 
> and correct bitflips) generates an ecc which is not 0xffff for an erased 512 
> bytes.
> 
> Since erasing a page results in all data including the spare area of the page 
> resetting to 0xffff, and the ecc written in the spare area is incorrect.
> This ecc is not useful to correct bitflips
> 
> One way to solve this problem is to write the correct ecc in the erased pages 
> spare area. The other is to ensure that the page is erased and not run the 
> correction algorithm.

There is a third option: add (before writing oob/after reading oob) a fixed
polynomial to your HW-generated BCH ECC codeword. This polynomial is chosen such
that your ECC code on an erased page now becomes a sequence of 0xff bytes.
That way, erased pages can be read with ECC check enabled. That was my point.

I assume you cannot alter oob contents as described above, because your controller
performs error detection "on-the-fly" as you transfer data to/from NAND device (?).

> We are using the second option but there would not be 
> any unwanted bitflips in any of the cases.

On recent NAND devices, bitflips _do_ appear on erased pages, sometimes immediately
after a block erase.

Regards,

Ivan
