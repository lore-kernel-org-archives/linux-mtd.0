Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FBTkj-00005N-6v
	for linux-mtd@lists.infradead.org; Tue, 21 Feb 2006 04:24:18 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Robert Liu <robertliu@wiscore.com>
In-Reply-To: <43FA6A26.8000005@wiscore.com>
References: <43FA6A26.8000005@wiscore.com>
Content-Type: text/plain
Date: Tue, 21 Feb 2006 10:25:14 +0100
Message-Id: <1140513914.2480.861.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: do R/W tests on JFFS2 and suffer  segmentation fault
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-02-21 at 09:17 +0800, Robert Liu wrote:
> I am doing some read/write tests on JFFS2 partition, and find there may be
> a bug in jffs2_remove_from_hash_table().

Which kernel version ? Any patches related to MTD/JFFS2 applied ?

> Tests sometimes failed with segmentation fault.
> I set the JFFS2 debug level to 1, and add several debug infomation in 
> jffs2_remove_from_hash_table().
> It seems jffs2 try to remove an entry with prev is 0x200200 and next is 
> 0x100100.

Thats the list_head poison code (see include/linux/list.h
LIST_POISON1/2). The entry was removed before.

	tglx
