Received: from co202.xi-lite.net ([149.6.83.202])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RGTIM-0001wm-Uc
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2011 10:22:47 +0000
Date: Wed, 19 Oct 2011 12:22:35 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: UBIFS recovery fails
Message-ID: <20111019102235.GA13501@parrot.com>
References: <4E9C2DAC.7090109@swissonline.ch> <1318882668.2172.10.camel@koala>
	<225442585F89274EA3A62F88671ECBAC0D33C8E2@prod-svr-1.intranet.str.ca>
	<20111018145413.GA8576@parrot.com>
	<225442585F89274EA3A62F88671ECBAC0D33C8EB@prod-svr-1.intranet.str.ca>
	<20111018153236.GA10466@parrot.com>
	<225442585F89274EA3A62F88671ECBAC0D33C8F2@prod-svr-1.intranet.str.ca>
	<Pine.LNX.4.64.1110190845390.30940@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.1110190845390.30940@lnxricardw.se.axis.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	=?utf-8?Q?Jean-S=C3=A9bastien?= Gagnon <jsgagnon@vizimax.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 19, 2011 at 07:50:42AM +0100, Ricard Wanderlof wrote:
> That said, it seems to me that power failure during write causing 
> excessive bitflips would be a problem with any flash, not just MLC or 
> modern "unstable" SLC. Ivan, you said you've only seen it with modern 
> flashes, not older SLC ?

Excessive bitflips after a power failure happen on all types of flash (SLC,
MLC, even NOR flash); it is an expected possible consequence of the power cut.
It is not really a problem as long as what you read in flash is _stable_.

On modern SLCs (at least I first saw it on 34 nm SLC flash), those bitflips
can be _unstable_, i.e. they can appear and disappear randomly as you read
pages. I experienced this phenomenon only on pages which were being programmed
or erased during a power cut.

BR,
--
Ivan
