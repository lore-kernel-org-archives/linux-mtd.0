Received: from marasystems.com ([213.15.252.90] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mc45-0001iz-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 16:27:33 +0100
Date: Wed, 4 Sep 2002 17:27:30 +0200 (CEST)
From: =?ISO-8859-1?Q?Henrik_Nordstr=F6m?= <hno@marasystems.com>
To: Mark Meade <mark@lakeshoremicro.com>
cc: linux-mtd@lists.infradead.org, Karim Yaghmour <karim@opersys.com>,
   Ilguiz Latypov <ilatypov@superbt.com>
Subject: Re: No more DoC hotplug on Grub fail [tested & working]
In-Reply-To: <20020904145950.DRRI12451.rwcrmhc51.attbi.com@there>
Message-ID: <Pine.LNX.4.44.0209041715300.11031-100000@filer.marasystems.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Wed, 4 Sep 2002, Mark Meade wrote:

> This patch, while potentially useful during debugging, takes up precious 
> space that may be needed later (to add support for new flash devices, etc).  

Exacly what kind of precious space does it take up? If you have another
kind of flash device you better make another stage1 for that device,
right?

If the stage1 are size is a concern on DoC, then perhaps it should be 
considered to have a kind of "stage1.5" for DoC. 

Also, for most practical purposes, having the "skip GRUB on this boot"  
check in stage2 would also be fine I think, except for the few who are
playing around with custom stage1 loaders and those who are should
probably have a setup where they can reflash their DoC without these
concerns anyway..

> Also, once Grub is booting correctly from the DoC, I would think this feature 
> would not be needed.

Except if a later upgrade of GRUB fails.. or you for some other reason 
need to bypass the GRUB in service purposes. Such as if the GRUB menu has 
got fucked up with no way to get to the GRUB prompt.

> For what it's worth, I'd recommend that this patch be made available in the 
> patches directory of the CVS tree, rather than making it part of the official 
> GRUB code.

Better than nothing ;-)

> I'm willing to revise my GRUB/DoC HOWTO to include instructions on the use of 
> this patch, for those who are concerned about this issue.

I would not install a GRUB without it. Have had to use it (and the M-Sys 
Alt+B sister) several times already due to various reasons..

Regards
Henrik
