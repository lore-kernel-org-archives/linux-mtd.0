Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PszOt-0005HQ-5O
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 15:16:11 +0000
Date: Fri, 25 Feb 2011 16:14:50 +0100
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: CONFIG_MTD_NAND_VERIFY_WRITE with Software ECC
Message-ID: <20110225151450.GD21841@parrot.com>
References: <Pine.LNX.4.64.1102151355160.2784@lnxricardw.se.axis.com>
	<AANLkTimS2Dqn9W+1zMsb=wgQAPKZaPZ+UePUmAGbQLCz@mail.gmail.com>
	<Pine.LNX.4.64.1102151536400.2784@lnxricardw.se.axis.com>
	<AANLkTi=zwmN2T7T=dePB0PJk_+Ahdvzjrn9t-rA7TtVa@mail.gmail.com>
	<Pine.LNX.4.64.1102171013090.2784@lnxricardw.se.axis.com>
	<1298623342.2798.9.camel@localhost>
	<Pine.LNX.4.64.1102250956200.2784@lnxricardw.se.axis.com>
	<1298629762.2798.38.camel@localhost>
	<20110225113609.GB21841@parrot.com>
	<1298636539.2798.99.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1298636539.2798.99.camel@localhost>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	David Peverley <pev@sketchymonkey.com>,
	Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 25, 2011 at 12:22:19PM +0000, Artem Bityutskiy wrote:
> On Fri, 2011-02-25 at 12:36 +0100, Ivan Djelic wrote:
> > Right now, we implement a bitflip threshold, below which we correct ecc errors
> > without reporting them. When the bitflip threshold is reached, we report the
> > amount of corrected errors, triggering block scrubbing, etc.
> > This is not ideal, but it prevents UBI from torturing and marking too many
> > blocks as bad.
> 
> Hmm, what exactly the threshold you are implementing mean?

When errors are detected in a subpage, we correct them. If the error count is
less than or equal to a threshold (in our case 2), we clear it (i.e. we forget
how many errors we just corrected). We accumulate those error counts into the
global page error count which we return (from function nand.ecc.correct()).
It's just a hack, waiting for a better solution.

Ivan
