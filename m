Received: from mail.feig.de ([195.145.139.42] helo=srv-mail02.feig.de)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LpiuB-0005Xa-DG
	for linux-mtd@lists.infradead.org; Fri, 03 Apr 2009 12:54:02 +0000
Message-Id: <49D622FA.187F.00BC.1@feig.de>
Date: Fri, 03 Apr 2009 14:53:46 +0200
From: "Manuel Sahm" <Manuel.Sahm@feig.de>
To: <linux-mtd@lists.infradead.org>
Subject: How to update UBIFS while running an application ?
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
 
I have 3 UBIFS mounted - one is the RFS, another one is mounted in
/mnt/ubi1/ and the last one is mounted in /mnt/ubi2/
My main application is in /mnt/ubi1/ and is running.
 
How could I update the actual ubifs ubi0_0, ubi1_0 and ubi2_0 ?
 
I tried ist with 
1.) flash_eraseall
2.) nandwrite
---> This doesn´t work -> after restart I got errors -> RFS is damaged
and doesn´t boot anymore
 
another try:
1.) ubiupdatevol
-----> the problem - this program doesn´t work if the ubifs is mounted
- but I can´t unmount /mnt/ubi1 or /mnt/ubi2 or the RFS because there
are applications running.
 
 
So what can I do to solve this problem ?
 
Thank you
