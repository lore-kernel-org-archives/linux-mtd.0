Received: from anchor-post-33.mail.demon.net ([194.217.242.91])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BLRVA-000594-OF
	for linux-mtd@lists.infradead.org; Wed, 05 May 2004 19:52:16 +0100
Message-ID: <4099281B.1070206@lougher.demon.co.uk>
Date: Wed, 05 May 2004 18:44:59 +0100
From: Phillip Lougher <phillip@lougher.demon.co.uk>
MIME-Version: 1.0
To: David Daney <ddaney@avtrex.com>
References: <4098DF0D.1040703@intracom.gr> <40990798.9020703@avtrex.com>
In-Reply-To: <40990798.9020703@avtrex.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

David Daney wrote:
> Pantelis Antoniou wrote:
>>
>> The following patch allows you to have any filesystem over NAND when 
>> mounted
>> read only.
> After more thought, I am in the process of doing something similar.
> 

I have also been doing something similar to this - though I put the bad 
block handling into Squashfs (another RO compressed filesystem).  It 
therefore seems as if all the possible approaches have been tried: 
putting the bad block code in the NAND layer; implementing a new RO 
block-driver; and putting the bad block code in the RO filesystem!  It 
definately seems as if there is a requirement for this in the main source.

Pantelis have you looked at Squashfs?  This filesystem gives much better 
compression than CRAMFS.

Phillip
