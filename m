Received: from setabox.com.tw ([220.135.128.161] helo=mail.setabox.com.tw)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D9ame-0008B9-26
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2005 22:25:53 -0500
Message-ID: <42310F21.5030405@setabox.com>
Date: Fri, 11 Mar 2005 11:23:13 +0800
From: William J Beksi <wjbeksi@setabox.com>
MIME-Version: 1.0
To: tglx@linutronix.de, linux-mtd@lists.infradead.org
References: <4209C985.3020902@setabox.com>
	<1108969145.24721.419.camel@tglx.tec.linutronix.de>
In-Reply-To: <1108969145.24721.419.camel@tglx.tec.linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: [PATCH] accessing NAND flash through an IDE interface
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:
> @@ -84,6 +84,8 @@
>  #include <linux/mtd/partitions.h>
>  #endif
>  
> +#define NAND_USE_IO_INSTR      0
> 
> As I said before, I'm not going to accept a change which needs to tweak
> a source file to make use of it.

I was not aware of this. I have made all the changes as per your 
suggestion and then you finally reject the patch, a little discouraging.

Is there any other way let people choose between using readb/inb and 
writeb/outb inside nand_base.c? Or should I just create my own separate 
patch to allow people to use the driver and make it available elsewhere?

Thank you,
William
