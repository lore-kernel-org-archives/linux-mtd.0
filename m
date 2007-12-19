Date: Wed, 19 Dec 2007 10:49:29 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Limited support of NAND features in MTD.
In-Reply-To: <1198001672.2590.35.camel@shinybook.infradead.org>
Message-ID: <Pine.LNX.4.64.0712191046130.14911@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0712121107010.19025@pentafluge.infradead.org>
	<20071218142335.GD1741@lazybastard.org>
	<Pine.LNX.4.64.0712181450540.31218@pentafluge.infradead.org>
	<20071218151800.GG1741@lazybastard.org>
	<20071218165758.GA11634@old.davidb.org>
	<20071218165648.GH1741@lazybastard.org>
	<1198001672.2590.35.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1831524198-1698332949-1198061369=:14911"
Cc: David Brown <davidb@davidb.org>,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1831524198-1698332949-1198061369=:14911
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT

Hi David,
> 
> On Tue, 2007-12-18 at 17:56 +0100, Jörn Engel wrote:
> > On Tue, 18 December 2007 08:57:58 -0800, David Brown wrote:
> > > 
> > > One problem with the on-chip copy is that ECC doesn't get corrected.  If
> > > there are errors on readback, it will get written that way, and errors
> > > would accumulate.
> > 
> > Ouch!  Such an implementation would indeed make this whole business
> > pointless.
> 
> That's fairly much been my conclusion every time I've looked at the new
> features we haven't yet bothered to support. Partial page read also
> suffers from lack of ECC.
Hmm I did not heard about this. Could you please give more details on how 
partial page read can suffer from lack of ECC?

Thanks,
Alexey
---1831524198-1698332949-1198061369=:14911--
