Received: from [216.40.225.16] (helo=www.webmanixhosting.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AEuzQ-0006UQ-Kt
	for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2003 18:24:16 +0000
From: "Dan Post" <djp.mtd@onemyth.net>
To: "Chuck Meade" <chuckmeade@mindspring.com>,
   "Karoliya,Abhishek" <Abhishek.Karoliya@fci.com>
Date: Wed, 29 Oct 2003 10:16:23 -0800
Message-Id: <20031029181623.M2380@onemyth.net>
In-Reply-To: <IIEEICKJLNEPBBDJICNGGEICEBAA.chuckmeade@mindspring.com>
References: 
	<903E17B6FF22A24C96B4E28C2C0214D7012BB2D8@sr-bng-exc01.int.tsbu.net>
	<IIEEICKJLNEPBBDJICNGGEICEBAA.chuckmeade@mindspring.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
cc: linux-mtd@lists.infradead.org
Subject: RE: Intel K3 Flash + MTD
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 26 Oct 2003 15:17:35 -0500, Chuck Meade wrote
> That sounds like the status bit that you are reading back.
> Most flashes give back status after you issue them commands
> (like all of your unlocks, for instance).  Usually you put them 
> back into "read mode" by writing a particular byte to them
> after reading the status.  Try writing an FF to the flash.
> Check your flash chip's datasheet for the exact sequence that
> you must use to put it back in read mode.

For K3's, writing an FF should work, though I don't know why it's coming up in
status mode.  I don't think that behavior is typical.  You probably should
check the datasheet.  Or it could be your bootloader that's setting it to
status mode (maybe not changing it to Read Array after a program or erase etc).

However, you should be aware that some NOR chips, such as Intel's L18/L30's,
are multi-partitioned and each partition must be set to read array mode... the
details of its multipartitioning can be very sticky, but very cool too...

Dan
