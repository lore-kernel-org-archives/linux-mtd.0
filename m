Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12Zubs-0003Ju-00
	for mtd-list@infradead.org; Tue, 28 Mar 2000 12:56:36 +0100
Received: from [212.25.93.158] (helo=jodie.lucid)
	by infradead.org with smtp (Exim 3.03 #1)
	id 12Zubo-0003Jk-00
	for mtd@infradead.org; Tue, 28 Mar 2000 12:56:33 +0100
Message-ID: <38E09EA9.C60FB1CD@lucidvon.com>
Date: Tue, 28 Mar 2000 11:59:38 +0000
From: Dvir Oren <dviro@lucidvon.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>, MTD <mtd@infradead.org>
Subject: Re: Bad Block Table
References: <38E076C2.534F661E@lucidvon.com> <17860.954236260@devel2.axiom.internal>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> dviro@lucidvon.com said:
>  3.  And if the driver is responsible for this, does the 
> MTD driver do the same?
> 
> Not yet.

But does MTD even care about the BadBlockTable?  That is, does nftl.c
check that the block that is about to be written to is not in the bad
block table?

If not, then I guess there is no point in restoring the bad block table
when using the MTD drivers, since they don't care about it anywy.  On
the other hand, nftl_format reconstructs the bad block table anyway.

Could this explain why I'm getting file system trashes?

-- 
Dvir Oren               <dviro@lucidvon.com>
Lucid VON Ltd.     <http://www.lucidvon.com>
9 Saloniki St.,        Tel-Aviv       Israel
Tel:  +972 3 644 3038  Fax:  +972 3 644 3039


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
