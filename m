Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A1jQq-0002LF-Is
	for <linux-mtd@lists.infradead.org>; Tue, 23 Sep 2003 10:26:05 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: joakim.tjernlund@lumentis.se
In-Reply-To: <IGEFJKJNHJDCBKALBJLLCEHKFPAA.joakim.tjernlund@lumentis.se>
References: <IGEFJKJNHJDCBKALBJLLCEHKFPAA.joakim.tjernlund@lumentis.se>
Message-Id: <1064309117.3793.45.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 23 Sep 2003 10:25:17 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: GC does not handle big syslog files
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-09-22 at 12:28 +0200, Joakim Tjernlund wrote:
> 1) Should I expect writes to hang while jffs2_gcd is "checking" a file?

Yes. We do it with the alloc_sem held. 

> 2) I think JFFS2 needs GC files even when there is plenty of room left in the
>    FS since fragmentation can get really bad. Comments?

Yeah. We already make the distinction between 'pristine' nodes -- this
which are the most efficient representation of the data -- and others.
We just need to start counting them separately rather than all together
as 'used' space, then using the 'non-pristine' space counts for deciding
when and what to GC.

-- 
dwmw2
