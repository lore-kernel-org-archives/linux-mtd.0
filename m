Received: from web20727.mail.yahoo.com ([216.136.226.117])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AtajZ-0000P2-9P
	for linux-mtd@lists.infradead.org; Wed, 18 Feb 2004 23:04:01 +0000
Message-ID: <20040218230358.72448.qmail@web20727.mail.yahoo.com>
Date: Wed, 18 Feb 2004 15:03:58 -0800 (PST)
From: Shawn Jin <shawnxtech@yahoo.com>
To: Florian Schirmer <jolt@tuxbox.org>, linux-mtd@lists.infradead.org
In-Reply-To: <200402130841.46087.jolt@tuxbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Re: Help: Error on mounting JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> > cfi_cmdset_0002: Disabling fast programming due to
> > code brokenness.
> 
> What MTD version you are using? I recommend to get the latest code from
> CVS, 
> since there was another bug in the cmdset2. You should in fact get two 
> "Disabled X due to bugs" messages.

The version of cfi_cmdset_0002.c is 1.94, which is almost up-to-date
without David Vrabel's patches. I have some questions on the debugging
messages shown below.

VFS: Mounted root (jffs2 filesystem).
Freeing unused kernel memory: 84k init
init started:  BusyBox v1.00-pre7 (2004.02.18-01:28+0000) multi-call binary
Config lookback interface...
Config eth0...
Add default route...
mount proc...
No more tasks for init -- sleeping forever.
e100: eth0 NIC Link is Up 100 Mbps Full duplex
------------------------------------------------------

Q: The above messages show that the root filesystem seemed to be mounted
and the first script /etc/rc.sh was executed. Why is MTD tying to erase
0x00780000? What is MTD trying to do here? Filesystem cleanup?

My flash is Am29PL320D, and the configuration is 64-bit bus width and 2
chip interleaved. Erase block size is 512KiB. 0xFF000000-0xFF800000 is the
1st mtd device.

MTD do_erase_oneblock(): ERASE 0x00780000
MTD do_erase_oneblock(): Check 0xffffffff 0xffffffff
MTD do_erase_oneblock(): Check 0xffffffff 0xffffffff
MTD do_erase_oneblock(): ERASE 0x007e0000
MTD do_erase_oneblock(): Check 0xffffffff 0xffffffff
MTD do_erase_oneblock(): Check 0xffffffff 0xffffffff
MTD do_erase_oneblock(): ERASE 0x007e8000
MTD do_erase_oneblock(): Check 0xffffffff 0xffffffff
MTD do_erase_oneblock(): Check 0xffffffff 0xffffffff
MTD do_erase_oneblock(): ERASE 0x007f0000
MTD do_erase_oneblock(): Check 0xffffffff 0xffffffff
MTD do_erase_oneblock(): Check 0xffffffff 0xffffffff
------------------------------------------------------

Q: What does the following WRITE mean? Why does it try to write 0xc03bdd84
to 0x00780000?

It seems to me that WRITE command failed somehow. It might be due to the
implemention of my own _write64(). But if the problem is in the _write64(),
I don't think that the chip even can be probed. The chips are found
correctly. Then what caused this failure?

MTD do_write_oneword(): WRITE 0x00780000(0xc03bdd84)
MTD do_write_oneword(): Check 0xffffffff 0xffffffff
MTD do_write_oneword(): Check 0xffffffff 0xffffffff
MTD do_write_oneword(): WRITE 0x00780000(0x000000f0)
MTD do_write_oneword(): Check 0xffffffff 0xffffffff
MTD do_write_oneword(): Check 0xffffffff 0xffffffff
MTD do_write_oneword(): WRITE 0x00780000(0x000000f0)
MTD do_write_oneword(): Check 0xffffffff 0xffffffff
MTD do_write_oneword(): Check 0xffffffff 0xffffffff
MTD do_write_oneword(): WRITE 0x00780000(0x000000f0)
MTD do_write_oneword(): Check 0xffffffff 0xffffffff
MTD do_write_oneword(): Check 0xffffffff 0xffffffff
MTD do_write_oneword(): WRITE 0x00780000(0x000000f0)
MTD do_write_oneword(): Check 0xffffffff 0xffffffff
MTD do_write_oneword(): Check 0xffffffff 0xffffffff
MTD do_write_oneword(): WRITE 0x00780000(0x000000f0)
MTD do_write_oneword(): Check 0xffffffff 0xffffffff
MTD do_write_oneword(): Check 0xffffffff 0xffffffff
MTD do_write_oneword(): Wacky!  Unable to decode failure status
Possible buggy device - try increasing retry_cmd_max from 5
MTD do_write_oneword(): 0x00780000(0x00000000): 0x19852003 0x0000000c
0xffffffff
 0xffffffff
Write clean marker to block at 0x00780000 failed: -5

This issue really drives me crazy. Any hints are appreciated. Thanks a lot.

Regards,
-Shawn.

__________________________________
Do you Yahoo!?
Yahoo! Mail SpamGuard - Read only the mail you want.
http://antispam.yahoo.com/tools
