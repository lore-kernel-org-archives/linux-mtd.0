Received: from t111.niisi.ras.ru ([193.232.173.111] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 153HH0-00008j-00
	for <linux-mtd@lists.infradead.org>; Fri, 25 May 2001 14:04:58 +0100
Received: from t06.niisi.ras.ru (t06.niisi.ras.ru [193.232.173.6])
	by t111.niisi.ras.ru (8.9.1/8.9.1) with ESMTP id RAA28797
	for <linux-mtd@lists.infradead.org>; Fri, 25 May 2001 17:04:25 +0400
Received: (from uucp@localhost) by t06.niisi.ras.ru (8.7.6/8.7.3) with UUCP id QAA10099 for linux-mtd@lists.infradead.org; Fri, 25 May 2001 16:58:14 +0400
Received: from niisi.msk.ru (t34 [193.232.173.34]) by niisi.msk.ru (8.8.8/8.8.8) with ESMTP id RAA16077 for <linux-mtd@lists.infradead.org>; Fri, 25 May 2001 17:03:29 +0400 (MSD)
Message-ID: <3B0E5857.636CBC17@niisi.msk.ru>
Date: Fri, 25 May 2001 17:04:23 +0400
From: andreev <andreev@niisi.msk.ru>
MIME-Version: 1.0
To: "linux-mtd@lists.infrared.org" <linux-mtd@lists.infradead.org>
Subject: Why timer interrupt is disabled?
Content-Type: text/plain; charset=koi8-r
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

Hi, list.
I have an Intel CFI compatible chip on my MIPS machine, which is mapped
on to the physical memory .When i compiled linux-2.4.1 kernel with Intel
CFI support, and booted my MIPS, linux hanged when i tried to read data
from flash.

Then, i inserted debugging printk functions, and found that i read data
insteed of status register from flash. ( Because my chip must be
programmed with double word commands ).  In this case, driver must
return -EIO in do_read_1_by_16_onechip after time out. But it do not,
because all interrupts were disabled before do_ftl_request called. In
do_ftl_request i found commented out sti() function. Why it were
commented out? I had a look to the current sourse in your CVS, and i
found that sti() is still commented out. Where we have to enable
interrupts? If driver works under the closed interrupts, why does it use
the time_after and jiffies?
Can anybody tell me abouut it?
