Received: from mail01.pocos-net.com.br ([200.251.232.173]
	helo=mail2.pocos-net.com.br)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19MvY8-000680-3W
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jun 2003 21:04:56 +0100
Received: from renatec.com.br ([200.251.233.8])
        by mail2.pocos-net.com.br (Merak 5.8.6) with ESMTP id COA74270
        for <linux-mtd@lists.infradead.org>; Mon, 02 Jun 2003 17:05:33 -0300
Message-ID: <3EDBAE7D.3080507@renatec.com.br>
Date: Mon, 02 Jun 2003 17:07:25 -0300
From: =?ISO-8859-1?Q?Alfredo_Dal=27Ava_J=FAnior?=
 <alfredo@renatec.com.br>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Problem with DiskOnChip 2000 TSOP (384MB)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

	I got this DiskOnChip. DINFO says:

DiskOnChip 2000 TSOP
Media Size: 384MB
Chip Size: 128MB

	The linux MTD driver recognizes this chip as DiskOnChip Millenium, but 
I can't mount the partition. I tried with kernel 2.4.18 and 2.4.20 with 
the lastest MTD from CVS and DFORMAT can't format this Chip with 4.2 
firmware.
	On /proc/mtd have no info about the chip.
	
	These drivers supports this chip model?

Thanks!!


[]'s
Alfredo Dal'Ava Júnior
