Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 193FVw-0007Ge-Db
	for <linux-mtd@lists.infradead.org>; Wed, 09 Apr 2003 14:21:21 +0100
Date: Wed, 9 Apr 2003 15:21:22 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: John Burch <jburch@vincisystems.com>
Message-ID: <20030409132122.GA11970@wohnheim.fh-wedel.de>
References: <20030407195308.GA28178@wohnheim.fh-wedel.de>
	<000501c2fe99$509aaa40$1200a8c0@JOHNB>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000501c2fe99$509aaa40$1200a8c0@JOHNB>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: 'Mtd' <linux-mtd@lists.infradead.org>
Subject: Re: Problems making jffs2 utils
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 9 April 2003 09:09:54 -0400, John Burch wrote:
> 
> 1.  Even to build 'erase' only, one still needs zlib?

No, that shouldn't be the case.

> 2.  I can't seem to track down the 'common zlib patch' you refer to.  Is
> this a special patch in support of mtd, or a general patch for zlib
> (such that if I get the latest zlib I wouldn't need the patch)?

Dammit! I was stupid, confused or worse and didn't read the work
"utils" in your mail. Others got it right, so I hoped this would go
unnoticed. You didn't have to rub it in.

Forget the common zlib, you only need it for the kernel.

> 3.  Is the patch particular to a specific version of zlib?
> 4.  Can my target zlib version differ from the host zlib version without
> causing problems?

see above. Sorry about that.

Jörn

-- 
And spam is a useful source of entropy for /dev/random too!
-- Jasmine Strong
