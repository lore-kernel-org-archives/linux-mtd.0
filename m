Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 1436eu-0006Mi-00
	for mtd-list@infradead.org; Tue, 05 Dec 2000 01:12:40 +0000
Received: from hinet123.sis.com.tw ([210.242.182.251] helo=maillog.sis.com.tw)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 1436es-0006Mc-00
	for mtd@infradead.org; Tue, 05 Dec 2000 01:12:39 +0000
Message-ID: <3A2C4073.8AA079B3@sis.com.tw>
Date: Tue, 05 Dec 2000 09:10:11 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: Ian <Relativity@HumanHeuristic.com>
CC: mtd@infradead.org
Subject: Re: Problems with r/w on mtdblock0
References: <200012042236.IAA16219@singularity.tronunltd.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Ian wrote:
> 
>   Have I done something wrong to get this error?
> 
>     bash# dd if=/dev/zero of=/dev/mtdblock0 bs=512 count=1
>     end_request: I/O error, dev 1f:00 (mtdblock), sector 0
>     dd: /dev/mtdblock0: Input/output error
>     1+0 records in
>     0+0 records out
> 
>     bash# /bin/dd if=/dev/mtdblock0 of=/dev/null bs=512 count=1
>     end_request: I/O error, dev 1f:00 (mtdblock), sector 0
>     /bin/dd: /dev/mtdblock0: Input/output error
>     0+0 records in
>     0+0 records out
> 
>   I have no problems reading and writing to nftla on my DoC Millennium ... just
> not the block device.
> 

Ian,
	The /dev/mtdblockN device the the "block device" node for MTD devices.
In the DoC case, it can only read/write data in 8KB block (the erase size).
You can not read/write 512B on itm it will get "cached" by the driver. If
you are playing with the IPL stuff, WRITE TO /dev/mtd0.

Ollie


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
