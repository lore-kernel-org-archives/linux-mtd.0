Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16A6PA-0002UZ-00
	for <linux-mtd@lists.infradead.org>; Sat, 01 Dec 2001 09:25:52 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <IGEFJKJNHJDCBKALBJLLEECDFAAA.joakim.tjernlund@lumentis.se> 
References: <IGEFJKJNHJDCBKALBJLLEECDFAAA.joakim.tjernlund@lumentis.se> 
To: joakim.tjernlund@lumentis.se
Cc: linux-mtd@lists.infradead.org
Subject: Re: Fwd: Cache mappings and invalidate 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 01 Dec 2001 09:36:11 +0000
Message-ID: <15684.1007199371@redhat.com>
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

joakim.tjernlund@lumentis.se said:
> Can it be the MV kernel?

I don't see why.

> I am trying to get 2.4.16-pre1 from ppclinux running but I get a lot
> of oops messages( see below). Its very easy to generate this opps,
> just mount JFFS2 and copy a file a few times. 

It's dying in lumentis_write - that's your map driver, isn't it? Check the 
code at 0xc00b12e8, compare the register it's dereferencing with the 
address it's _supposed_ to be using, etc. 

Check bus timings, etc. 

--
dwmw2
