Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cvxgx-0005PS-GM
	for linux-mtd@lists.infradead.org; Tue, 01 Feb 2005 08:03:41 -0500
Date: Tue, 1 Feb 2005 14:03:15 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20050201130315.GA11055@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.61.0501311010180.3552@localhost.localdomain>
	<1107184897.7567.20.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.61.0501311038140.3730@localhost.localdomain>
	<Pine.LNX.4.58.0501311553590.17207@phoenix.infradead.org>
	<Pine.LNX.4.61.0501311109050.13936@localhost.localdomain>
	<20050131163919.GH6694@wohnheim.fh-wedel.de>
	<1107217171.783.332.camel@baythorne.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1107217171.783.332.camel@baythorne.infradead.org>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>,
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

On Tue, 1 February 2005 00:19:31 +0000, David Woodhouse wrote:
> On Mon, 2005-01-31 at 17:39 +0100, Jörn Engel wrote:
> > This allows different people with different taste to specify numbers
> > in various simple formats.  If you think you can improve on this,
> > please send me a patch.
> 
> It is wrong to interpret 'k' 'M' and 'G' as anything other than 10^3,
> 10^6 or 10^9 respectively. If you have to do it to support a legacy
> interface like slram, that's vaguely acceptable. No more, though.

Misunderstanding.  Nowhere do I accept 'k' without 'i' and nowhere do
I use 10^[369].  Everything is good. :)

Jörn

-- 
Victory in war is not repetitious.
-- Sun Tzu
