Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16kPgD-00051Q-00
	for <linux-mtd@lists.infradead.org>; Mon, 11 Mar 2002 13:17:33 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <5.1.0.14.2.20020311140356.01e90ec0@pop3.terra.es> 
References: <5.1.0.14.2.20020311140356.01e90ec0@pop3.terra.es> 
To: Securez <securez@teleline.es>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problems compiling MTD 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 11 Mar 2002 13:28:51 +0000
Message-ID: <13502.1015853331@redhat.com>
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

securez@teleline.es said:
>  I redefine this references in include/asm/io.h to solve this, where
> need to  go this?? is correct here?? 

That should work. You can add these in include/linux/mtd/compatmac.h, 
dependent on LINUX_VERSION_CODE < KERNEL_VERSION(2,2,0).


securez@teleline.es said:
> I program the flash, and when i reboot, the kernel seems ok, but when
> a  message appears in the console: physmap flash device:40000 at
> 2000000 The system reboots, :(.

> What is happend?? 

I don't know. Are the address and length printed above correct? Can you 
debug it to work out _exactly_ how far it gets before rebooting?

--
dwmw2
