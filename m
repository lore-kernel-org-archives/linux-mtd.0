Received: from tomts9.bellnexxia.net ([209.226.175.53] helo=tomts9-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17c8hT-00076Z-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 19:04:55 +0100
Date: Tue, 6 Aug 2002 14:04:44 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Glen <mtd@empireenterprises.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: boot from diskonchip millenium
In-Reply-To: <1028656482.16600.20.camel@glen>
Message-ID: <Pine.LNX.4.44.0208061356340.9804-100000@server.superbt.com>
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

On 6 Aug 2002, Glen wrote:

> Attempting to open /boot/grub/menu.lst 0x0 0x0
> Attempting to open /boot/grub/menu.lst 0x0 0x1

I believe there were attempts to open configuration file on disk 0xe0
(DiskOnChip fake BIOS drive number just for the GRUB's internal BIOS disk
access API).  This always happens when the grub_firmware was compiled by
running aclocal/autoconf/automake commands from README_DiskOnChip and
specifying the --enable-diskonchip-mil option.  [The latest patches are
0.92 and 2002-07-29].
 
> Ideas??

If you created a partition within NFTL layer, the "root (dc0,0)" command 
would be worth trying.

Ilguiz
