Received: from mail.redswitch.com ([206.14.68.143] helo=redswitch.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18X3K8-0007OG-00
	for <linux-mtd@lists.infradead.org>; Fri, 10 Jan 2003 17:52:04 +0000
Received: from [192.168.4.57] (account xjin HELO redswitch.com)
  by redswitch.com (CommuniGate Pro SMTP 3.5.9)
  with ESMTP id 2676521 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2003 10:23:07 -0800
Message-ID: <3E1F0F47.1080606@redswitch.com>
Date: Fri, 10 Jan 2003 10:21:59 -0800
From: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: set_user_nice() not defined on 2.4.21+
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

Hi,

When compiled JFFS2 with kernel 2.4.21-pre3, the linker complains that 
the reference to set_user_nice() in function 
jffs2_garbage_collect_thread() hasn't been defined. I traced the code 
down to <linux/mtd/compatmac.h> and found that set_user_nice() is not 
defined if linux verion is equal or greater than 2.4.21. See the code 
below. Why? Does it mean that 2.4.21+ has already such a function 
defined somewhere else or that 2.4.21+ doesn't need it? Actually I 
searched 2.4.21-pre3 code and found no set_user_nice() defined except in 
<linux/mtd/compatmac.h>. I guess it's possibly a bug.

#if LINUX_VERSION_CODE < KERNEL_VERSION(2,4,0)   /* Is this right? */
#define set_user_nice(tsk, n) do { (tsk)->priority = 20-(n); } while(0)
#elif LINUX_VERSION_CODE < KERNEL_VERSION(2,4,21) && 
!defined(RED_HAT_LINUX_KERNEL)
#define set_user_nice(tsk, n) do { (tsk)->nice = n; } while(0)
#endif

-- 
Shawn Jin
RedSwitch Inc.
