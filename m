Received: from web21104.mail.yahoo.com ([216.136.227.106])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19KU6m-0000tI-SG
	for <linux-mtd@lists.infradead.org>; Tue, 27 May 2003 03:22:37 +0100
Message-ID: <20030527022320.82607.qmail@web21104.mail.yahoo.com>
Date: Mon, 26 May 2003 19:23:20 -0700 (PDT)
From: Kien Phung Chi <pckien2001@yahoo.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <E19JAHR-0000y8-Sd@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Re: DiskOnChip MD2202-D256
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

You should format the DOC with driver 4.2: 
dformat /win:e000 /s:doc42.exb
and try to use MTD driver or you must use linux driver
ver4.2 from M-sys

> To: linux-mtd@lists.infradead.org
> Subject: DiskOnChip MD2202-D256
> 
> Hi,
> 
> 
> I'm just trying to install DiskOnChip MD2202-D256
> flash disk on my
> 2.4.21-rc2 linux. While loading modul by command
> 	'modprobe docprobe'
> 	
> these messages occurred on my screen:
> 
> DiskOnChip Millenium found at address 0xE0000
> Unknown flash chip found: 21 21
> Please report to dwmw2@infradead.org
> Unknown flash chip found: 21 21
> Please report to dwmw2@infradead.org
> Unknown flash chip found: A1 A1
> Please report to dwmw2@infradead.org
> No flash chips recognised.
> 
> This flash disk was formated by DOS command:
> 	dformat /win:e000 /s:doc514.exb
> 
> and that enabled C:\ disk under DOS.
> 
> DiskOnChip is a part of ICOP-6070 PC/104 Embedded
> CPU module.
> 
> Is there some HOWTO showing me how to install this
> DOC in Linux?
> 
> Is this DOC supported by MTD drivers in 2.4.21-rc2
> kernel?
> 
> Thanks,
> 
> Oskar


__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com
