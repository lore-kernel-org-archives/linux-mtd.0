Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5dGL-0000hR-J3
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 12:15:38 +0000
Date: Fri, 1 Apr 2011 14:14:47 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Vipin Kumar <vipin.kumar@st.com>
Subject: Re: [PATCH] Newly erased page read workaround
Message-ID: <20110401121447.GA19151@parrot.com>
References: <c7baa4a77775b54f2ef8450d8d1f44d1dc011b41.1298527669.git.viresh.kumar@st.com>
	<1301579475.2828.82.camel@localhost> <4D95708A.7080204@st.com>
	<1301640710.2789.11.camel@localhost> <4D958DC2.5000607@st.com>
	<1301647180.2789.35.camel@localhost> <4D9595AB.1050604@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4D9595AB.1050604@st.com>
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

On Fri, Apr 01, 2011 at 10:06:51AM +0100, Vipin Kumar wrote:
> That's the problem. Ideally the ecc should have been programmed in OOB and then 
> the driver would be able to correct the flipped bits. The problem happens only 
> if we try to read the erased pages.
> 
> >> Ideally, any filesystem would mark it as a bad block 
> > 
> > That's the point - no. This is normal on modern flashes.
> > 
> > I think one solution could be that you make your check more
> > sophisticated. You check for 0xFFs, if this is not true, you see is this
> > "almost all 0xFFs" and count amount of non-0xFF bits. If the count is,
> > say, 2, you assume this page contains all 0xFFs plus 2 bit-flips. But
> > I'm not sure it would work.
> > 
> > Anyway, If you do not care about such bit-flips for your SoC - fine. I
> > just wanted you to understand and accept the issue and write about it in
> > the comment. And I also wanted you to _not_ do expensive 0xFF comparison
> > every time - but it seems you accepted this :-)
> > 
> 
> Yes, I had to accept this :-)
> The flip side is that the hardware itself should not report errors when it 
> reads all ff data and ff ecc..It should assume it as an erased page and not 
> report any errors
 
Hello Vipin,

Did you consider this idea: if you have an unused byte available in oob,
program it to 0x00 when a page is programmed.

That way, you just need to check a single byte when you read a page in order
to distinguish erased pages from programmed pages. And by counting the number
of 1s in the byte, you can be robust to bitflips.

As a special refinement, you could also "cleanup" pages detected as erased, in
order to iron out possible bitflips.

I think that this method is used by Micron for their internal on-die ecc engine:
they add a parity byte (0x00 or 0x01) to their BCH code, which can be used to:

1) detect failures (using parity) when the max error count is reached
2) distinguish between erased and programmed pages

Best Regards,

Ivan
