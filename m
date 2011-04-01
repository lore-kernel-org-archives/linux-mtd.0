Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5fBH-00025N-JB
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 14:18:32 +0000
Subject: Re: [PATCH] Newly erased page read workaround
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
In-Reply-To: <20110401140429.GB19151@parrot.com>
References: <c7baa4a77775b54f2ef8450d8d1f44d1dc011b41.1298527669.git.viresh.kumar@st.com>
	<1301579475.2828.82.camel@localhost> <4D95708A.7080204@st.com>
	<1301640710.2789.11.camel@localhost> <4D958DC2.5000607@st.com>
	<1301647180.2789.35.camel@localhost> <4D9595AB.1050604@st.com>
	<20110401121447.GA19151@parrot.com>
	<1301663081.2789.65.camel@localhost>
	<20110401140429.GB19151@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Apr 2011 17:16:01 +0300
Message-ID: <1301667361.2789.84.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vipin Kumar <vipin.kumar@st.com>, Viresh KUMAR <viresh.kumar@st.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"David.Woodhouse@intel.com" <David.Woodhouse@intel.com>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-04-01 at 16:04 +0200, Ivan Djelic wrote:
> On Fri, Apr 01, 2011 at 02:04:41PM +0100, Artem Bityutskiy wrote:
> > On Fri, 2011-04-01 at 14:14 +0200, Ivan Djelic wrote:
> > > Did you consider this idea: if you have an unused byte available in oob,
> > > program it to 0x00 when a page is programmed.
> > 
> > I guess this depends on the the controller, but probably this could mean
> > a substantial write  overhead, not?
> 
> Sorry, my explanation was probably not very clear.
> 
> When you program a page, you send data and oob contents to your NAND controller.
> The controller may modify oob contents to add ECC bytes, in a more or less
> automatic way, then it will physically program the page.

Right, I just assumed that some controllers allow you to send only data,
and programming OOB would be a separate operation. But if this is not
the case in ST's HW - then this sounds like a very good approach!

> > > That way, you just need to check a single byte when you read a page in order
> > > to distinguish erased pages from programmed pages. And by counting the number
> > > of 1s in the byte, you can be robust to bitflips.
> > 
> > Could you please explain some more what do you mean? So you write the
> > 0x00 byte. Then when you read, you count the number of "1" bits in the
> > byte. And what exactly this count gives you and to which bitflips you
> > become robust?
> 
> I meant that you can be robust to bitflips occurring in the marker byte itself.
> If you just compare the marker byte to 0x00 or 0xff, you will not be able to
> handle values such as 0x01 or 0x7f (occuring because of bitflips).
> You can count the number of 1s in the marker, and decide for instance:
> count < 4   => marker is 0x00
> count >= 4  => marker is 0xff
> That way, the marker is reliable up to 3 bitflips (which is very improbable in
> the same byte).

I see.

I'm curious, if the OOB area is so unreliable, how can we trust it to
store our ECC? We need a mini-ECC for the ECC then?

> Let us assume Vipin implements the marker idea. He reads a page, and the marker
> test tells him the page has never been programmed. So he will avoid performing
> ECC correction on that page. But that page could nevertheless contains bitflips
> (i.e. not all bytes equal to 0xFF). He could memset page data with 0xFFs to
> blindly remove possible bitflips, as if the ECC engine had fixed them.

Ah, I see. Although hiding bit-flips from upper layers might be not the
best idea sometimes.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
