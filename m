Received: from ultra.secret.org.uk ([194.154.178.202] helo=ultra)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15F0vN-0006s6-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Jun 2001 23:03:09 +0100
From: Simon Evans <spse@secret.org.uk>
To: "Bao C. Ha" <baoha@sensoria.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Block device as MTD 
In-reply-to: Your message of "Tue, 26 Jun 2001 14:41:14 PDT."
             <01e501c0fe88$ba42a0f0$326c020a@SENSORIA>
Date: Tue, 26 Jun 2001 21:58:03 +0100
Message-Id: <E15EzuN-0008RQ-00@spoinky.secret.org.uk>
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

yes, just modprobe blkmtd device=/dev/hda3

Then you should get a new device in /dev/mtdblock/ (if you are using devfs)
just mount the /dev/mtdblock device.

cheers
si




>
>Can I mount a partition like /dev/hda3 or perhaps
>/dev/ide/host0/bus0/target0/lun0/part3?
>
>Bao
>
>> -----Original Message-----
>> From: linux-mtd-admin@lists.infradead.org
>> [mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Simon Evans
>> Sent: Tuesday, June 26, 2001 1:20 PM
>> To: linux-mtd@lists.infradead.org
>> Subject: Re: Block device as MTD 
>> 
>> 
>> 
>> I have checked this into CVS now. The following files are affected:
>> 
>> drivers/mtd/devices/blkmtd.c  - the driver itself
>> drivers/mtd/devices/Config.in
>> drivers/mtd/devices/Makefile
>> patches/Configure.help
>> 
>> Please consider this alpha software. It uses raw/io to the 
>> disk (not via
>> the buffer cache). Basic usage is:
>> 
>> modprobe blkmtd device=/dev/floppy/0  etc
>> 
>> If you are going to put a JFFS2 fs on the device, please note that
>> it can take quite a while to mount because JFFS2 scans every block.
>> A 96MB CF card took about 2 minutes.
>> 
>> On the plus side, if you have more memory then the size of the device,
>> you should find the whole device in the page cache ;)
>> 
>> cheers
>> si
>> 
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>> 
>
