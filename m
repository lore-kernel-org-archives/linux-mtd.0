Received: from code-monsters.com ([65.67.50.169] helo=smash.codemonsters.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16gsZn-0002sQ-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Mar 2002 19:20:20 +0000
Received: from ba.devicemonsters.com (adsl-65-70-211-41.dsl.austtx.swbell.net [65.70.211.41])
	by smash.codemonsters.net (8.9.3/8.8.7) with ESMTP id NAA16758
	for <linux-mtd@lists.infradead.org>; Fri, 1 Mar 2002 13:31:39 -0600
Date: Fri, 1 Mar 2002 14:39:44 -0600 (CST)
From: "Brian P. Austin" <baustin@codemonsters.net>
To: linux-mtd@lists.infradead.org
Subject: Re: Reproduction of NFTL Bug with DOC 2000 288MB FULL DEBUG
Message-ID: <Pine.LNX.4.21.0203011437090.657-100000@ba.devicemonsters.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Ok.

I formated the disk with dformat and reran the modules

I get this...

[root@ba /root]# modprobe -a doc2000 nftl mtdchar mtdcore
[root@ba /root]# modprobe -a docprobe
DiskOnChip 2000 found at address 0xD0000
Formatting block 2
Formatting block 3
Formatting block 9
Formatting block 11
Formatting block 13
Formatting block 15
Formatting block 17

and it has been sitting here for quite a while now.

the message repeated in log is....

Mar  1 14:36:12 ba kernel: _DoC_WaitReady called for out-of-line wait
Mar  1 14:36:43 ba last message repeated 8365 times
Mar  1 14:37:44 ba last message repeated 17039 times
Mar  1 14:38:45 ba last message repeated 17045 times
...

I apologize, I'm not sure what you mean by logging the serial term.. 
