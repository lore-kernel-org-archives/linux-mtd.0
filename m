Received: from web21006.mail.yahoo.com ([216.136.227.60])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18F1te-00084J-00
	for <linux-mtd@lists.infradead.org>; Fri, 22 Nov 2002 00:42:14 +0000
Message-ID: <20021122011236.8686.qmail@web21006.mail.yahoo.com>
Date: Thu, 21 Nov 2002 17:12:36 -0800 (PST)
From: kas turi <inox_kas@yahoo.com>
Subject: Garbage collection failed
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
  I am running timesys linux on my custom made 8250
board. The board has AMD flash with interleaving as 2
and buswidth as 32. I have created two partitions one
for ppcboot and another jffs2. At the boot up the MTD
layer successfully probes the AMD flash and
recongnises both the partitions. After the kernel
boots I copy the JFFS2 image file into /dev/mtd/1.
When I mount the JFFS2 I keep getting the following
error:

"jffs2: No clean _or_ dirty blocks to GC from! Where
are they all?\n");

After delving into the code I found out that garbage
collection is done from a kernel thread. When I
comment out that code I am able to successfully mount
JFFS2. 

Any idea why the garbage collection is failing. 

Thanks in advance



__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus – Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com
