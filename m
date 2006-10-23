Received: from static-72-72-77-140.bstnma.east.verizon.net ([72.72.77.140]
	helo=superhub.daknet.net)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gc68Z-0008GP-EW
	for linux-mtd@lists.infradead.org; Mon, 23 Oct 2006 16:11:10 -0400
Received: from SUPERVOICEHUB ([192.168.10.20])
	by superhub.daknet.net (JAMES SMTP Server 2.2.0) with SMTP ID 628
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 Oct 2006 15:41:01 -0400 (EDT)
Received: from firewall ([192.168.10.1] helo=ARCHANGEL)
	by supervoicehub.daknet.net with esmtpsa (TLSv1:RC4-MD5:128)
	(Exim 4.54) id 1Gc5a9-0003Dl-JB
	for linux-mtd@lists.infradead.org; Mon, 23 Oct 2006 15:35:33 -0400
Date: Mon, 23 Oct 2006 15:40:56 -0400 (EDT)
From: femi@firstmilesolutions.com
To: linux-mtd@lists.infradead.org
Message-ID: <14970641.101161632456658.JavaMail.kingpin@ARCHANGEL>
Subject: MTD/Compact flash question
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Reply-To: femi@firstmilesolutions.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm looking for some information about using MTD with a commercial Compact Flash card. I've been supporting a deployed solution that uses a linux single board computer running off a 256 MB commercial compact flash card for the last 3 years or so, and we recently (within the last 4 months) switched to using MTD and JFFS2. The system is configured with 2 read only partitions (89 MB and 1MB, both using the ext2 filesystem) and a 156 MB read/write data partition (JFFS2 on top of MTD).

Recently, we've observed a number of DriveReady/DriveSeek/DriveWrite errors from the JFFS2 partition when we try to erase, format and mount it. The flash_erase call hangs, and spits out a series of DriveWrite errors. When we cancel the erase, the mkfs.jffs2 call to format the partition completes without reporting any errors, but the attempt to mount throws a "bad superblock" error.

As far as I can understand, this is using MTD on top of the IDE layer. My questions are:
1. If using a commercial Compact Flash card (through the IDE interface), is the MTD/JFFS2 layer necessary? It was deployed as a means of getting wear levelling done, but from reading through the list archives it looks like the wear levelling is typically already done by the Compact Flash card and we might as well just make the last partition ext2, mount it with the noatime option and call it a day.
2. Does this depend on the Compact Flash card in use?
3. Is there any way to get more information about the state of the compact flash card, so my application code can tell when the CF card has reached the end of its useful life (as opposed to now, when I simply wait until the entire computer starts throwing errors).

If this isn't the right forum to ask CF questions, I'd appreciate pointers as to where best to go to get those answered.

Thank you,
Femi.
