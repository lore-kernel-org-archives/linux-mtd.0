Received: from maild.telia.com ([194.22.190.101])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18X7ie-0007rx-00
	for <linux-mtd@lists.infradead.org>; Fri, 10 Jan 2003 22:33:40 +0000
Message-ID: <003101c2b8fc$a0947b30$0200a8c0@jockeXP>
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "Xiaogeng \(Shawn\) Jin" <xjin@redswitch.com>,
   <linux-mtd@lists.infradead.org>
References: <3E1F0F47.1080606@redswitch.com>
Subject: Re: set_user_nice() not defined on 2.4.21+
Date: Sat, 11 Jan 2003 00:04:28 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hi

I had the impression that set_user_nice() would be in 2.4.21 when I added set_user_nice() to 
mtd/compatmac.h. I can change it to KERNEL_VERSION(2,5,0) or someone can
submit a patch to Marcelo.

    Jocke

> Hi,
> 
> When compiled JFFS2 with kernel 2.4.21-pre3, the linker complains that 
> the reference to set_user_nice() in function 
> jffs2_garbage_collect_thread() hasn't been defined. I traced the code 
> down to <linux/mtd/compatmac.h> and found that set_user_nice() is not 
> defined if linux verion is equal or greater than 2.4.21. See the code 
> below. Why? Does it mean that 2.4.21+ has already such a function 
> defined somewhere else or that 2.4.21+ doesn't need it? Actually I 
> searched 2.4.21-pre3 code and found no set_user_nice() defined except in 
> <linux/mtd/compatmac.h>. I guess it's possibly a bug.
> 
> #if LINUX_VERSION_CODE < KERNEL_VERSION(2,4,0)   /* Is this right? */
> #define set_user_nice(tsk, n) do { (tsk)->priority = 20-(n); } while(0)
> #elif LINUX_VERSION_CODE < KERNEL_VERSION(2,4,21) && 
> !defined(RED_HAT_LINUX_KERNEL)
> #define set_user_nice(tsk, n) do { (tsk)->nice = n; } while(0)
> #endif
> 
> -- 
> Shawn Jin
> RedSwitch Inc.
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
