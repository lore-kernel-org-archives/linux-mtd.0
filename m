Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D8GAc-00040i-WE
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2005 06:13:07 -0500
Date: Mon, 7 Mar 2005 12:13:07 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Gareth Bult <gareth@linux.co.uk>
Message-ID: <20050307111307.GA9597@wohnheim.fh-wedel.de>
References: <1110043569.11425.63.camel@squizzey.bult.co.uk>
	<20050307110413.GD2198@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20050307110413.GD2198@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Re; MTD (2) Block Driver broken
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 7 March 2005 12:04:13 +0100, Jörn Engel wrote:
> > 
> > It appears that someone has "cleaned up" this driver and it now appears
> > as an option in the standard kernel tree for 2.6.11.
> > 
> > Unfortunately it doesn't appear to work. As soon as you mount a JFFS2
> > filesystem on it and try to write data, corruption sets in resulting is
> > a fairly sharp system crash.

Btw, it is interesting to note that noone has sent me bug reports
before.  Apparently, 2.6.<final> is getting *much* more testing than
mtd cvs, -mm, -bk* and -rc* together.

Jörn

-- 
I can say that I spend most of my time fixing bugs even if I have lots
of new features to implement in mind, but I give bugs more priority.
-- Andrea Arcangeli, 2000
