Received: from web20730.mail.yahoo.com ([216.136.226.131])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Atca3-0000kS-28
	for linux-mtd@lists.infradead.org; Thu, 19 Feb 2004 01:02:19 +0000
Message-ID: <20040219010217.54066.qmail@web20730.mail.yahoo.com>
Date: Wed, 18 Feb 2004 17:02:17 -0800 (PST)
From: Shawn Jin <shawnxtech@yahoo.com>
To: Florian Schirmer <jolt@tuxbox.org>, linux-mtd@lists.infradead.org
In-Reply-To: <200402130841.46087.jolt@tuxbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
cc: Shawn Jin <shawnxtech@yahoo.com>
Subject: Re: Help: Error on mounting JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > cfi_cmdset_0002: Disabling fast programming due to
> > code brokenness.
> 
> What MTD version you are using? I recommend to get the latest code from
> CVS, 
> since there was another bug in the cmdset2. You should in fact get two 
> "Disabled X due to bugs" messages.
 
When the latest code from CVS (i.e. with David Vrabel's patches) was used,
the root filesystem finally got mounted with type JFFS2.

However I observed some strange behaviors. What I tried is to create some
new files in the device. Here is the screenshot.

# ls
bin   dev   etc   lib   proc  sbin  tmp   usr   var
--> original root filesystem

# cd tmp
# ls
# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/mtdblock1            8192      2096      6096  26% /
--> show the device's usage

# cp /bin/busybox busybox
Node totlen on flash (0xffffffff) != totlen from node ref (0x00000044)
Node CRC ffffffff != calculated CRC f09e7845 for node at 000f69dc
# ls -l
-rwxr-xr-x    1 0        0          785136 Jan  1 00:03 busybox
# ls -l /bin/busybox
-rwxr-xr-x    1 0        0          785136 Feb 18  2004 /bin/busybox
# df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/mtdblock1            8192      2528      5664  31% /
--> copy a file 'busybox' to 'tmp' directory. Here come some error
messages.

# cp busybox bb1
Node totlen on flash (0xffffffff) != totlen from node ref (0x00000044)
Node totlen on flash (0xffffffff) != totlen from node ref (0x0000000c)
Node CRC ffffffff != calculated CRC f09e7845 for node at 000f704c
Node CRC ffffffff != calculated CRC f09e7845 for node at 000f704c
cp: Read error: Input/output error
--> Again error messages. And also the size of 'bb1' is less than the size
of 'busybox'.

# cp bb1 bb2
Node totlen on flash (0xffffffff) != totlen from node ref (0x00000044)
Node totlen on flash (0xffffffff) != totlen from node ref (0x0000000c)
# cp bb2 bb3
Node totlen on flash (0xffffffff) != totlen from node ref (0x00000044)
Node totlen on flash (0xffffffff) != totlen from node ref (0x0000000c)
# df -k
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/mtdblock1            8192      3820      4372  47% /
# ls -l
-rwxr-xr-x    1 0        0          782336 Jan  1 00:04 bb1
-rwxr-xr-x    1 0        0          782336 Jan  1 00:04 bb2
-rwxr-xr-x    1 0        0          782336 Jan  1 00:04 bb3
-rwxr-xr-x    1 0        0          785136 Jan  1 00:03 busybox
--> The sizes of 'bb1', 'bb2', and 'bb3' are the same but all are less than
the size of 'busybox'.

--> After the sytem is rebooted, all created files are gone. Why cannot
they be written to flash?

Question: Is this problem related to JFFS2? Or just simply to mkfs.jffs2? I
used the latest util from CVS to make a JFFS2 filesystem image with '-e
0x80000' specified, no padding.

Regards,
-Shawn.

__________________________________
Do you Yahoo!?
Yahoo! Mail SpamGuard - Read only the mail you want.
http://antispam.yahoo.com/tools
