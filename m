Received: from smtp-out.hamburg.pop.de ([195.222.210.86])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17kRsO-0001M3-00
	for <linux-mtd@lists.infradead.org>; Thu, 29 Aug 2002 17:10:32 +0100
Message-ID: <3D6E4770.6050905@goepel.com>
Date: Thu, 29 Aug 2002 18:10:24 +0200
From: Michael Palme <m.palme@goepel.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>,
        MTD Mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: 2.4.18-rmk7 + CVS jffs2 ld error (zlib)
References: <3D6E2A8D.4000502@goepel.com> <24260.1030630287@redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
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

thanks fot the answer.
but there is still one problem left:

background.c:92: warning: implicit declaration of function `set_user_nice'
fs/fs.o(.text+0x363a0): undefined reference to `set_user_nice'

the only place i've found this is <linux/mtd/compatmac.h> (link to the 
mtd-cvs):


#if LINUX_VERSION_CODE < KERNEL_VERSION(2,4,0)
         /* Is this right? */
#define set_user_nice(tsk, n) do { (tsk)->priority = 20-(n); } while(0)
#elif LINUX_VERSION_CODE < KERNEL_VERSION(2,4,18)
#define set_user_nice(tsk, n) do { (tsk)->nice = n; } while(0)
#endif

so in 2.4.18 there is nothing related....

what should i do??? (i think of #elif LINUX_VERSION_CODE < 
KERNEL_VERSION(2,4,19) )

thanks in advance ... Michael Palme



David Woodhouse schrieb:
> 
> m.palme@goepel.com said:
> 
>> so i grepped around in the list archive and found a possible solution
>>to  remove compr_zlib.o from COMPR_OBJS in jffs2/Makefile. Now after
>>rebuilding i get:
> 
> 
> Don't do that. Apply 
> 
> http://ftp.kernel.org/pub/linux/kernel/people/dwmw2/shared-zlib/linux-2.4.19-pre10-shared-zlib.gz 
> 
> 
> 
> --
> dwmw2
