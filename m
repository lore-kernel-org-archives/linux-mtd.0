Received: from [85.183.114.52] (helo=Dublin.logfs.org)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REit8-0006EW-Fp
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 14:37:31 +0000
Date: Fri, 14 Oct 2011 16:38:16 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: "Fache, Herve" <h-fache@ti.com>
Subject: Re: Make phram work with kernel cmdline args when built-in
Message-ID: <20111014143816.GA32633@logfs.org>
References: <CA+Xn3W3-JCqMKjiXi2cLCGm_bHtRx8RPsc9P5BoOS6YmbGZmHw@mail.gmail.com>
	<20111012164837.GA13691@logfs.org>
	<CA+Xn3W18bwZWzdjmRzEDUCqe3bVHnmW-7bJ_wvaoXpJxO1KmjQ@mail.gmail.com>
	<1318597412.12351.124.camel@sauron>
	<CA+Xn3W2P_+xdwwrvcBKREZmsj2O6=GOfyaywW-N2HhGwo0WzVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+Xn3W2P_+xdwwrvcBKREZmsj2O6=GOfyaywW-N2HhGwo0WzVg@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 14 October 2011 15:42:09 +0200, Fache, Herve wrote:
> 2011/10/14 Artem Bityutskiy <dedekind1@gmail.com>
> 
> > Please, send patches inline. Also, try to make sure you do not
> > have many of these #ifdef MODULE sections.
> 
> Also, I have tried to make my patch look like the other patch to block2mtd,
> as asked by Jörn, which explains the number of #ifdef MODULE sections...

If there were a way to get rid of the #ifdefs, I would certainly be in
favor of that.  While I am happy with the functional improvements, I
would be even happier if the code looked less scarred.

I wonder how everyone else does it.  Those two driver surely can't be
the only ones that depend on module parameters for initialization.

Jörn

-- 
Fools ignore complexity.  Pragmatists suffer it.
Some can avoid it.  Geniuses remove it.
-- Perlis's Programming Proverb #58, SIGPLAN Notices, Sept.  1982
