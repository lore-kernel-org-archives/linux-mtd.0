Received: from f62.law11.hotmail.com ([64.4.17.62] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Apmz-00022s-Hs
	for <linux-mtd@lists.infradead.org>; Wed, 30 Apr 2003 12:30:17 +0100
From: "J B" <mad_flasher@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Wed, 30 Apr 2003 06:29:57 -0500
Mime-Version: 1.0
Message-ID: <Law11-F625OmHBewRNS00016c03@hotmail.com>
Content-Type: text/plain; format=flowed
Subject: moving MTD partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Someone asked me the following question the other day, and my initial 
response was no.  But I wanted to ask the MTD community and see if there 
were any ideas.

"The basic question is if it is feasible to resize (smaller or larger) a 
jffs2 filesystem / mtd block device over flash and maintain the existing 
contents. Copying the contents out and then back again is not an option (not 
enough space)."

This particular user doesn't have any non-partitioned flash space, so making 
one partition larger implies that another gets smaller.  They are assuming 
that the partition that needs to be smaller has some empty space in it.  
Otherwise, the whole maintaining the contents part of their question is 
invalid since you cant shrink a partition that is full without losing data.

So, any ideas?

Thanks,
J





_________________________________________________________________
Tired of spam? Get advanced junk mail protection with MSN 8. 
http://join.msn.com/?page=features/junkmail
