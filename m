Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14ftMa-0008GB-00
	for mtd-list@infradead.org; Thu, 22 Mar 2001 00:54:04 +0000
Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14ftMX-0008G5-00
	for mtd@infradead.org; Thu, 22 Mar 2001 00:54:02 +0000
Message-ID: <3AB94DB2.BE7A3E5E@mvista.com>
Date: Wed, 21 Mar 2001 16:56:18 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: =?iso-8859-1?Q?K=E1ri=20Dav=ED=F0sson?= <kd@flaga.is>
CC: mtd@infradead.org, ahennessy@mvista.com
Subject: Re: mtd_info_t.erasesize
References: <EADB10BAC266A14A85ECBF8686A73E310A911A@kolkrabbi.flaga.is>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Kári Davíðsson wrote:

> Hi,
>
> When I issue an erase command, e.g. erase /dev/mtd0 0x10000 1
> I get the follwing output :
>
> Erase Unit Size 0x2000, Erase Total 100 Units
> Performing Flash Erase of length 8192 at offset 0x10000MTD_ioctl
> MTD_ioctl
> MTD : 5
> Performing Flash Erase of length 8192 at offset 0x12000MTD_ioctl
> MTD_ioctl
> MTD : 5
> Performing Flash Erase of length 8192 at offset 0x14000MTD_ioctl
> MTD_ioctl
> MTD : 5
> Performing Flash Erase of length 8192 at offset 0x16000MTD_ioctl
> MTD_ioctl
> MTD : 5
> Performing Flash Erase of length 8192 at offset 0x18000MTD_ioctl
> MTD_ioctl
> MTD : 5
> Performing Flash Erase of length 8192 at offset 0x1a000MTD_ioctl
> MTD_ioctl
> MTD : 5
> Performing Flash Erase of length 8192 at offset 0x1c000MTD_ioctl
> MTD_ioctl
> MTD : 5
> Performing Flash Erase of length 8192 at offset 0x1e000MTD_ioctl
> MTD_ioctl
> MTD : 5
>
> What bugs me here is that an sector of size 0x10000 (64KB) is erased
> in 8 erase calls to the flash chip sector, basically making the life of
> the
> flash chip 1/8th of what it should be.
> While 8k sector size is correct for the first 8 sectors on the device
> (it is bb cfi flash from intel), it is certainly not correct for the
> rest (4MB - 8KB of the device).
>
> Shouldn't the device geometry be exported through the mtd_info_t
> structure
> or am I missing something obvious (which is not unlikely 8-) )...
>
> Regards,
>
> K.D.
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org

Well,

I think you are the first one to use an Intel CFI chip that has different
erasesizes.
The logic to handle different erase sizes is in the cfi_cmdset_0002.c file
which handles
the AMD chips but not in the cfi_cmdset_0001.c for Intel chips as yet.
Does the Intel chip give the correct order of the erase regions in the
query to match the order in the flash?  Special
code had to be added for the AMD chips to figure out the correct order of
the erase regions on the chip.

Alice



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
