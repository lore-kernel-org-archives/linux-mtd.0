Received: from [212.80.172.3] (helo=nlmail.peekglobal.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CcQxA-00013W-An
	for linux-mtd@lists.infradead.org; Thu, 09 Dec 2004 11:15:41 -0500
Content-Class: urn:content-classes:message
Date: Thu, 9 Dec 2004 17:17:06 +0100
Message-ID: <ECE7E5A7BCD66544A8F2B98EA0A8EFB313E239@nlsv0101.nl.peeknet.prv>
From: "Koenders, Eric - NL" <Eric.Koenders@peekglobal.com>
To: <linux-mtd@lists.infradead.org>
Subject: System blocked for a while by heavily fragmented file on a jffs2
	partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am running an embedded Linux system with jffs2 on NOR flashes (MPC860,
48MHz). Due to a bug in an application a log file on the jffs2 partition
was written with short messages and flushed many times.

When I tried to cat the logfile my system rebooted. This turned out to be
caused by the system watchdog (patted by a very high priority process).
With the watchdog disabled I found that an 'ls' of the log file stalled
all system activity for about 10 seconds. After that everything acted
normal again.

After a reboot the 10 seconds stall was back again.

Enabling debugging in the jffs2 code showed a very long list of calls to
jffs2_add_full_dnode_to_inode(). Adding a printk with a counter in the
calling function showed that it was called about 5000 times when the log
file was accessed for the first time...

Using the jffs2dump output of the partition contents and some Linux tools
I found that the logfile was fragmented in 5000 pieces on the Flash.

Looking at the jffs2 code I concluded the following:

- the Linux VFS does some of its operations under BKL ('Big Kernel Lock')
  (see Documentation/filesystems/Locking for a list)
- jffs2 can loop many times in its jffs2_do_read_inode() function,
  which is called under BKL
- the loop iterations are done to gather all fragments of a file from the
  Flash device.

I tried to force the garbage collector to defragment the file. It seems to
do defragmentation, but it takes an awful lot of time before it decides to
clean up my log file (I stopped waiting after a few hours).

I guess this is not an easy problem to solve, as it is rooted in the use
of the BKL in the VFS.

Does anyone have an idea how to solve this problem? Maybe more agressive
defragmentation behaviour of the GC? Or an fsck like tool to defragment a
file system?

Best regards,

	Eric



DISCLAIMER:
Deze e-mail en de informatie erin is vertrouwelijk en uitsluitend bestemd
voor de geadresseerde. Elke niet-goedgekeurde openbaarmaking,
vermenigvuldiging, verspreiding (inclusief doorzending) en/of verstrekking
is niet toegestaan. Peek Traffic B.V. staat niet in voor de inhoud, noch
voor de juiste, volledige en tijdige overbrenging van (de informatie in)
dit bericht. Indien u deze e-mail foutief heeft ontvangen, verzoeken wij u
vriendelijk dit te melden aan de verzender.

This e-mail and the information it contains is confidential and is solely
for the use of the addressee. Any unauthorised disclosure, copying,
distribution (including retransmission) or other use is strictly
prohibited. Peek Traffic B.V. is neither liable for the contents, nor for
the proper, complete and timely transmission of (the information contained
in) this communication. If you received this e-mail in error, please
notify the sender.

_____________________________________________________________________

This message has been scanned by F-Secure Anti-Virus for Microsoft
Exchange.
For more information, connect to http://www.F-Secure.com/
