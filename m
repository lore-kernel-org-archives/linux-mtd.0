Received: from avtrex.com ([216.102.217.178])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BLOIQ-0004P5-UI
	for linux-mtd@lists.infradead.org; Wed, 05 May 2004 16:26:55 +0100
Message-ID: <40990798.9020703@avtrex.com>
Date: Wed, 05 May 2004 08:26:16 -0700
From: David Daney <ddaney@avtrex.com>
MIME-Version: 1.0
To: Pantelis Antoniou <panto@intracom.gr>
References: <4098DF0D.1040703@intracom.gr>
In-Reply-To: <4098DF0D.1040703@intracom.gr>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
cc: David Woodhouse <dwmw2@infradead.org>
cc: Thomas Gleixner <tglx@linutronix.de>
cc: linux-mtd@lists.infradead.org
Subject: Re: [patch] Allow any filesystem on MTD Nand when Read Only
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pantelis Antoniou wrote:

> Hello there.
>
> The following patch allows you to have any filesystem over NAND when 
> mounted
> read only.
>
> The main drive for this was that I wanted to use CRAMFS over NAND 
> flash since
> it has a much higher compression ratio than JFFS2.
>
> How it works is pretty simple.
>
> It's pretty reasonable assumption that bad blocks are created only when
> writting to NAND. So in the read-only case it is possible to skip over 
> the bad
> blocks and offer a bad-block free block device to the upper layers.
> This allows us to utilize any filesystem when  read-only.
>
> In order to speed the mount operation the bad block detection is 
> performed lazilly.
>
> Using the patch I was able to mount as read-only CRAMFS/JFFS2 partitions
> which contained simulated bad-blocks.
>
> Awaiting your comments...
>
> Regards
>
> Pantelis
>
After more thought, I am in the process of doing something similar.

However my changes are not quite done yet.  Roughly it goes like this:

Write a new read-only block driver that skips bad blocks and uses ECC 
reads.  This allows any read only file system to use it (ie cramfs).  
The bad block map is kept in the first non-bad page in the partition, 
when the driver is installed it reads the bad block map.

To write the data into the mtd, you have a special version of nandwrite 
that checks for bad blocks while writing the image and finally writes 
the bad block map.

One difference between my approach and yours is that no existing mtd 
driver code is touched, it is simply another mtd block driver.

David Daney.
