Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CvfF0-0001Qq-W7
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 12:21:36 -0500
Date: Mon, 31 Jan 2005 18:21:33 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050131172133.GJ6694@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.61.0501311010180.3552@localhost.localdomain>
	<1107184897.7567.20.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.61.0501311038140.3730@localhost.localdomain>
	<Pine.LNX.4.58.0501311553590.17207@phoenix.infradead.org>
	<Pine.LNX.4.61.0501311109050.13936@localhost.localdomain>
	<1107188578.21196.346.camel@tglx.tec.linutronix.de>
	<1107188815.19262.203.camel@hades.cambridge.redhat.com>
	<Pine.LNX.4.61.0501311145030.14092@localhost.localdomain>
	<Pine.LNX.4.58.0501311709530.17207@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0501311709530.17207@phoenix.infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>, tglx@linutronix.de,
	MTD mailing list <linux-mtd@lists.infradead.org>,
	"Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: running out of space dd'ing JFFS2 image to /dev/mtdblock/0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 31 January 2005 17:11:38 +0000, Artem B. Bityuckiy wrote:
> On Mon, 31 Jan 2005, Robert P. J. Day wrote:
> 
> > i agree completely, but i thought some of the recognized suffixes were
> > "KiB", "MiB" and so on.  anyway, i was pretty sure that even a
> > suggestion this innocuous was going to generate some discussion.
> Nobody told about not to use KiB/MiB. It wos told about not to us K and M, 
> like 10K, 100M. Use 10KiB, 100MiB instead.

What information does the "B" in "10KiB" contain?  And why is it "Ki"
instead of the correct "ki"?

Robert: please don't just sit there and wait for someone else to do
your work.  Send a patch.  If it's wrong, people will comment.  Right
now, this discussion is completely academic.

Jörn

-- 
Measure. Don't tune for speed until you've measured, and even then
don't unless one part of the code overwhelms the rest.
-- Rob Pike
