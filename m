Received: from repulse.teligenthost.com ([207.155.249.3])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15F0WJ-0006pr-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2001 22:37:15 +0100
From: "Bao C. Ha" <baoha@sensoria.com>
To: "'Simon Evans'" <spse@secret.org.uk>, <linux-mtd@lists.infradead.org>
Subject: RE: Block device as MTD 
Date: Tue, 26 Jun 2001 14:41:14 -0700
Message-ID: <01e501c0fe88$ba42a0f0$326c020a@SENSORIA>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <E15EzJQ-0008Px-00@spoinky.secret.org.uk>
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

Can I mount a partition like /dev/hda3 or perhaps
/dev/ide/host0/bus0/target0/lun0/part3?

Bao

> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org
> [mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Simon Evans
> Sent: Tuesday, June 26, 2001 1:20 PM
> To: linux-mtd@lists.infradead.org
> Subject: Re: Block device as MTD 
> 
> 
> 
> I have checked this into CVS now. The following files are affected:
> 
> drivers/mtd/devices/blkmtd.c  - the driver itself
> drivers/mtd/devices/Config.in
> drivers/mtd/devices/Makefile
> patches/Configure.help
> 
> Please consider this alpha software. It uses raw/io to the 
> disk (not via
> the buffer cache). Basic usage is:
> 
> modprobe blkmtd device=/dev/floppy/0  etc
> 
> If you are going to put a JFFS2 fs on the device, please note that
> it can take quite a while to mount because JFFS2 scans every block.
> A 96MB CF card took about 2 minutes.
> 
> On the plus side, if you have more memory then the size of the device,
> you should find the whole device in the page cache ;)
> 
> cheers
> si
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
