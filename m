Received: from web20401.mail.yahoo.com ([216.136.226.120])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 173T9x-0004TO-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 May 2002 03:51:01 +0100
Message-ID: <20020503025059.96685.qmail@web20401.mail.yahoo.com>
Date: Thu, 2 May 2002 19:50:59 -0700 (PDT)
From: Zhiwei Yu <linux_vpn@yahoo.com>
Subject: grub stuff
To: john@scl.co.uk
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

hi, John 

I am the one posting "Booting from DOC2000 with GRUB
Loader", and glad to see you still "fighting" grub. 
Now I'm using lilo instead. Although grub have a lot
of benefits, I can't make it work before deadline.:(
If you work it out, would u please give me some clue?

Here is my way to recover DOC chip.  I presumed that
you have an ethernet card on your board.  
1. Build a ramdisk with root fs, put nftl_format
inside it
2. use mknbi to make ramdisk bootable
3. setup a tftp server and bootp server on your
desktop
4. go to etherboot.sourceforge.net to download the
latest package, find out the bios for ethernet card
and write it into ethernet card.  After that you can
choose to boot from local or network.
5. boot from network, push your ramdisk to your SBC by
tftp server
You can now nftl_format your DOC.  It's a little
tricky to setup all of it. but quite useful for me who
don't have floppy and harddisk on the SBC.

For further information, pls refer to
etherboot.sourceforge.net.

Best Regards
Zhiwei Yu

__________________________________________________
Do You Yahoo!?
Yahoo! Health - your guide to health and wellness
http://health.yahoo.com
