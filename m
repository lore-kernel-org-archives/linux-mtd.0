Received: from 213-97-242-113.uc.nombres.ttd.es ([213.97.242.113] helo=rebirth.wojtyla.org)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16lnCf-00043w-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Mar 2002 08:36:45 +0000
Received: from devil.teleline.es (devil.iqc-services.local [192.168.197.3])
	by rebirth.wojtyla.org (8.11.6/8.8.7) with ESMTP id g2F9Rth25145
	for <linux-mtd@lists.infradead.org>; Fri, 15 Mar 2002 10:27:56 +0100
Message-Id: <5.1.0.14.2.20020315094736.01e6de60@pop3.terra.es>
Date: Fri, 15 Mar 2002 09:47:55 +0100
To: linux-mtd@lists.infradead.org
From: Securez <securez@teleline.es>
Subject: Re: Problems compiling MTD 
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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


i put some printk functions, and it hags making the ioremap..

Regards.

At 13.28 11/3/02 +0000, you wrote:

>securez@teleline.es said:
> >  I redefine this references in include/asm/io.h to solve this, where
> > need to  go this?? is correct here??
>
>That should work. You can add these in include/linux/mtd/compatmac.h,
>dependent on LINUX_VERSION_CODE < KERNEL_VERSION(2,2,0).
>
>
>securez@teleline.es said:
> > I program the flash, and when i reboot, the kernel seems ok, but when
> > a  message appears in the console: physmap flash device:40000 at
> > 2000000 The system reboots, :(.
>
> > What is happend??
>
>I don't know. Are the address and length printed above correct? Can you
>debug it to work out _exactly_ how far it gets before rebooting?
>
>--
>dwmw2
>
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
