Received: from mailout.fastq.com ([204.62.193.66])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19D4LA-0000Gw-Re
	for <linux-mtd@lists.infradead.org>; Tue, 06 May 2003 16:26:49 +0100
Received: from aquaman (foobar@russ.gothicfury.com [65.39.81.227])
	h46FR1V35077	for <linux-mtd@lists.infradead.org>;
	Tue, 6 May 2003 08:27:01 -0700 (MST)
	(envelope-from Russ.Dill@asu.edu)
From: Russ Dill <Russ.Dill@asu.edu>
To: Eric DEJONC <eric.dejonc@thales-e-transactions.com>
In-Reply-To: <3EB7AA75.7B0DACF5@thales-e-transactions.com>
References: <3EB7A6AC.ED381D4C@thales-e-transactions.com>
	 <20030506122442.GD15261@wohnheim.fh-wedel.de>
	 <3EB7AA75.7B0DACF5@thales-e-transactions.com>
Message-Id: <1052234804.2996.3.camel@gobbles>
Mime-Version: 1.0
Date: 06 May 2003 08:26:45 -0700
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Subject: Re: reverse mkfs.jffs2
Reply-To: Russ.Dill@asu.edu
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-05-06 at 05:28, Eric DEJONC wrote:
> Well, thank you, I did not think to loopback, thats a great idea. I'm gonna
> test. the only little problem is  that the 10M jffs2 file should take a long
> time to be sent on the board via a serial port (the only one I can use).
> 

I don't think you caught on to what mtdram is. mtdram lets you create an
mtdblock device on you *HOST* system. you don't need to send it to your
board via serial.

> > > I was wondering if someone had already done a prog that reverse
> > > mkfs.jffs2?
> > >
> > > I'd like to open a jffs2 ramdisk made by someone else, but I don't have
> > > enough space on my flash disk. So I would like to open it, but from the
> > > host machine that doesn't handle  jffs2.
> >
> > Use one of mtdram or mtdblock and use that. You can make a block
> > device from your image with loopback. Should be enough, I guess.
> >
-- 
Russ Dill <Russ.Dill@asu.edu>
