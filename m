Received: from mail1.cray.com ([136.162.0.111])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bg5J5-0006wM-C9
	for linux-mtd@lists.infradead.org; Thu, 01 Jul 2004 13:25:08 -0400
Received: from relaya.us.cray.com (relaya.us.cray.com [192.168.252.144])
	by mail1.cray.com (8.12.10/8.12.10/gw-1.4) with ESMTP id i61HOqLl022937
	for <linux-mtd@lists.infradead.org>;
	Thu, 1 Jul 2004 12:24:52 -0500 (CDT)
Received: from orchid.us.cray.com (orchid.us.cray.com [172.30.27.91])
	by relaya.us.cray.com (8.12.10/8.12.10/hub-1.3) with ESMTP id
	i61HOnBu019125 for <linux-mtd@lists.infradead.org>;
	Thu, 1 Jul 2004 12:24:51 -0500 (CDT)
Received: from cray.com (troll [192.168.250.5])
	by orchid.us.cray.com (8.12.10/8.12.8/badger-1.4) with ESMTP id
	i61HOkdm2041248 for <linux-mtd@lists.infradead.org>;
	Thu, 1 Jul 2004 12:24:48 -0500 (CDT)
Message-ID: <40E448BD.8030909@cray.com>
Date: Thu, 01 Jul 2004 12:24:13 -0500
From: David Updegraff <dave@cray.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: nand oob corruption recovery
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I realize that specs say that if you wipe out mfg. bad block markers 
that there is "no way to recover them".. but...

Are there suggestions for plausibly reliable test sequences that one 
could run a nand chip thru to regenerate valid bad block markers?

Presumeably, it is insufficient to simply try to erase all blocks, 
marking failures as bad...  perhaps verified full page writes ?

Suggestions?

Thanks.

-dbu / Dave Updegraff / dave@cray.com
