Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Yani-00027J-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Jan 2003 23:48:58 +0000
Date: Wed, 15 Jan 2003 01:19:30 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Simon Evans <spse@secret.org.uk>, linux-mtd@lists.infradead.org
Subject: Re: default readv/writev functions
Message-ID: <20030115001930.GD19834@wohnheim.fh-wedel.de>
References: <20030114214510.GC19834@wohnheim.fh-wedel.de> <E18XNfT-0003Sp-00@spoinky.renegade.org.uk> <5351.1042586313@passion.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5351.1042586313@passion.cambridge.redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, 14 January 2003 23:18:33 +0000, David Woodhouse wrote:
> 
> joern@wohnheim.fh-wedel.de said:
> >  IMHO this is the wrong place. This should go into drivers/mtd/chips/
> > cfi_cmdset*.c.
> 
> I disagree. All chips -- or at least all NOR chips -- are going to want to
> use the same implmementation it because there's almost no point in actually
> having their own.

How about the STMicro flashes with built-in ecc checks? Write less
than 8 bytes per vector element and you're dead.
Other than that, you are right. A central version is better for almost
all chips.

> Maybe having it in chips/chipreg.c makes almost as much sense, but there 
> are standalone devices like the LART driver which would want it.

Makes sense.

Jörn

-- 
But this is not to say that the main benefit of Linux and other GPL
software is lower-cost. Control is the main benefit--cost is secondary.
-- Bruce Perens
