Received: from ns.loser.net ([66.93.181.194] helo=loser.net)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Ccqxh-0004HK-QN
	for linux-mtd@lists.infradead.org; Fri, 10 Dec 2004 15:01:59 -0500
Received: from [199.108.74.225] (account holland HELO [10.16.2.68])
	by loser.net (CommuniGate Pro SMTP 4.1.8)
	with ESMTP id 8443569 for linux-mtd@lists.infradead.org;
	Fri, 10 Dec 2004 12:01:54 -0800
Mime-Version: 1.0 (Apple Message framework v619)
Content-Transfer-Encoding: 7bit
Message-Id: <5710356C-4AE6-11D9-B290-000A959A0A94@loser.net>
Content-Type: text/plain; charset=US-ASCII; format=flowed
To: linux-mtd@lists.infradead.org
From: Shannon Holland <holland@loser.net>
Date: Fri, 10 Dec 2004 12:01:54 -0800
Subject: How to test ecc correction code?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

We're developing for a Samsung S3C2410 based system  (currently running 
linux 2.6.10-rc3-bk2) and are using the internal hardware error 
correction code from the cpu's nand controller (3 byte ecc for a 512 
byte page). I "think" I've written some code to correct errors but am a 
tad stumped as to how to test it.

I had initially tried to read a block of data (including oob) using 
nanddump, then erase the block, change a single bit in the first page 
of my dumped data and re-write it to flash using nandwrite (specifying 
-o as I include oob data). However, the first call to write the OOB 
data in page 0 will fail.

At the shell level I'm doing:

# get the block of data with oob
nanddump -a 0 -l 16384 /dev/mtd3 > /tmp/nand

# some magic to flip a bit in the first byte of /tmp namd

# erase the block
flash_erase /dev/mtd3 0 1

#re-write with bad bit
nandwrite -s 0 -o /dev/mtd3 /tmp/nand

The call to nandwrite when it attempts to write the oob data for the 
first page (the ioctl(fd, MEMWRITEOOB) it returns an I/O Error.

Am I doing this correctly? Is there a better way to do this? Do any 
tools for this exist?

Thanks for any help!

Shannon
