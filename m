Received: from [208.178.55.66] (helo=server.activmedia.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Hq0a-0008Cc-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2002 19:04:44 +0100
Date: Tue, 11 Jun 2002 14:04:13 -0400 (EDT)
From: Matt Vestal <vestal@activmedia.com>
To: Ilguiz Latypov <ilatypov@superbt.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOC2000 and Grub
In-Reply-To: <Pine.LNX.4.44.0206111338410.407-100000@server.superbt.com>
Message-ID: <Pine.LNX.4.21.0206111354560.31856-100000@server.activmedia.com>
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

Now, with DOC_DEBUG defined -

[~/mtd/grub]$ ../util/doc_loadbios /dev/mtd0 grub_firmware 
Performing Flash Erase of length 16384 at offset 0
Performing Flash Erase of length 16384 at offset 16384
Performing Flash Erase of length 16384 at offset 32768
Performing Flash Erase of length 16384 at offset 49152
Performing Flash Erase of length 16384 at offset 65536
Performing Flash Erase of length 16384 at offset 81920
Writing the firmware of length 90112 at 0... Done.

I get the following when grub loads:

setup_part(): filename /boot/grub/menu.lst
open_device(): errnum 0, current_drive 0, current_partition ffffff
same_partition: yes
open_device(): errnum 21
setup_part(): errnum 21

Then a root (dc0,0) yields:

set_device(): device (dc0,0), drive 0
same_partition: yes
open_device(): errnum 0, current_drive e0, current_partition ffffff
same_partition: yes
open_device(): errnum 21

Error 21:  Selected disk does not exist.


Matt

On Tue, 11 Jun 2002, Ilguiz Latypov wrote:

> 
> On Tue, 11 Jun 2002, Matt Vestal wrote:
> 
> > The DOC loads Grub with no problem.  However, Grub has never been able to
> > see the DOC filesystem(s).  I've tried root (dc0), root (dc0,0), root
> > (dc0,1), etc, but nothing works.  I always get the "Selected disk does not
> > exist, error"
> 
> Any debug output on the screen when GRUB starts?
> 
> Does this diagnostic message show up?
> 
>    Spare Media Header for NFTL %d found in flash sector %d
> 
> Ilguiz
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
