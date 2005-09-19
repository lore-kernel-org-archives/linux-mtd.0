Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHNdG-0002jE-HK
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2005 11:32:49 -0400
Date: Mon, 19 Sep 2005 17:32:17 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Marius Groeger <mgroeger@sysgo.com>
Message-ID: <20050919153217.GA26968@wohnheim.fh-wedel.de>
References: <432C2E6C.6050400@gmail.com>
	<20050919093300.GB21380@wohnheim.fh-wedel.de>
	<Pine.LNX.4.63.0509191622500.3180@mag.sysgo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.63.0509191622500.3180@mag.sysgo.com>
Cc: "David A. Braun" <braunster@gmail.com>, linux-mtd@lists.infradead.org,
	Robert Kaiser <rkaiser@sysgo.com>
Subject: Re: Command line parsing
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 19 September 2005 16:26:07 +0200, Marius Groeger wrote:
> On Mon, 19 Sep 2005, Jörn Engel wrote:
> >On Sat, 17 September 2005 10:55:40 -0400, David A. Braun wrote:
> >>
> >>Is there any particular reason parse_cmdline_partitions() in
> >>drivers/mtd/cmdlineparse.c doesn't completely setup the partition
> >>table(s) it builds? It fails to initialize the offsets and sizes of any
> >>partition tabled unless it is the one named by "master". This one has
> >>the offsets and lengths filled in but the others are left zero with the
> >>exception of partitions specified with "-" or SIZE_REMAINING. I would
> >>have expected all partitions described in the cmdline to be initialized
> >>if any are.
> >
> >Iirc, the code was written by someone at Sysgo, possibly Robert, and
> >hasn't been touched for quite a while.  So if you have any patches
> >that improve the situation for you, feel free to send them.
> 
> Acutally it was me :-), but someone decided to remove my name and just 
> leave in the reference to our company... Anyway you're right about my 
> not having touched that code. Looking at it briefly, though, I don't 
> really spot anything suspicous. Apart from the (potential) oddity that 
> the cmdline is saved and processed much later at a time the flash 
> hardware is actually, I don't see what is not initialized.

[ slightly off-topic ]

If you want your copyright line restored and don't have cvs access,
send me a patch.

For those less aware of how copyright law works:
The copyright itself is independent of some lines explicitly claiming
it for somebody.  So this is not about a legal issue, just politeness.

Jörn

-- 
I can say that I spend most of my time fixing bugs even if I have lots
of new features to implement in mind, but I give bugs more priority.
-- Andrea Arcangeli, 2000
