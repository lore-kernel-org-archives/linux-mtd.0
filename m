Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 139k6X-0001hJ-00
	for mtd-list@infradead.org; Wed, 05 Jul 2000 09:00:21 +0100
Received: from [212.25.93.158] (helo=jodie.lucid)
	by infradead.org with smtp (Exim 3.03 #1)
	id 139k6U-0001hD-00
	for mtd@infradead.org; Wed, 05 Jul 2000 09:00:19 +0100
From: Dvir Oren <dvir@lucidvon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Date: Wed,  5 Jul 2000 10:59:29 +0300 (IDT)
To: rmoya@tsai.es
CC: MTD <mtd@infradead.org>
Subject: firmware problem
In-Reply-To: <E139Q9r-000718-00@infradead.org>
References: <E139Q9r-000718-00@infradead.org>
Message-ID: <14690.59986.929789.360914@jodie.lucid>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Rodrigo Moya writes ("firmware problem"):

> dformat /win:d000 /s:doc123.exb
> Format failed, Medium not large enough

You probably played around with MTD and either formatted the flash
using the MTD nftlformat utility, or did some other thing which is
equivalent to that.  This somehow confuses M-Systems' utilities.

I am not aware of a good solution to this (once you could do "docpmap
/e", which would have erased everything on the flash, including the
Bad Block Table, which you are not supposed to erase, however it did
enable you to reformat the flash.  However since the 1.23 release, you 
can't do that anymore)

-- 
Dvir Oren               <dviro@lucidvon.com>
Lucid VON Ltd.     <http://www.lucidvon.com>
9 Saloniki St.,        Tel-Aviv       Israel
Tel:  +972 3 644 3038  Fax:  +972 3 644 3039


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
