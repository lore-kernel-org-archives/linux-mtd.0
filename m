Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EG5AA-0004g2-Tj
	for linux-mtd@lists.infradead.org; Thu, 15 Sep 2005 21:37:24 -0400
Message-ID: <432A21BD.1030008@mvista.com>
Date: Thu, 15 Sep 2005 18:37:01 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <87ek7qpgfm.wl%kletschke@synertronixx.de>
	<4329A39B.3090503@mvista.com>
	<20050915180816.GB9974@wohnheim.fh-wedel.de>
In-Reply-To: <20050915180816.GB9974@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: How to cope with locked flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn Engel wrote:

> Next best thing, imo, would be the mtd mapping driver.  JFFS2 should
> stay clear of this, if possible.  We should aim to isolate hardware
> stuff to drivers/mtd/ and keep fs/* unaware.  Some things like wbuf
> require fs knowledge, but unlock doesn't.

Last time I sent a chip-driver-level patch (which knows the power-up 
locking behavior for the particular chips, it was rather ugly since it 
needed a notifier to know when writeable partitions were added), at 
which time the JFFS2 alternative was suggested.  An explicit call from 
the map driver, after parititions are registered, to the chip driver 
should work, avoiding the need for a notifier, and the map driver has 
the "master" struct mtd handle needed for info on the locking behavior 
of the chip (unlock is slow on some chips, best avoided if not needed). 
  I'll float a patch soon.

-- 
Todd
