Received: from [66.220.10.164] (helo=mail.rinconhosting.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190kfu-0005ya-N9
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 17:01:18 +0100
Received: from dirt ([66.68.146.73])
        by mail.rinconhosting.com (Merak 5.5.7) with SMTP id HUB73912
        for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 08:03:25 -0800
Date: Wed, 2 Apr 2003 09:55:00 -0600
From: Earl Manning <EManning@PRISMIQ.com>
To: linux-mtd@lists.infradead.org
Message-Id: <20030402095500.2672a730.EManning@PRISMIQ.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: issue with eraseall
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am using the MTD stuff with a Samsung NAND chip and all is going well, except that I had to change a line in the eraseall program.  As it turns out the clean marker written by the eraseall program puts sizeof( struct jffs2_unknown_node ) [12 bytes] into the totlen element.  When jffs2 tries to mount the now blank partition, the cleanmarker check fails because the value is not 8.

In my implementation I just changed the value written by eraseall to be 8.  

The offending pieces of code are:

	util/eraseall.c:84
	fs/jffs2/wbuf.c:671-675

Is there a better place to post this information?

Thanks,
Earl Manning
 
