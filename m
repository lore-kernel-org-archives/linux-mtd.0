Received: from tomts20-srv.bellnexxia.net ([209.226.175.74])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZDKD-00032E-00
	for <linux-mtd@lists.infradead.org>; Mon, 29 Jul 2002 17:24:50 +0100
Date: Mon, 29 Jul 2002 12:24:47 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Frank Oltmanns <frank.oltmanns.ml@gmx.de>
cc: linux-mtd@lists.infradead.org
Subject: Re: Compiling Grub for DOC2000
In-Reply-To: <20537.1027956511@www7.gmx.net>
Message-ID: <Pine.LNX.4.44.0207291211590.20751-100000@server.superbt.com>
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

On Mon, 29 Jul 2002, Frank Oltmanns wrote:

> 1) With grub on my DoC, I can't boot from diskette anymore (I want to use
> Etherboot)

This can probably be solved by changing this line in stage2/stage2.c

                    is_opened = find_config(0x80);

to

                    is_opened = find_config(0);

>       nftl_format /dev/mtd0 90112  (since my firmware is 89792 bytes)

You may need to specify a multiple of 16 KiB as a start of NFTL layer in
case your erase block size is 16 KiB.  Make sure the /dev/nftl* drivers
weren't activated or were unloaded when running nftl_format.

>       fdisk /dev/nftla  (created 1 partition)

I believe it is required to reload the MTD NFTL driver between nftl_format
and any subsequent actions against /dev/nftl*.  Since my kernel has MTD
NFTL driver compiled in, I need to reboot.

Check out 

    http://lists.infradead.org/pipermail/linux-mtd/2002-June/005240.html

for detailed instructions.

Ilguiz
