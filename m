Received: from e4.ny.us.ibm.com ([32.97.182.144])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CvfMW-0001q4-1k
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 12:29:23 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e4.ny.us.ibm.com (8.12.10/8.12.10) with ESMTP id j0VHTHFM014578
	for <linux-mtd@lists.infradead.org>; Mon, 31 Jan 2005 12:29:17 -0500
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j0VHTHEF128064
	for <linux-mtd@lists.infradead.org>; Mon, 31 Jan 2005 12:29:17 -0500
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j0VHTGdi018296
	for <linux-mtd@lists.infradead.org>; Mon, 31 Jan 2005 12:29:17 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501311722120.17207@phoenix.infradead.org>
References: <Pine.LNX.4.61.0501311010180.3552@localhost.localdomain>
	<1107184897.7567.20.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.61.0501311038140.3730@localhost.localdomain>
	<Pine.LNX.4.58.0501311553590.17207@phoenix.infradead.org>
	<Pine.LNX.4.61.0501311109050.13936@localhost.localdomain>
	<1107188578.21196.346.camel@tglx.tec.linutronix.de>
	<1107188815.19262.203.camel@hades.cambridge.redhat.com>
	<Pine.LNX.4.61.0501311145030.14092@localhost.localdomain>
	<Pine.LNX.4.58.0501311709530.17207@phoenix.infradead.org>
	<20050131172133.GJ6694@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501311722120.17207@phoenix.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Date: Mon, 31 Jan 2005 11:29:11 -0600
Message-Id: <1107192551.7567.31.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, tglx@linutronix.de,
	"Robert P. J. Day" <rpjday@mindspring.com>,
	MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: running out of space dd'ing JFFS2 image to /dev/mtdblock/0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-01-31 at 17:25 +0000, Artem B. Bityuckiy wrote:
> On Mon, 31 Jan 2005, [iso-8859-1] Jörn Engel wrote:
> 
> > On Mon, 31 January 2005 17:11:38 +0000, Artem B. Bityuckiy wrote:
> > > On Mon, 31 Jan 2005, Robert P. J. Day wrote:
> > > 
> > > > i agree completely, but i thought some of the recognized suffixes were
> > > > "KiB", "MiB" and so on.  anyway, i was pretty sure that even a
> > > > suggestion this innocuous was going to generate some discussion.
> > > Nobody told about not to use KiB/MiB. It wos told about not to us K and M, 
> > > like 10K, 100M. Use 10KiB, 100MiB instead.
> > 
> > What information does the "B" in "10KiB" contain?  And why is it "Ki"
> > instead of the correct "ki"?
> Hehe.
> 
> This is just widely used unit. And it is usually written like that. And 
> now most utilities work with such. But if one wants and thinks it is 
> reasonable, why not to use kib :-)

Because they aren't just commonly used units.  See:

http://physics.nist.gov/cuu/Units/binary.html

josh
