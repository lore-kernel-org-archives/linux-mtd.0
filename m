Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 143Uab-0003Vj-00
	for mtd-list@infradead.org; Wed, 06 Dec 2000 02:45:49 +0000
Received: from [203.46.70.199] (helo=singularity.tronunltd.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 143UaZ-0003Vd-00
	for mtd@infradead.org; Wed, 06 Dec 2000 02:45:47 +0000
Date: Wed, 6 Dec 2000 12:45:36 +1000
Message-Id: <200012060245.MAA20187@singularity.tronunltd.com>
To: "Ollie Lho" <ollie@sis.com.tw>
Subject: Re: Problems with r/w on mtdblock0
From: "Ian" <Relativity@HumanHeuristic.com>
Cc: mtd@infradead.org
Reply-To: "Ian" <Relativity@HumanHeuristic.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


> Of course it WILL BEHAVIOR THIS WAY !!!!
What is /dev/mtd0 ?


Is it a "raw" device ... do I see unhindered access to the DoC Millennium, or am
I being processed in some way (maybe address mapped) .. ?



 
> The DoC has an NAND flash chip in side. For NAND flash chip
> you can only turn each bit form 1 to 0 by WRITE operation,
> not the other way around. The only way to turn a 0 bit to 1
> is by a ERASE operation. This is why I have to erase the first
> few Erase Blocks befor writing the DoC in my loaddoc script.
> 
> # Erase the first 128 pages of the DoC,
> # 128 pages == 128 page * 512 bytes per page == 1 MB
> ./erase /dev/mtd0 0 128
> 
> # Use dd to (zero) pad linuxbios.strip to 63 KB
> dd conv=sync bs=63k if=$LINUXBIOS/util/config/winfast/linuxbios.strip 
> of=linuxbios.block
> 
> # Use dd to wrtie IPL to the first and second pages (page 0, 1) on the DoC
> # N.B. if you are using 2.4.0-test10 and later kernel, the conv=notrunc
> # is neceressary.
> dd if=$LINUXBIOS/util/config/winfast/docipl of=/dev/mtd0 conv=notrunc
> dd if=$LINUXBIOS/util/config/winfast/docipl of=/dev/mtd0 seek=1 conv=notrunc
> 
> 
> Ollie
> 
> 
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
> 

--
http://HumanHeuristic.com/
"Bringing people together in a world full of computers"



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
