Received: from [213.84.116.84] (helo=protonic.prtnl)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NLY94-0000yJ-Ez
	for linux-mtd@lists.infradead.org; Fri, 18 Dec 2009 08:25:11 +0000
Received: from localhost (localhost [127.0.0.1])
	by protonic.prtnl (Postfix) with ESMTP id 3715928067
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 Dec 2009 08:58:01 +0100 (CET)
Received: from protonic.prtnl ([127.0.0.1])
	by localhost (protonic [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 05471-08 for <linux-mtd@lists.infradead.org>;
	Fri, 18 Dec 2009 08:58:01 +0100 (CET)
Received: from archvile.localnet (archvile.prtnl [192.168.1.153])
	by protonic.prtnl (Postfix) with ESMTP id EF2142803B
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 Dec 2009 08:58:00 +0100 (CET)
From: David Jander <david.jander@protonic.nl>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
Subject: Good stress test for UBIFS?
Date: Fri, 18 Dec 2009 09:00:51 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <200912180900.51332.david.jander@protonic.nl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi all,

What would be a good stress-test for the whole ubifs stack: ubifs, ubi, mtd, 
nand-flash-driver?

I have gone through this:
- Forced to use 2.6.24 which is provided by the chip manufacturer with some 
unknown version of mtd/ubi/ubifs, which is not the latest and not the one that 
originally shipped with 2.6.24. The git history is gone.
- Used this version for a time when suddenly some boards had a corrupt 
filesystem (unreadable /etc).
- Used mtd tests to check hardware and driver, and everything seems fine.
- Updated to latest ubi/ubifs for 2.6.24 from ubifs-v2.6.24.git

And now I need to accomplish two things:

1. Be able come up with a fairly reliable method to reproduce the corruption 
on the original version of ubi/ubifs.
2. Check that this problem indeed does not occur on the latest version, and if 
it does post a bug report here.

For 1. I am looking for some kind of tool or method to stress-test ubi/ubifs 
preferably including also the nand-flash driver and hardware (you never know).

I thought of running something like bonnie++ while power-cycling the board at 
random times for a few days, or something similar, but since IMHO this must be 
a recurring issue for many here, I'd like to know about what others have come 
up with, or if there is some comprehensive stress-test-tool.

Best regards,

-- 
David Jander
Protonic Holland.
