Received: from [61.220.198.131] (helo=mail.coventive.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BYjZS-0001IS-9D
	for linux-mtd@lists.infradead.org; Fri, 11 Jun 2004 06:47:43 -0400
Message-ID: <40C98DD7.8090303@coventive.com>
Date: Fri, 11 Jun 2004 18:47:51 +0800
From: Jason Chen <jason_chen@coventive.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <40C97F5F.2070309@coventive.com>
	<200406111211.56014.tglx@linutronix.de>
In-Reply-To: <200406111211.56014.tglx@linutronix.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: undefined reference to `tx4925_read_nfmc'
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


There are no "tx4925_nand.h" in my kernel source. I use "tx4925.h" 
instead of it, but it seems to lack something. Please kindly tell me 
where can I find it?

Thanks in advance.

Jason Chen

Thomas Gleixner ??:

>On Friday 11 June 2004 11:46, Jason Chen wrote:
>  
>
>>Hello sir/madam;
>>
>>I'am working on Toshiba TX4925 board with Linux 2.4.22 and I want to use
>>jffs2 on NAND flash. I have run the mtd patch on my kernel, but now my
>>kernel doesn't compile anymore, the error message is:
>>
>>drivers/mtd/mtdlink.o: In function `tx4925ndfmc_readecc':
>>drivers/mtd/mtdlink.o(.text+0x13ab4): undefined reference to
>>`tx4925_read_nfmc'
>>    
>>
>
>This function is a macro / inline and not part of the mtd subsystem. 
>
>#include <asm/tx4925/tx4925_nand.h>
>
>should contain this. 
>
>  
>
