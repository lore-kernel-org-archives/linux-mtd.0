Received: from tomts9.bellnexxia.net ([209.226.175.53] helo=tomts9-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16lXZf-0002hM-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Mar 2002 15:55:27 +0000
Date: Thu, 14 Mar 2002 11:06:28 -0500 (EST)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Veselin Mijuskovic <panzer@etf.bg.ac.yu>
cc: linux-mtd@lists.infradead.org
Subject: Re: DOC2000 + GRUB/LILO booting problems
In-Reply-To: <20020314152040.GA24274@etf.bg.ac.yu>
Message-ID: <Pine.LNX.4.44.0203141100270.3848-100000@server.superbt.com>
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

Veselin,

Could you overwrite the NFTL information when installing grub_firmware?  I 
believe one can re-format the chip with
    nftl_format /dev/mtd0 0x18000

The offset of NFTL layer must be the first available erase unit.

Ilguiz

On Thu, 14 Mar 2002, Veselin Mijuskovic wrote:

> The command 'root (dc0,0)' fails, as well as find. The partition
> /dev/nftla1 can be mounted with no problems when I boot from disk.
