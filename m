Received: from sonolo.xs4all.nl ([80.126.206.91] helo=sendmail.metro.cx)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CaGyf-00063x-8U
	for linux-mtd@lists.infradead.org; Fri, 03 Dec 2004 12:12:18 -0500
Date: Fri, 3 Dec 2004 18:11:41 +0100
From: "K.F.J. Martens" <gmc@metro.cx>
To: Ben Dooks <ben@fluff.org.uk>
Message-ID: <20041203171141.GE2959@metro.cx>
References: <20041202225607.GH3233@metro.cx>
	<20041203004601.GA29522@home.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20041203004601.GA29522@home.fluff.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Horrible Bug? AMD29LV400BB with mtd in 2.6.10rc2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ben,

You are everywhere :)

On Fri, Dec 03, 2004 at 12:46:01AM +0000, Ben Dooks wrote:
> On Thu, Dec 02, 2004 at 11:56:07PM +0100, K.F.J. Martens wrote:
> > If I reverse them like so:
> > 
> > 
> >                         [0] = MTD_UADDR_0x0555_0x02AA,  /* x8 */
> >                         [1] = MTD_UADDR_0x0AAA_0x0555,  /* x16 */
> > 
> 
> There has been some fixing in the jedec and similar probe code
> to fix the use of the fields of device width / overlap due to
> incorrect addressing being used for the chip commands. 

Meaning that a patch is indeed being submitted right now? It can be
confusing though, how the terms x8 and x16 are used in the datasheets et
al. 

Kind regards,

Koen


-- 
K.F.J. Martens, Sonologic, http://www.sonologic.nl/
Networking, embedded systems, unix expertise, artificial intelligence.
Public PGP key: http://www.metro.cx/pubkey-gmc.asc
Wondering about the funny attachment your mail program
can't read? Visit http://www.openpgp.org/
