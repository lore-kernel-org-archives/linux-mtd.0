Received: from anchor-post-34.mail.demon.net ([194.217.242.92])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AvZoG-0001zm-0q
	for linux-mtd@lists.infradead.org; Tue, 24 Feb 2004 10:29:04 +0000
Received: from baydel.demon.co.uk ([158.152.156.193])
	by anchor-post-34.mail.demon.net with esmtp (Exim 3.35 #1)
	id 1AvZoE-000Kos-0Y
	for linux-mtd@lists.infradead.org; Tue, 24 Feb 2004 10:29:02 +0000
From: "" <simon@baydel.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 24 Feb 2004 09:48:14 -0000
MIME-Version: 1.0
Message-ID: <403B1DDE.22464.B72D0@localhost>
In-reply-to: <4039DF0F.25483.F9554@localhost>
References: <4034E8ED.5757.55A2D9@localhost>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: Re: JFFS2 Corruption.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On 19 Feb 2004 at 16:48, simon@baydel.com wrote:
> 
> > I am having problems using JFFS2 filesystems on a NAND device. I
> > have had these problems in the past an decided not to use this
> > method for storing my data. I would really like to do this and I was
> > wondering if anyone else had been able to run such a system reliably
> > ? The NAND device is a 128MB SMC and I have downloaded the mtd code
> > from CVS within the last week.
> > 
> > I am using mtdpart to provide partitions but for the moment I am
> > only using mtd1 as a root file system. To build this I perform the
> > following steps.
> > 
> > 
> > 1. Boot system via network and mount nfs root
> > 2. eraseall /dev/mtd1
> > 3. mount -t jffs2 /dev/mtdblock1 /smc
> > 4. cd /smc
> > 5. tar xvzf /rootfilesystem.tgz
> > 6. unmount /smc
> > 
> > I then reboot using the SMC as my root filesystem. As the system
> > gets rebooted and incurrs more writes I get the following kinds of
> > message
> > 
> > Empty flash at 0x00469ffcb ends at 0x0046a000
> > 
> > or
> > 
> > jffs2_scan_dirent_node(): Node CRC failed on node at 0x0046a7f0 read
> > 0xffffffff calculated 0xdec8161b
> > 
> > I have written in before about these messages and I understand that
> > the first is of no concern but the second relates to write data
> > which may not have been written to the SMC.
> > 
> > The thing is I have had this happen on two completely different
> > harware designs. On an X86 board and the other a PPC. 
> > 
> > I have checked and the OS umounts root as it shuts down. Also I
> > cannot find fsck.jffs2 in the util directory. Does it exist ?
> > 
> > In trying to debug this I noticed that the device was still
> > reporting busy when nand_command was entered. I have put a line of
> > code in to delay until the device is ready at the start of the
> > routine. It is my understanding that if the device is busy when you
> > try and select/deselect or send a command the outcome cannot be
> > predicted. If this is not the case I would like to understand why.
> > If it is how does any of the NAND code work ? 
> > 
> > Any help greatly appreciated 
> > 
> > 
> > Cheers Simon.
> > 
> > 
> > 

On 23 Feb 2004 at 11:07, simon@baydel.com wrote:

> As I have been trying to use this as a root filesystem I checked made
> checks into the dismounting of the filesystem. It seems that the halt
> script remounts root read only. However I found that this does not
> cause mtdblock to flush it's cache. I have written a small program to
> perform an ioctl BLKFLSBUF and I call it after the system mounts root
> read only. This seems to help but it is not the whole story.
> 
> I have also trawled the archives. There are some articles which list
> similar problems. It is proposed that these are related to unaligned 
> memory access. Can anyone explain why this matters and how to prevent
> it.
> 
> My current architecture is PPC.
> 
> Many Thanks
> 
> 
> Simon.
> 
> 

Comitted the sin of posting a reply with the reply text first, sorry.

I have only managed to get this to fail if the jffs2 filesystem is mounted as root. I do 
not seem to be able to get it to close and unmount the filesystem at shutdown. I 
guess the BLKFLSBUF I do only flushes the buffer that is created when I open the 
device and not the one that was created when the kernel opened the device. 

My current thoughts are to create a ro root and and additional rw. Is there a better 
way that I can do this ?

Cheers 

Simon. __________________________

Simon Haynes - Baydel 
Phone : 44 (0) 1372 378811
Email : simon@baydel.com
__________________________
