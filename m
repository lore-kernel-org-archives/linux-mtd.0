Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5ffc-0002We-79
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 14:49:52 +0000
Date: Fri, 1 Apr 2011 16:49:06 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: Re: [PATCH] Newly erased page read workaround
Message-ID: <20110401144906.GC19151@parrot.com>
References: <1301579475.2828.82.camel@localhost> <4D95708A.7080204@st.com>
	<1301640710.2789.11.camel@localhost> <4D958DC2.5000607@st.com>
	<1301647180.2789.35.camel@localhost> <4D9595AB.1050604@st.com>
	<20110401121447.GA19151@parrot.com>
	<1301663081.2789.65.camel@localhost>
	<20110401140429.GB19151@parrot.com>
	<1301667361.2789.84.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1301667361.2789.84.camel@localhost>
Cc: Vipin Kumar <vipin.kumar@st.com>, Viresh KUMAR <viresh.kumar@st.com>,
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

On Fri, Apr 01, 2011 at 03:16:01PM +0100, Artem Bityutskiy wrote:
> > That way, the marker is reliable up to 3 bitflips (which is very improbable in
> > the same byte).
> 
> I see.
> 
> I'm curious, if the OOB area is so unreliable, how can we trust it to
> store our ECC? We need a mini-ECC for the ECC then?

The oob area is no different from the data area (same technology).
Fortunately, Hamming and BCH codes (and usual ECC codes in general) actually
have built-in robustness to corruption.

But your point is still valid: when people want to use oob for storing other
things than ECC bytes, say filesystem metadata, they do have a problem; and they
need to make sure that either:
- ECC covers data AND oob metadata (easy to do with BCH, difficult with Hamming)
or
- extra ECC bytes are added to protect oob metadata

YAFFS implements the latter solution.

> > Let us assume Vipin implements the marker idea. He reads a page, and the marker
> > test tells him the page has never been programmed. So he will avoid performing
> > ECC correction on that page. But that page could nevertheless contains bitflips
> > (i.e. not all bytes equal to 0xFF). He could memset page data with 0xFFs to
> > blindly remove possible bitflips, as if the ECC engine had fixed them.
> 
> Ah, I see. Although hiding bit-flips from upper layers might be not the
> best idea sometimes.

I agree, this "blind" cleanup is not such a good idea after all :)

BR,
--
Ivan
