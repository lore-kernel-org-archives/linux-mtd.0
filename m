Received: from bay7-f101.bay7.hotmail.com ([64.4.11.101] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Ay6S0-0006MB-As
	for linux-mtd@lists.infradead.org; Tue, 02 Mar 2004 09:44:32 +0000
From: "liu zixing" <liuzixing@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 02 Mar 2004 17:42:53 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Message-ID: <BAY7-F101vNGXa1VPAq0002ccc2@hotmail.com>
Subject: compile error
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I work on a board with Xscale IXP425 , I want to make a DiskOnChip 2000 as 
a storage device.
We already have a linux kernel-2.4.21-rmk1-ds1 run on it.
I download the linux driver for DOC from m-systems.com, and configure the 
"M-systems driver" as a module.
But  when I run "make modules", there are error messages:
    tffs2lnx.o compiled for a little endian system and target is big 
endian.

That means the library libosak  is compiled as little endian, 
so I want to ask whether  there is big endian version libosak ? And where 
can I download ?

thanks.
                                                             hugh.liu
                                                             3.2

_________________________________________________________________
√‚∑—œ¬‘ÿ MSN Explorer:   http://explorer.msn.com/lccn  
