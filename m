Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I1fhD-0000SU-0j
	for linux-mtd@lists.infradead.org; Fri, 22 Jun 2007 05:44:54 -0400
Date: Fri, 22 Jun 2007 11:39:47 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Martin =?utf-8?Q?D=C3=A4umler?= <martin.daeumler@s2003.tu-chemnitz.de>
Subject: Re: Real-time flash simulator
Message-ID: <20070622093945.GC17988@lazybastard.org>
References: <467B77F7.2000007@informatik.tu-chemnitz.de>
	<1182499773.4403.76.camel@sauron>
	<467B952E.30308@informatik.tu-chemnitz.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <467B952E.30308@informatik.tu-chemnitz.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 22 June 2007 11:23:58 +0200, Martin Däumler wrote:
> 
> The overall goal of my work is to develop respectively to examine the
> feasibility of a scaleable flash file system on raw flash. Like
> mentioned on the MTD web site this might be very difficult because
> of wear-levelling and bad block management. In my opinion, for real-time
> issues it is necessary to avoid garbage collection. So, a layer between
> file system and raw flash, performing wear-levelling and bad block
> management could be one approach to be investigated furhter. The
> real-time flash simulator is just one step in this direction.

What makes the "layer between file system and raw flash" so special, if
you don't mind me asking?  If wear-leveling and bad block management
causes latency, that latency does not go away by moving it to some other
layers.

Jörn

-- 
Anything that can go wrong, will.
-- Finagle's Law
