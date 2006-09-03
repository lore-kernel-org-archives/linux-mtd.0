Received: from dsl-210-15-203-90-static.qld.netspace.net.au ([210.15.203.90]
	helo=mars.redfish-group.com)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GJjTg-0002vM-UP
	for linux-mtd@lists.infradead.org; Sun, 03 Sep 2006 05:21:03 +0100
Received: from [127.0.0.1] (unknown [192.168.1.2])
	by mars.redfish-group.com (Postfix) with ESMTP id 2A16D1900C4
	for <linux-mtd@lists.infradead.org>;
	Sun,  3 Sep 2006 14:19:30 +1000 (EST)
Message-ID: <44FA57FD.8070003@redfish-group.com>
Date: Sun, 03 Sep 2006 14:20:13 +1000
From: Justin Clacherty <justin@redfish-group.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Static partitions
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've managed to get mtd working on my PXA270 board.  I've used the 
mainstone port as a template for my board port and was wondering why the 
static partitions need to be defined twice.  Mainstone has it defined in 
arch/arm/mach-pxa/mainstone.c and in drivers/mt d/maps/mainstone-flash.c.

Regards,
Justin.
