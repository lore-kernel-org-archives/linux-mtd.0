Received: from msr87.hinet.net ([168.95.4.187] helo=msr.hinet.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17c1lW-0005w5-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 11:40:38 +0100
From: "Steve Tsai" <startec@ms11.hinet.net>
To: "'Thomas Gleixner'" <tglx@linutronix.de>
Cc: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: RE: NAND Configuration
Date: Tue, 6 Aug 2002 18:40:32 +0800
Message-ID: <001c01c23d35$b0e899f0$5501a8c0@synso.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1028624857.19435.2.camel@thomas.tec.linutronix.de>
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


-----Original Message-----
From: linux-mtd-admin@lists.infradead.org
[mailto:linux-mtd-admin@lists.infradead.org] On Behalf Of Thomas
Gleixner
Sent: Tuesday, August 06, 2002 5:08 PM
To: Steve Tsai
Cc: Linux MTD mailing list
Subject: Re: NAND Configuration


On Tue, 2002-08-06 at 09:25, Steve Tsai wrote:
> Does I have to set CONFIG_MTD_NAND_ECC_JFFS2=y and 
> CONFIG_JFFS2_FS_NAND=y to use NAND flash? Weh I set these settings, I 
> will get the following easily. If  I did not set these settings and 
> the condition is better, still has problem, but it will not halt the 
> system. If I need not set CONFIG_MTD_NAND_ECC_JFFS2=y and 
> CONFIG_JFFS2_FS_NAND=y, I can trace my problem easily. I use 
> mtd-snapshot-20020731.tar.bz2 with uClinux.
You have to set it. Read http://linux-mtd.infradead.org/tech/nand.html

I read it many time, but CONFIG_JFFS2_FS_NAND use to take care buffering
and OOB . Does I have to use it absolutely? If I do not use it, what's
the result of the driver?

> 
> ARGH. About to write node to 0x0018de8c on flash, but there are data 
> already the
> re:
> 0x0018de8c: 85 19 04 20 74 01 00 00 4d 62 52 56 ff ff ff ff pid 24: 
> failed 256
> 
> jffs2_flush_wbuf(): Write failed with -5
> Write of 68 bytes at 0x004da000 failed. returned -5, retlen 0 Not 
> marking the space at 0x004da000 as dirty because the flash driver 
> returned r etlen zero
We need more info from mount onwards.

Maybe I do not provide repeatable messages and steps. The following are
the steps I use.
1. eraseall /dev/mtd1            
2. mount -t jffs2 /dev/mtdblock1 /mnt
3. Make directory to /mnt
4. Use ftp to copy files to /mnt
5. Change the kernel to to mount /dev/mtdblock1 as root FS.
6. Copy or delete files and sometime the message display
	ARGH. About to write node to 0x003f9e2c on flash, but there are
data already the re:...
    After that, the patition will display more error messages, ECC error
and others.

Regards,
Steve tsai

 
