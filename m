Received: from isengard.yottayotta.com ([209.115.177.37])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 174ose-0003dn-00
	for <linux-mtd@lists.infradead.org>; Mon, 06 May 2002 21:14:44 +0100
Received: from fw-edm-dmz.yottayotta.com ([192.168.1.2] helo=edm-app01.yottayotta.com)
	by isengard.yottayotta.com with esmtp (Exim 3.33 #1)
	id 174oi2-0005wo-00
	for linux-mtd@lists.infradead.org; Mon, 06 May 2002 14:03:46 -0600
Message-ID: <3CD6E3F6.2030504@yottayotta.com>
Date: Mon, 06 May 2002 14:13:42 -0600
From: Murtada Shah <mshah@yottayotta.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Nonexisting flash...
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

My modified kernel supports 4 flash banks (64MB total)... When I place 
it on a card with 3 flash banks, the /dev/mtd/3 seems to just point to 
/dev/mtd/0... (I see all the things in /dev/mtd/0 when I moutn 
/dev/mtdblock/3... but I can't modify anything)

Am I correct that theoretically the mtd driver should not even load 
/dev/mtd/3 @ the beginning? (During do_map_probe in maps/physmap.c) If I 
am, then I can assume it's some hardware mapping problem.

Murtada Shah
