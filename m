Received: from aibo.runbox.com ([87.238.52.70])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LHdRR-0006AW-JS
	for linux-mtd@lists.infradead.org; Tue, 30 Dec 2008 12:11:21 +0000
Received: from [10.9.9.161] (helo=patch.runbox.com)
	by greyhound.runbox.com with esmtp (Exim 4.50) id 1LHdRP-0004w0-QT
	for linux-mtd@lists.infradead.org; Tue, 30 Dec 2008 13:11:19 +0100
Received: from [74.94.155.177] (helo=[192.168.12.139])
	by patch.runbox.com with esmtpsa (uid:263104 )
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63) id 1LHdRP-0006KQ-HA
	for linux-mtd@lists.infradead.org; Tue, 30 Dec 2008 13:11:19 +0100
Message-ID: <495A0FE4.4010603@runbox.com>
Date: Tue, 30 Dec 2008 07:11:16 -0500
From: Cal Page <pagcal@runbox.com>
MIME-Version: 1.0
To: ubifs <linux-mtd@lists.infradead.org>
Subject: Re: ubifs: partition won't mount: duplicate sqnum in replay ???
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

I'm running ubi at 2.6.27.4, ubifs is a mix of that base plus some 
2.6.21 as the vfs interface changed. There are only three mtd calls you 
make, so that rev just isn't important. The base kernel, and most of vfs 
is at 2.6.19.

I did not initialize the nand for the unit in question. It could have 
been the problem. I'll re-format it and start again. But, for testing, 
we have a 'crasher' device that randomly crashes the file system to 
force us into difficult recoveries. In short, for ubifs to be shipped, 
it must survive and re-mount AFTER EVERY CRASH, period.

The only other problem is that ubifs takes way too much memory. We run 
for a few days on our 1 gb nand, and then the oom_killer gets called and 
down we go. What exactly was done in later releases to fix this? I need 
to back-port a solution before we ship.

Cal Page
