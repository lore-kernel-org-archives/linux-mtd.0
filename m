Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FYmOo-0003y6-67
	for linux-mtd@lists.infradead.org; Wed, 26 Apr 2006 11:58:03 -0400
Date: Wed, 26 Apr 2006 17:57:41 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Alexander Belyakov <alexander.belyakov@intel.com>
Message-ID: <20060426155741.GM29108@wohnheim.fh-wedel.de>
References: <F048F58F304F0040BC3E937DE4E231E701F5D409@NNSMSX401>
	<20060426141609.GG29108@wohnheim.fh-wedel.de>
	<444F9002.9060000@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <444F9002.9060000@intel.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: mtdconcat NAND/Sibley support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 26 April 2006 19:21:38 +0400, Alexander Belyakov wrote:
> Jorn Engel wrote:
> >
> >concat_writev() is far too complicated.  I have a patch somewhere that
> >adds a generic writev() function to every device.  Once that is in,
> >your patch should get a respin and be much simpler.
> >
> 
> Having generic writev() still requires concat_writev() to split the data 
> into several parts (in general case by number of subdevices). So I do 
> not see how concat_writev() could become simpler.

Fair.  Having writev() for the underlying devices doesn't buy you
much.

> In my patch you split data from downcoming vector into several  _equal_  
> page-sized chunks and write them by calling generic write().

Not sure whether the splitting makes much sense.  As long as you don't
cross a boundary, just send the whole vector to the subdevice.  And in
case of a boudary, there is no guarantee for it to reside on a page
boundary, so you currently have a bug anyway.  One that you'll quickly
hit on dataflash.

> >I didn't closely look at the rest of it but suspect similar things.
> 
> Why I'm not surprised here? :)

Either because
a) I'm lazy or
b) your code doesn't look inviting.

And just because I'm lazy doesn't imply anything about your code. :)

> Patch have nothing complex and have completely nothing new. Just fixes 
> some broken stuff.
> 
> Is it better to leave concatenation layer without any changes and only 
> compatible with NOR devices, despite mtdconcat.c file comments claim 
> that it does support NAND?

I'm not sure about your "nothing complex" statement, but fixing concat
is a worthy goal.  Hope you don't mind if I point out the questionable
parts of your patch.

Jörn

-- 
Linux [...] existed just for discussion between people who wanted
to show off how geeky they were.
-- Rob Enderle
