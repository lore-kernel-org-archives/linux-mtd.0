Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FdouZ-0000RM-BJ
	for linux-mtd@lists.infradead.org; Wed, 10 May 2006 09:39:43 -0400
Date: Wed, 10 May 2006 15:39:05 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Vitaly Wool <vwool@ru.mvista.com>
Message-ID: <20060510133905.GE31935@wohnheim.fh-wedel.de>
References: <4461B7CD.9010100@ru.mvista.com>
	<625fc13d0605100400t458ab59enbd36f70c90e10b2e@mail.gmail.com>
	<4461CC8C.6010105@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4461CC8C.6010105@ru.mvista.com>
Cc: Josh Boyer <jwboyer@gmail.com>,
	Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: Re: [RFC] read-only filesystem support for NAND flash devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 10 May 2006 15:20:44 +0400, Vitaly Wool wrote:
> Josh Boyer wrote:
>
> >Not quite the case.  You need bad block skipping, yes.  But NAND can
> >get bit flips in good blocks still.  How do you deal with that?  You
> >can't leave the block in that state forever because it will continue
> >to get bit flips and then your data will be unusable.
> Yep, I know about the issue. The recommended way to go here AFAIK is to 
> mark the block as bad and copy its contents to a free one.
> However, this will make mapping a lot more complicated so I'd like to go 
> another way, i. e. erasing and rewriting this very block, and if it 
> wears out, cache the data read from it and schedule moving the data 
> forward within the partition in a background. Does that make sense?

Or you could just ignore the issue.  The way I read it, your RFC is
basically "Don't do the real thing, just a quick hack to make it work
at all."  Which is perfectly fine to me.  It is not perfect, but that
is well documented and if people actually use it and care a lot about
some particular deficiency, you can solve it then.

Jörn

-- 
Anything that can go wrong, will.
-- Finagle's Law
