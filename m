Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ABgzb-0000oz-Ml
	for <linux-mtd@lists.infradead.org>; Mon, 20 Oct 2003 21:51:08 +0100
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id h9KKnxH03728
	for <linux-mtd@lists.infradead.org>; Tue, 21 Oct 2003 09:49:59 +1300
Received: from sunstorm.tait.co.nz (sunstorm.tait.co.nz [172.25.40.9])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id h9KKnx203722
	for <linux-mtd@lists.infradead.org>; Tue, 21 Oct 2003 09:49:59 +1300
Received: from tait.co.nz ([172.25.110.7])
 by sunstorm.tait.co.nz (iPlanet Messaging Server 5.1 (built May  7 2001))
 with ESMTP id <0HN2001L9PV9RY@sunstorm.tait.co.nz> for
 linux-mtd@lists.infradead.org; Tue, 21 Oct 2003 09:49:58 +1300 (NZDT)
Date: Tue, 21 Oct 2003 09:49:50 +1300
From: Robin Gilks <robin.gilks@tait.co.nz>
To: mtd list <linux-mtd@lists.infradead.org>
Message-id: <3F944A6E.3090703@tait.co.nz>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii; format=flowed
Content-transfer-encoding: 7BIT
Subject: Unrequested module loading?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings

Any ideas why I get the following at boot time:

kmod: failed to exec /sbin/modprobe -s -k cmdlinepart, errno = 2
cmdlinepart partition parsing not available
kmod: failed to exec /sbin/modprobe -s -k RedBoot, errno = 2
RedBoot partition parsing not available

A bit odd as I have no modules defined in my system at all and the 
relevant section of the .config file says:

# CONFIG_MTD_REDBOOT_PARTS is not set
# CONFIG_MTD_CMDLINE_PARTS is not set

-- 
Robin Gilks
Senior Design Engineer          Phone: (+64)(3) 357 1569
Tait Electronics                Fax  :  (+64)(3) 359 4632
PO Box 1645 Christchurch        Email : robin.gilks@tait.co.nz
New Zealand
