Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5gvr-0003bD-1J
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 16:10:44 +0000
Date: Fri, 1 Apr 2011 18:09:40 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: Re: [PATCH] Newly erased page read workaround
Message-ID: <20110401160940.GB21475@parrot.com>
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
> On Fri, 2011-04-01 at 16:04 +0200, Ivan Djelic wrote:
> > On Fri, Apr 01, 2011 at 02:04:41PM +0100, Artem Bityutskiy wrote:
> > > On Fri, 2011-04-01 at 14:14 +0200, Ivan Djelic wrote:
> > > > Did you consider this idea: if you have an unused byte available in oob,
> > > > program it to 0x00 when a page is programmed.
> > > 
> > > I guess this depends on the the controller, but probably this could mean
> > > a substantial write  overhead, not?
> > 
> > Sorry, my explanation was probably not very clear.
> > 
> > When you program a page, you send data and oob contents to your NAND controller.
> > The controller may modify oob contents to add ECC bytes, in a more or less
> > automatic way, then it will physically program the page.
> 
> Right, I just assumed that some controllers allow you to send only data,
> and programming OOB would be a separate operation. But if this is not
> the case in ST's HW - then this sounds like a very good approach!

I had a quick look at fsmc_nand.c, and I don't see anything in the controller
preventing this approach. The driver provides an IO_ADDR_W address for sending
data to the NAND device, and lets mtd upper layers do the job. By implementing
the page writing function in the driver, one could clear the marker in the oob
array before programming (and check it in the page reading function).

I would be very surprised if the controller did not allow control over oob
contents other than ecc bytes. By doing so, it would prevent things like
software bad block marking. But sometimes hardware can be very surprising :)

BR,

Ivan
