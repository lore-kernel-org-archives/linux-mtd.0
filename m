Subject: Re: Limited support of NAND features in MTD.
From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1198065443.18962.40.camel@sauron>
References: <Pine.LNX.4.64.0712121107010.19025@pentafluge.infradead.org>
	<20071218142335.GD1741@lazybastard.org>
	<Pine.LNX.4.64.0712181450540.31218@pentafluge.infradead.org>
	<20071218151800.GG1741@lazybastard.org>
	<20071218165758.GA11634@old.davidb.org>
	<20071218165648.GH1741@lazybastard.org>
	<1198001672.2590.35.camel@shinybook.infradead.org>
	<Pine.LNX.4.64.0712191046130.14911@pentafluge.infradead.org>
	<1198061571.13978.733.camel@pmac.infradead.org>
	<1198065443.18962.40.camel@sauron>
Content-Type: text/plain
Date: Wed, 19 Dec 2007 12:47:45 +0000
Message-Id: <1198068466.13978.738.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Brown <davidb@davidb.org>,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	linux-mtd@lists.infradead.org, Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-12-19 at 13:57 +0200, Artem Bityutskiy wrote:
> On Wed, 2007-12-19 at 10:52 +0000, David Woodhouse wrote:
> > On Wed, 2007-12-19 at 10:49 +0000, Alexey Korolev wrote:
> > > Hmm I did not heard about this. Could you please give more details on
> > > how partial page read can suffer from lack of ECC?
> > 
> > If your ECC covers the whole page, you have to read the whole page in
> > order to check ECC.
> > 
> > Of course, if you do ECC in sub-pages in the first place, you can read
> > only a single ECC block. But you still can't just read arbitrary byte
> > ranges.
> 
> Sure, but as the guys showed, even this gives substantial JFFS2
> performance growth. Providing their figures are correct, subpage reads
> are more then worth using.

Yeah, that part makes sense.

-- 
dwmw2
