Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13v7UF-0006zx-00
	for mtd-list@infradead.org; Mon, 13 Nov 2000 00:28:39 +0000
Received: from sis.com.tw ([203.67.208.2] helo=fw11.sis.com.tw)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13v7UE-0006zr-00
	for mtd@infradead.org; Mon, 13 Nov 2000 00:28:38 +0000
Message-ID: <3A0F34B9.F8E18383@sis.com.tw>
Date: Mon, 13 Nov 2000 08:24:25 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: Adam Agnew <agnew@glue.umd.edu>
CC: mtd@infradead.org
Subject: Re: Detecting the Disk-On-Chip 2800
References: <Pine.GSO.4.21.0011111836570.1496-100000@y.glue.umd.edu>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Adam Agnew wrote:
> 
> Is it common to be unable to detect the DOC after you've flashed a bios to
> it? Can you get around that by explicitly stating the the memory address
> and length for it?
> - Adam Agnew
> 

Adam,
	You should ask me directly, that is what I did to the driver ;-). The
original firmware (IPL) in the DoC has 0x55AA signature in it. So the driver
probe for it to determine if there is a DoC on the bus. After we reprogramming
the IPL area, the signature is gone. You should CVS update your MTD source
tree and reconfigure the kernel. There are two options, one is PROBE_HIGH,
which will probe high address (near 4GB) rather than log address (under 1MB)
for DoC. The other is PROBE_55AA, which probe the signature. If you are playing
LinuxBIOS with SiS 630, please choose PROBE_HIGH == y, PROBE_55AA = n.

Ollie


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
