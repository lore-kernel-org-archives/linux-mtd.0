Received: from tomts8.bellnexxia.net ([209.226.175.52] helo=tomts8-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17blcW-00041L-00
	for <linux-mtd@lists.infradead.org>; Mon, 05 Aug 2002 18:26:16 +0100
Date: Mon, 5 Aug 2002 13:26:14 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Glen <mtd@empireenterprises.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: boot from diskonchip millenium
In-Reply-To: <1028566085.12920.11.camel@glen>
Message-ID: <Pine.LNX.4.44.0208051313320.6631-100000@server.superbt.com>
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

On 5 Aug 2002, Glen wrote:

> The available grub patches seem to do absolutely nothing useful,

Interesting.  Are there any messages on screen during the system boot?  

Are there any errors in compiling and setting up the bootloader as
explained in README_DiskOnChip?  The latter file can be seen only after
applying the patch, sorry.

Have you tried the --enable-diskonchip-biosnetboot configuration parameter
and toggled the BIOS network boot option?

> the only lilo references I can find assume you are using msys's
> software.

One has to implement a simple BIOS INT 13h interface. I guess you can
re-use the GRUB MTD firmware open source code including its
bdev_diskonchip.c NFTL driver.

Once this is done, you would erase all /dev/mtd0 blocks preceding the NFTL
layer and run lilo against /dev/mtd0 so that it can install itself and the
list of filesystem block numbers relative to device /dev/nftla.  These
numbers are persistent.  This is unlike to locations of flash erase blocks
abstracted by the NFTL layer.

Ilguiz
