Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16U33G-0002jv-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 Jan 2002 09:53:43 +0000
Date: Fri, 25 Jan 2002 11:04:39 +0100 (MET)
From: Robert Kaiser <rob@sysgo.de>
To: Navin Boppuri <navin.boppuri@newisys.com>
cc: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>,
   linux-mtd@lists.infradead.org
Subject: RE: MTD partitioning for AMD flash chips
In-Reply-To: <D3A72C5007329A4F991C0DD87202259F096A38@sekhmet.ad.newisys.com>
Message-ID: <Pine.LNX.4.21.0201251054060.24593-100000@dagobert.svc.sysgo.de>
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


On Thu, 24 Jan 2002, Navin Boppuri wrote:

> I wanted to start off with the first option. I did not want to use
> physmap.c and decided to create a file exactly similar to physmap.c and
> created the necessary CONFIG options. I hardcoded the WINDOW_SIZE and
> WINDOW_ADDR parameters in this file. Everything else is exactly similar
> to the physmap file ( I looked at the example for the rpxlite board
> support in the drivers/mtd directory). I started off without any
> partitions. But when I did try booting the kernel, cfi_probe came back
> without detecting the flash device. 
> 
> If I use physmap directly, cfi_probe detects my flash without any
> problem. What do I need to do to get the basic stuff working without
> directly using the physmap file? I want to start off without partitions
> and then start adding partitions to it. 
> 


Have a look at some of the mapping drivers, for example netsc520.c
You need to enable partioning in the MTD core options and from
your driver, and you need to call add_mtd_partitions() rather than
add_mtd_device().

Rob

----------------------------------------------------------------
Robert Kaiser                          email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany    fax:   (49) 6136 9948-10
