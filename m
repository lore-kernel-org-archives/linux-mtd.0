Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16eP4P-0006gV-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Feb 2002 23:25:41 +0000
Received: from ilatypov by infradead.org with local (Exim 3.20 #2)
	id 16ePFK-0007MF-00
	for linux-mtd@lists.infradead.org; Fri, 22 Feb 2002 23:36:58 +0000
Date: Fri, 22 Feb 2002 17:38:56 -0500 (EST)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Mark Meade <mark@lakeshoremicro.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip 2000 and Millenium support in GRUB bootloader 
In-Reply-To: <000b01c1bbe0$0e801cf0$0101a8c0@dellc800>
Message-ID: <Pine.LNX.4.44.0202221714050.8996-100000@server.superbt.com>
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

Mark,

On Fri, 22 Feb 2002, Mark Meade wrote:

> The doc_loadbios output to /dev/mtd0 is off by 512 bytes (when I use an
> offset of 1024):

Thanks for the correction.   I adjusted your patch to take into account 
the almost impossible case when IPL is bigger than erase sector.

> My system now recognizes that something is there, but refuses to boot:
>     Searching for boot record from SCSI: Not Found.

Perhaps, IPL refuses to execute SPL (GRUB's doc_stage1) because the
doc_stage1's check sum didn't include IPL itself.  

Vadim, should the Millennium SPL check sum include IPL?

The other thought is if the stage1 code can be placed instead of IPL.

Ilguiz
