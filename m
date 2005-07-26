Received: from server.pyrenet.fr ([194.116.145.1])
	by pentafluge.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DxMP9-0000nl-0l
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2005 11:11:57 +0100
Received: from localhost (localhost [127.0.0.1])
	by localhost.pyrenet.fr (Postfix) with ESMTP id 90E4C3756
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Jul 2005 11:44:40 +0200 (MET DST)
Received: from server.pyrenet.fr ([127.0.0.1])
	by localhost (server [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 03084-07 for <linux-mtd@lists.infradead.org>;
	Tue, 26 Jul 2005 11:44:37 +0200 (MET DST)
Received: from debian.perax.net (perax.net1.nerim.net [62.212.115.56])
	by server.pyrenet.fr (Postfix) with ESMTP id 6BB113492
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Jul 2005 11:44:37 +0200 (MET DST)
Received: from [192.168.0.86] (unknown [192.168.0.86])
	by debian.perax.net (Postfix) with ESMTP id E0D10160078
	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Jul 2005 11:44:36 +0200 (CEST)
Message-ID: <42E60604.2030601@perax.fr>
Date: Tue, 26 Jul 2005 11:44:36 +0200
From: Ludovic Guilhamat <lguilhamat@perax.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Does MTD could be the origin of my problem ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all !

I'm working with a Coldfire platform (5272) with a Nand flash of 32MB. 
I'm trying to use the last MTD snapshot which works with the 2.4.27 
kernel (/2005-03-04 snapshot) /on my Nand, with Jffs2 (I plan to 
implement Yaffs).

When my system is up, I have a kernel bug panic which appears, for 
example, when I do a 'ls -al /home' (/home is an mtdblock with jffs2) at 
the root directory (/). If I'm in the /home directory, the problem 
doesn't seem to appear...

The kernel bug is : kernel BUG at page_alloc.c:254!
                                 Kernel panic: BUG!

So, do you think that the MTD could be in cause, since a past MTD with 
2.4.19 kernel worked well...?

Thanks.
Ludovic.
