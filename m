Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15dsiP-0007KZ-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Sep 2001 13:20:33 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B937537.D636406C@dgt-lab.com.pl> 
References: <3B937537.D636406C@dgt-lab.com.pl>  <3B8CB316.4A421C81@dgt-lab.com.pl> <999074214.32409.1.camel@russ> <3B8B87A9.2F622A89@dgt-lab.com.pl> <999014039.27952.2.camel@russ> <3B8C86BD.5C4FBCF9@dgt-lab.com.pl> <999069428.31681.12.camel@russ> <3B8C9DC5.F3185B18@dgt-lab.com.pl> <21505.999075348@redhat.com> <25302.999077097@redhat.com> 
To: Wojciech Kromer <krom@dgt-lab.com.pl>
Cc: mtd <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slow:( 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 03 Sep 2001 13:26:32 +0100
Message-ID: <3238.999519992@redhat.com>
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

krom@dgt-lab.com.pl said:
>  OK, now I'm testing the ocelot's trick. But I do not understand it.

The idea is that read{8,16,32} and write{8,16,32} are used for commands and 
reading status, and should be uncached. copy_from() is used for copying 
data from the flash, and can be cached. We have to flush the cache any 
time a command is sent, because it could be a write or erase command.

This means that we don't get a lot of benefit from storing data in the 
cache for long periods of time (except maybe on read-only flashes), but at 
least we can burst-read to fill a cache line, if the hardware can 
do it.

Flushing the cache on every write cycle to the flash chip may be a little
excessive - perhaps the chip driver itself should have to explicitly flush
the cache when the data are actually likely to change - I'm not sure if
that'd be a win though.

--
dwmw2
