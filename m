Subject: Re: Limited support of NAND features in MTD.
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20071218165648.GH1741@lazybastard.org>
References: <Pine.LNX.4.64.0712121107010.19025@pentafluge.infradead.org>
	<20071218142335.GD1741@lazybastard.org>
	<Pine.LNX.4.64.0712181450540.31218@pentafluge.infradead.org>
	<20071218151800.GG1741@lazybastard.org>
	<20071218165758.GA11634@old.davidb.org>
	<20071218165648.GH1741@lazybastard.org>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Dec 2007 18:14:32 +0000
Message-Id: <1198001672.2590.35.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Brown <davidb@davidb.org>, linux-mtd@lists.infradead.org,
	Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 2007-12-18 at 17:56 +0100, Jörn Engel wrote:
> On Tue, 18 December 2007 08:57:58 -0800, David Brown wrote:
> > 
> > One problem with the on-chip copy is that ECC doesn't get corrected.  If
> > there are errors on readback, it will get written that way, and errors
> > would accumulate.
> 
> Ouch!  Such an implementation would indeed make this whole business
> pointless.

That's fairly much been my conclusion every time I've looked at the new
features we haven't yet bothered to support. Partial page read also
suffers from lack of ECC.

-- 
dwmw2
