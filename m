Received: from mail.wiscore.com ([210.241.236.27] helo=server3.wiscore.com)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FBUEB-0000p7-Cb
	for linux-mtd@lists.infradead.org; Tue, 21 Feb 2006 04:54:47 -0500
Message-ID: <43FAE356.2000401@wiscore.com>
Date: Tue, 21 Feb 2006 17:54:30 +0800
From: Robert Liu <robertliu@wiscore.com>
MIME-Version: 1.0
To: tglx@linutronix.de,  linux-mtd@lists.infradead.org
References: <43FA6A26.8000005@wiscore.com>
	<1140513914.2480.861.camel@localhost.localdomain>
In-Reply-To: <1140513914.2480.861.camel@localhost.localdomain>
Content-Type: text/plain; charset=Big5
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: do R/W tests on JFFS2 and suffer  segmentation fault
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:

>Which kernel version ? Any patches related to MTD/JFFS2 applied ?
>  
>
I am using the lastest CVS MTD codes.
More about the testing platform:
  Intel IXP-based board (big-endian) with a 32MB 8-bit NAND flash
  Kernl: linux-2.6.10
There is no patch related to MTD/JFFS2 applied.

>Thats the list_head poison code (see include/linux/list.h
>LIST_POISON1/2). The entry was removed before.
>
>	tglx
>
>  
>
Sorry, let me try to descript the testing again.
I run the testing script on JFFS2 partitions.
When on a real NAND flash, the script always failed
(at different iterations, less than 100).
But it passed on a nandsim (1000 iterations one time,
and more than 500 iterations serveral times).

If any information is needed, please tell me.

Thanks and Regards,
Robert
