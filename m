Received: from mail018.syd.optusnet.com.au ([210.49.20.176])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17WSro-00034v-00
	for <linux-mtd@lists.infradead.org>; Mon, 22 Jul 2002 03:24:08 +0100
Message-ID: <3D3B6CB9.8020505@ctam.com.au>
Date: Mon, 22 Jul 2002 12:23:53 +1000
From: Brendan J Simon <brendan.simon@ctam.com.au>
Reply-To: brendan.simon@ctam.com.au
MIME-Version: 1.0
To: busybox@busybox.net, Linux MTD <linux-mtd@lists.infradead.org>
Subject: Minux v Ext2 on DoC2000
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

I'm building an embedded system with an MPC8260 powerpc processor and a 
DiskOnChip2000.  It's quite a big embedded system (32MB DOC, 64MB RAM, 
132MHz+ processor).  I'm using BusyBox with uClibc and kernel version 
2.4.18-pre8.  I'm trying to save as much space on the DOC as possible. 
 I've got two partitions with identical information (well almos).  One 
is a failsafe backup partition.

I am currently using ext2 on the DOC as this was setup by a colleague. 
 I was thinking of changing to Minux as the essential minux tools are 
already available in BusyBox.  I already maintain BusyBox under my 
configuration management system and don't want to maintain e2fsprogs as 
well, unless it is necessary.  It all depends on the advantages and 
disadvantages beteween ext2 and minux.

Has anyone got any experience with Minux and Ext2 on a DOC2000 device 
runinng a linux embedded system ?  I'm sure the answer is yes :)
Could someone briefly list the main advantages and disadvantages of 
minux/ext2 on such an embedded system ?
Pointers to other sources of information would also be greatly appreciated.

Thanks,
Brendan Simon.
