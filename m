Received: from n1.cetrtapot.si ([89.212.80.162])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K6N4a-0005VR-IU
	for linux-mtd@lists.infradead.org; Wed, 11 Jun 2008 09:56:57 +0000
Message-ID: <484FA122.1030208@cetrtapot.si>
Date: Wed, 11 Jun 2008 11:55:46 +0200
From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: Andre Puschmann <andre.puschmann@stud.tu-ilmenau.de>
Subject: Re: Mounting mtd block device raises "Block device required"
References: <g2o39t$703$1@ger.gmane.org> <484F92E5.2080207@cetrtapot.si>
	<g2o5oo$fqe$1@ger.gmane.org>
In-Reply-To: <g2o5oo$fqe$1@ger.gmane.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andre Puschmann wrote:
> Hi,
> 
> Hinko Kocevar wrote:
>> Char device seems to work..
> 
> Yes, sorry for being not precise.
> Coping a jffs2 image (in 2.6.25) at /dev/mtd5 and mouting the same one
> in 2.6.21 (/dev/mtdblock5) works. So accessing the flash as a character
> device works.
> 
>> What is the ls -l /dev/mtdblock5 output?
> 
> As expected:
> $ ls -l /dev/mtdblock5
> brw-rw----    1 root     root      31,   5 Jan  1  1970 /dev/mtdblock5
> 

Good.

> 
>> Also could you try:
>> mount -t jffs2 /dev/mtdblock5 /mnt/flash
> 
> I also tried that:
> 
> # mount -t jffs2 /dev/mtdblock5 /mnt/flash
> mount: mounting /dev/mtdblock5 on /mnt/flash failed: Invalid argument
> 

Is this true (kernel config)?:
CONFIG_JFFS2_FS=y

> 
> But it seems like it has to do something with the block device driver
> mapping:
> 
> $ head -n 2 /dev/mtdblock5 | hexdump -C
> head: /dev/mtdblock5: No such device or address
> 

What about kernel configuration around the MTD block devices? I think these should be enabled:
CONFIG_MTD_BLKDEVS=y
CONFIG_MTD_BLOCK=y

-- 
ČETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar@cetrtapot.si
Http: www.cetrtapot.si
