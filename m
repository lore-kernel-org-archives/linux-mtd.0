Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fVuP-00048a-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Feb 2002 00:55:57 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <AEA9DCA73595D411A6D4009027DE9C5E019BF9E3@MSI-EX6> 
References: <AEA9DCA73595D411A6D4009027DE9C5E019BF9E3@MSI-EX6> 
To: Vadim Khmelnitsky <VadimK@m-sys.com>
Cc: 'Ilguiz Latypov' <ilatypov@superbt.com>,
    Mark Meade <mark@lakeshoremicro.com>, linux-mtd@lists.infradead.org
Subject: Re: DiskOnChip 2000 and Millenium support in GRUB bootloader 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 26 Feb 2002 01:06:48 +0000
Message-ID: <12174.1014685608@redhat.com>
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

VadimK@m-sys.com said:
> [Ilguiz] Vadim, should the Millennium SPL check sum include IPL?
> [Vadim] No . IPL of Millennium chip copies 7K of data out of offset
> 0x400 and calculates the checksum  , which should be 0x55 . If it's
> not 0x55 IPL returns to BIOS without executing SPL . 

What we want to achieve here is to install a tiny INT 19h handler which 
instead of bootstrapping the normal way, loads the Grub bootloader from the 
DiskOnChip IPL area and runs it. 

That tiny INT 19h handler and the code to install it ought to fit in the 
512-byte IPL space on the Millennium, so I think we should be writing our 
own version of the IPL code on the Millennium, rather than using the 
existing IPL which tries to load a whole 8KiB of SPL.

On the DiskOnChip 2000, the IPL in ROM loads the whole 8KiB, but still we 
only use 512 bytes for our own INT 19h-installer code, and that later 
reloads the whole of Grub from the flash. You can see this code at

ftp://www.uk.linux.org/pub/people/dwmw2/mtd/cvs/mtd/grub/doc_stage1.S
ftp://www.uk.linux.org/pub/people/dwmw2/mtd/cvs/mtd/grub/doc_stage1b.S

Some documentation is in the 'README' file in the same directory.

--
dwmw2
