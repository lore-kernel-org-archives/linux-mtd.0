Received: from avtrex.com ([216.102.217.178])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BLRkH-0005Kl-E9
	for linux-mtd@lists.infradead.org; Wed, 05 May 2004 20:07:53 +0100
Message-ID: <40993B7C.1010607@avtrex.com>
Date: Wed, 05 May 2004 12:07:40 -0700
From: David Daney <ddaney@avtrex.com>
MIME-Version: 1.0
To: Phillip Lougher <phillip@lougher.demon.co.uk>
References: <4098DF0D.1040703@intracom.gr> <40990798.9020703@avtrex.com>
	<4099281B.1070206@lougher.demon.co.uk>
In-Reply-To: <4099281B.1070206@lougher.demon.co.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: Thomas Gleixner <tglx@linutronix.de>
cc: Pantelis Antoniou <panto@intracom.gr>
cc: David Woodhouse <dwmw2@infradead.org>
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

It seems that if people want to use more than one type of RO filesystem, 
that putting the badblock handling in the block driver instead of every 
filesystem makes more sense.

David Daney.
