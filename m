Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12utZm-00024Y-00
	for mtd-list@infradead.org; Thu, 25 May 2000 10:05:10 +0100
Received: from [212.25.93.158] (helo=jodie.lucid)
	by infradead.org with smtp (Exim 3.03 #1)
	id 12utZk-00024S-00
	for mtd@infradead.org; Thu, 25 May 2000 10:05:08 +0100
From: Dvir Oren <dvir@lucidvon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <14636.60670.580939.911318@jodie.lucid>
Date: Thu, 25 May 2000 12:06:06 +0300 (IDT)
To: Patrick Higgins <phiggins@transzap.com>
CC: MTD <mtd@infradead.org>
Subject: Patched LILO problems
In-Reply-To: <Pine.LNX.4.21.0005241545550.16970-100000@phiggins.transzap.com>
References: <Pine.LNX.4.21.0005241545550.16970-100000@phiggins.transzap.com>
Reply-To: Dvir Oren <dviro@lucidvon.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Patrick Higgins writes ("Patched LILO problems"):

> I'm using the binary patched LILO from mtd/patches/lilo-mtd.tar.gz, and it
> doesn't seem to pass the correct command line to kernel.  The parameters I

Yes.  I noticed that the patched LILO does not in fact pass parameters
(well, the only ones I used were root=) to the kernel.  For my purposes,
I just rdev each kernel.

Perhaps it would be a good idea to go over the patches and see if it
destroys something.

-- 
Dvir Oren               <dviro@lucidvon.com>
Lucid VON Ltd.     <http://www.lucidvon.com>
9 Saloniki St.,        Tel-Aviv       Israel
Tel:  +972 3 644 3038  Fax:  +972 3 644 3039


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
