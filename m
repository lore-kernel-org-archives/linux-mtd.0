Received: from bestroot.de ([217.160.170.131] helo=p15112267.pureserver.de)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19PB1v-0003br-0Q
	for <linux-mtd@lists.infradead.org>; Mon, 09 Jun 2003 02:00:59 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by p15112267.pureserver.de (Postfix) with ESMTP id E21D53A40C1
	for <linux-mtd@lists.infradead.org>;
	Mon,  9 Jun 2003 03:01:33 +0200 (CEST)
Received: from xpc823 (pD9552356.dip.t-dialin.net [217.85.35.86])
	by p15112267.pureserver.de (Postfix) with ESMTP id C2B753A40C0
	for <linux-mtd@lists.infradead.org>;
	Mon,  9 Jun 2003 03:01:32 +0200 (CEST)
Received: from gmx.net (unknown [10.0.0.75])
	by xpc823 (Postfix) with ESMTP id 7ABC5CECA1
	for <linux-mtd@lists.infradead.org>;
	Mon,  9 Jun 2003 03:01:07 +0200 (CEST)
Message-ID: <3EE3DC9F.3060606@gmx.net>
Date: Mon, 09 Jun 2003 03:02:23 +0200
From: Felix Domke <tmbinc@gmx.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Differently sized Flash chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

i have a device with one Intel E28F128J3 (16MB NOR) and one E28640J3 
(8MB NOR).

Is it possible to use both of them as one single device, especially a 
partition spanning over both of them?

Currently, the first on is detected, correctly sized as 16MB, and the 
second one is detected. But the total size seems to be caculated by 
num_chip * size_of_first_chip, so the last 8MB alias to the first 8MB of 
the second flashrom, which is not really what i want.

So, is it possible to correctly probe them? I just hardcoded the size to 
0x180000, and it seems to work.  But this is not really the way i want 
to go.


Felix
