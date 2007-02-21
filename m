Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HJsoT-0004pH-Rn
	for linux-mtd@lists.infradead.org; Wed, 21 Feb 2007 09:53:34 -0500
Date: Wed, 21 Feb 2007 14:47:54 +0000
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Jason Lunz <lunz@falooley.org>
Subject: Re: [PATCH] block2mtd oops in erase function.
Message-ID: <20070221144754.GC464@lazybastard.org>
References: <1171920579.4996.8.camel@celeron>
	<20070219222041.GE7813@lazybastard.org>
	<20070219223023.GF7813@lazybastard.org>
	<1171938429.2859.2.camel@NF.local>
	<20070220105306.GC10455@lazybastard.org>
	<20070220213528.GA7764@metaxa.reflex>
	<20070220215513.GA13493@lazybastard.org>
	<20070221030254.GA11044@avocado.homenet>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070221030254.GA11044@avocado.homenet>
Cc: Felix Fietkau <nbd@openwrt.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 20 February 2007 22:02:54 -0500, Jason Lunz wrote:
> On Tue, Feb 20, 2007 at 09:55:13PM +0000, Jörn Engel wrote:
> > Is it ok if I just pass this URL?
> > http://kernel.org/git/?p=linux/kernel/git/joern/misc.git
> > 
> > The top three patches are test-worthy.
> 
> I'm running with all three. everything seems fine.

Great!

> Mount time of a ~56M jffs2 partition went from ~72s to ~54s.

Ouch!  While this is a significant improvement, 54s is still quite bad.
The 512MiB partition on the OLPC is mounting in ~3.4s with JFFS2 and
~60ms with LogFS.  Imo 3.4s is already bad, and 54s is way beyond.

Now where is time lost?  One candidate is erase block summary, enabling
it usually gives roughly a 6x performance improvement.  That would get
you down to ~9s.

Another next thing I suspect is the erase size.  The default is 4KiB,
which is rather small.  Can you try setting it to 64KiB or maybe even
128KiB?

Instead of passing "block2mtd=/dev/foo", you can pass
"block2mtd=/dev/foo,64KiB" if my memory doesn't fail me.

Changing the erase size to a multiple of the previous erase size should
be fine with JFFS2 (a smaller erase size could lead to data loss), but
you likely won't get better performance unless you recreate the
filesystem.  Maybe something like

$ mount /dev/mtdX /mnt -t jffs2
$ (cd /mnt && tar cvpf /tmp/foo.tgz .)
$ umount /mnt
$ flash_eraseall /dev/mtdX
$ mount /dev/mtdX /mnt -t jffs2
$ (cd /mnt && tar vpf /tmp/foo.tgz)
$ umount /dev/mtdX

Unless you are happy with the current mount time, of course.  Noone is
forcing you to change anything.

Jörn

-- 
Do not stop an army on its way home.
-- Sun Tzu
