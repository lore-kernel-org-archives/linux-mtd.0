Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14LfvX-0000Iu-00
	for mtd-list@infradead.org; Thu, 25 Jan 2001 06:30:35 +0000
Received: from 198.142.103.111.optusnet.com.au ([198.142.103.111] helo=powermac.ctam.local)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14LfvU-0000Io-00
	for mtd@infradead.org; Thu, 25 Jan 2001 06:30:33 +0000
Received: from powerbook.ctam.local ([192.168.0.40] helo=bigpond.com)
	by powermac.ctam.local with esmtp (Exim 3.12 #1 (Debian))
	id 14LfvO-0004cg-00
	for <mtd@infradead.org>; Thu, 25 Jan 2001 17:30:26 +1100
Message-ID: <3A6E7687.9070200@bigpond.com>
Date: Wed, 24 Jan 2001 17:30:31 +1100
From: Brendan J Simon <brendan.simon@bigpond.com>
Reply-To: brendan.simon@bigpond.com
MIME-Version: 1.0
To: mtd <mtd@infradead.org>
Subject: MTD: linux-2.4.0-test9 on a PowerPC board.
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


My company has a custom PowerPC board with a DOC2000 (8MB) on it.  I am 
trying to get linux-2.4.0-test9 running on it with the MTD drivers.  We 
think the DOC was detected initially but it seems that NFTL media header 
has been blown away.  I think this happened when we tried to write to it 
or format the device.

Trying to debug things we have noticed that some of the data returned 
has the bytes swapped.  It seems the NUM ERASE UNITS is returning 0xFA03 
where as it should be returning 0x03FA.  It looks like an endian 
problem.  Is the DOC code endian neutral ??  Will the endian problems be 
rampant throughout the code or will it be confined to a few places ??

Has anyone used a DOC on a PowerPC processor or other big endian 
architecture ??

Thanks for any help,
Brendan Simon.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
