Received: from h24-66-30-3.wp.shawcable.net ([24.66.30.3] helo=iders01.iders.ca)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1730Xn-0002S5-00
	for <linux-mtd@lists.infradead.org>; Wed, 01 May 2002 21:17:44 +0100
Received: from athlon ([200.123.101.48])
	by iders01.iders.ca (8.12.3/8.12.3/Debian -4) with SMTP id g41KHcIV013907
	for <linux-mtd@lists.infradead.org>; Wed, 1 May 2002 15:17:38 -0500
Message-ID: <001501c1f14d$3a21bd30$30657bc8@gatewest.net>
From: "Derek Ross" <dross@iders.ca>
To: <linux-mtd@lists.infradead.org>
Subject: User-space raw access of flash?
Date: Wed, 1 May 2002 15:17:33 -0500
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

Hello,

Is is possible to directly access the flash
memory from a user space application, by 
using writel and readl functions, or their
userspace equivalents? (writel and readl don't
appear to be available outside of kernel space).

Would mmap be a solution, or does that do caching
on the data reads and writes?

My problem is that I need to do some real-time 
logging into a circular buffer in flash. This will 
require non-blocking erases, which are not possible 
with any of the MTD drivers.

Load-leveling will not be a problem here.

Thanks,

Derek Ross.
