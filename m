Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FftHp-0006im-H5
	for linux-mtd@lists.infradead.org; Tue, 16 May 2006 02:44:11 -0400
Date: Tue, 16 May 2006 08:43:59 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Alexander Belyakov <alexander.belyakov@intel.com>
Message-ID: <20060516064359.GB18958@wohnheim.fh-wedel.de>
References: <F048F58F304F0040BC3E937DE4E231E701F9F027@NNSMSX401>
	<20060515122535.GA26656@wohnheim.fh-wedel.de>
	<44697264.8040509@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44697264.8040509@intel.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: mtdconcat NAND/Sibley support (revised)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 16 May 2006 10:34:12 +0400, Alexander Belyakov wrote:
> 
> One of my mailers corrupts headers, so messages are rejected by MTD list 
> admin. Another one deals with headers, but converts tabs to whitespaces. 
> And I don't know how to fix them at the moment. Sorry.
> 
> So I'm attaching patch file to this message to be sure it will not get 
> corrupted.

I heard a lot of people are fairly happy with their gmail account for
mailing list usage.  If you want to try it, you can have an invitation
from me.  My personal setup is to use mutt.  Text mailers are not
everyones cup of tea, but they tend to just work.

There are three cases of whitespace corruption left.  If you're using
vim, you could add this to your .vimrc:

" Private macros
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/
syntax on

It will highlight them to you.

Jörn

-- 
Optimizations always bust things, because all optimizations are, in
the long haul, a form of cheating, and cheaters eventually get caught.
-- Larry Wall 
