Received: from n1.cetrtapot.si ([89.212.80.162])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K6M7p-0007QX-Nn
	for linux-mtd@lists.infradead.org; Wed, 11 Jun 2008 08:56:14 +0000
Message-ID: <484F92E5.2080207@cetrtapot.si>
Date: Wed, 11 Jun 2008 10:55:01 +0200
From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: Andre Puschmann <andre.puschmann@stud.tu-ilmenau.de>
Subject: Re: Mounting mtd block device raises "Block device required"
References: <g2o39t$703$1@ger.gmane.org>
In-Reply-To: <g2o39t$703$1@ger.gmane.org>
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
> Hi list,
> 
> I am successfully running kernel 2.6.21 on a custom AT91RM9200-based
> board. I now updated to kernel 2.6.25 for various reasons.
> 
> Now, we use the _new_ atmel_spi driver and mtd_dataflash driver (but the
> problem also exist if I use the legacy one). If I try to mount a
> jffs2 or cramfs image on dataflash I get the following error:
> # mount /dev/mtdblock5 /mnt/flash
> mount: mounting /dev/mtdblock5 on /mnt/flash failed: Block device required
> 
> Exactly the same line works with the 2.6.21 kernel. Also doing a cat
> on the normal /dev/mtd* nodes also works.

Char device seems to work..

> 
> "cat /proc/devices" shows:
> 
> Block devices:
>   7 loop
>  31 mtdblock
> 
> So I have no idea here. Any hints?

What is the ls -l /dev/mtdblock5 output?
Also could you try:
mount -t jffs2 /dev/mtdblock5 /mnt/flash

HTH,
Hinko

-- 
ČETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar@cetrtapot.si
Http: www.cetrtapot.si
