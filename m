Received: from mailserv.intranet.gr ([146.124.14.106])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BLdG4-0006zx-Bw
	for linux-mtd@lists.infradead.org; Thu, 06 May 2004 08:25:29 +0100
Received: from mailserv.intranet.gr (localhost [127.0.0.1])
	by mailserv.intranet.gr (8.11.7/8.11.3) with ESMTP id i467UJc25628
	for <linux-mtd@lists.infradead.org>;
	Thu, 6 May 2004 10:30:19 +0300 (EEST)
Message-ID: <4099E57A.7020108@intracom.gr>
Date: Thu, 06 May 2004 10:12:58 +0300
From: Pantelis Antoniou <panto@intracom.gr>
MIME-Version: 1.0
To: Phillip Lougher <phillip@lougher.demon.co.uk>
References: <4098DF0D.1040703@intracom.gr> <40990798.9020703@avtrex.com>
	<4099281B.1070206@lougher.demon.co.uk>
In-Reply-To: <4099281B.1070206@lougher.demon.co.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: Thomas Gleixner <tglx@linutronix.de>
cc: David Woodhouse <dwmw2@infradead.org>
cc: David Daney <ddaney@avtrex.com>
Subject: Re: [patch] Allow any filesystem on MTD Nand when Read Only
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Phillip Lougher wrote:

> David Daney wrote:
>
>> Pantelis Antoniou wrote:
>>
>>>
>>> The following patch allows you to have any filesystem over NAND when 
>>> mounted
>>> read only.
>>
>> After more thought, I am in the process of doing something similar.
>>
>
> I have also been doing something similar to this - though I put the 
> bad block handling into Squashfs (another RO compressed filesystem).  
> It therefore seems as if all the possible approaches have been tried: 
> putting the bad block code in the NAND layer; implementing a new RO 
> block-driver; and putting the bad block code in the RO filesystem!  It 
> definately seems as if there is a requirement for this in the main 
> source.
>
> Pantelis have you looked at Squashfs?  This filesystem gives much 
> better compression than CRAMFS.
>
I've taken a look at squashfs. It does seems nicer than CRAMFS.

My main problem is not that it's not in the kernel proper, but it's not 
in by bootloader too.
If you took a look at u-boot and implemented squashfs support I would 
probably switch.

> Phillip
>
>
>
>
Regards

Pantelis
