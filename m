Received: from tomts13-srv.bellnexxia.net ([209.226.175.34])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Hpsu-0008B6-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2002 18:56:48 +0100
Date: Tue, 11 Jun 2002 13:56:45 -0400 (EDT)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Matt Vestal <vestal@activmedia.com>
cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: DOC2000 and Grub
In-Reply-To: <Pine.LNX.4.21.0206111311350.31856-100000@server.activmedia.com>
Message-ID: <Pine.LNX.4.44.0206111352040.407-100000@server.superbt.com>
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

On Tue, 11 Jun 2002, Matt Vestal wrote:

> Also, the partition table gets easily corrupted.

You might have noticed the today's posting by David Woodhouse on 
importance of NFTL driver being inactive when re-formatting the chip.  I 
reboot few times to achieve that:

    erase_all /dev/mtd0
    doc_loadbios /dev/mtd0 grub_firmware
    reboot

    # Now it is unlikely the NFTL driver will find an NFTL signature on 
    # the chip.
    erase_all /dev/mtd0   # erase again since the previous erase might
                          # be spoiled by the NFTL driver
    doc_loadbios /dev/mtd0 grub_firmware
    nftl_format /dev/mtd0 98304
    fdisk /dev/nftla
    mke2fs /dev/nftlaX
    ...

Ilguiz
