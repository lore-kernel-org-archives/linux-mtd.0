Received: from dobropan.easily.co.uk ([217.206.220.18]
	helo=customermail2.easily.co.uk)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FERTx-0003UA-Dt
	for linux-mtd@lists.infradead.org; Wed, 01 Mar 2006 08:35:13 -0500
Received: from [87.113.12.150] (account d407toh54t65 HELO [192.168.1.2])
	by customermail2.easily.co.uk (CommuniGate Pro SMTP 4.1.8)
	with ESMTP id 42914693 for linux-mtd@lists.infradead.org;
	Wed, 01 Mar 2006 13:35:06 +0000
From: Neil Wilson <nwilson@airspan.com>
To: linux-mtd@lists.infradead.org
Date: Wed, 1 Mar 2006 13:35:02 +0000
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200603011335.03116.nwilson@airspan.com>
Subject: NAND +concatenation
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am being a bit thick today & cannot quite understand if I am doing this 
right...

I have 4 64MB NAND chips, I can get the MTD concatenation to add them to a 
single device (6) which is defined as having one partition.

How can I use this single device ?

Should I be able to "flash_eraseall -j /dev/mtd6 " ?, this returns a 
"/dev/mtd6: Bad block check not available" error.
or do I need to format each chip in turn ?

Also should I be able to mount this single device as a formatted filesystem ?
"mount -t jffs2 /dev/mtdblock6 xxx"

Thanks for any advice.

Neil 
