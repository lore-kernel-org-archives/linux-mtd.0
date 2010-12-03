Received: from mail-out.m-online.net ([212.18.0.10])
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1POT6T-0000Dc-EL
	for linux-mtd@lists.infradead.org; Fri, 03 Dec 2010 10:43:03 +0000
Date: Fri, 3 Dec 2010 11:41:57 +0100
From: Anatolij Gustschin <agust@denx.de>
To: dedekind1@gmail.com
Subject: Re: UBIFS partition on NOR flash not mountable after power cut test
Message-ID: <20101203114157.5edaf24c@mw.dip.t-dialin.net>
In-Reply-To: <1291372085.2365.49.camel@localhost>
References: <20101129195014.19224240@wker> <20101201130534.5b95ce83@wker>
	<20101201164447.2215bc58@wker> <1291264926.14534.32.camel@koala>
	<20101203110719.3a9d14f2@wker> <1291372085.2365.49.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Detlev Zundel <dzu@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 03 Dec 2010 12:28:05 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Fri, 2010-12-03 at 11:07 +0100, Anatolij Gustschin wrote:
> > UBI: scrubbed PEB 149 (LEB 0:19), data moved to PEB 40
> > 
> > My question is: should this PEB really be preserved? I think, no.
> > It was prepared for erasure and would be entirely erased if no
> > interruption would occur.
> 
> Well, in general, my thinking is, if only the EC header is corrupted, we
> do not know why - may be this was just because of some bit-flips or
> radiation, and UBI better preserves it, just in case. I mean, there is a
> risk to destroy useful data otherwise.
> 
> Then the upper layer SW like UBIFS should know what it was erasing, and
> should re-issue the erasure. This is also a requirement made by the
> "unstable bits" problem Matthiew found on NAND, and challenged me with.
> 
> To put is simple: I think it is saver for UBI to preserve it. Upper
> layers will erase it again if it is not needed.

OK, thanks for the clarification!

Anatolij
