Received: from email.aftek.com ([128.121.126.111])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15D3QZ-0006Cj-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Jun 2001 13:19:15 +0100
Received: from ashwin ([202.54.81.26]) by email.aftek.com (8.11.2) id f5LCOc537624 for <linux-mtd@lists.infradead.org>; Thu, 21 Jun 2001 06:24:39 -0600 (MDT)
Message-ID: <001101c0fa4d$3cc2a970$4f00000a@ashwin>
From: "Ashwin" <ashwinp@aftek.com>
To: <linux-mtd@lists.infradead.org>
Subject: __ioremap in physmem.c
Date: Thu, 21 Jun 2001 17:55:17 +0530
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

Hi friends,
    I am  trying to get the mtd working on the L7205 board. I am getting the
following problem.
    The __ioremap() call in physmem.c calls the function with only two
parameters but the __ioremap() in  the kernel expects 3 parmaters while only
2 are passed the third i.e flag is not sent. What should be the flag to this
call  and the significance of the flag ?

Another thing is that if I send the flag as zero the call does not return it
gives the error "bad pmd in pte_allocl_kernel".

Also what should be the macros for the functions readb,writeb,...... for
L7205 board at present I have put just printk's there or do I use the macros
in include/asm-arm/arch-linkup/io.h but they seem to be io calls  (am I
correct ?)

 Could any one please guide me ?

Thanks,
Regards,
Ashwin.
