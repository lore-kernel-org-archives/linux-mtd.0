Received: from web9404.mail.yahoo.com ([216.136.129.110])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 175GgV-0005ME-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 May 2002 02:56:04 +0100
Message-ID: <20020508015602.65389.qmail@web9404.mail.yahoo.com>
Date: Tue, 7 May 2002 18:56:02 -0700 (PDT)
From: Matt Cochran <matthewcochran@yahoo.com>
Subject: Filesystem Driver Panic 
To: linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>
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

I've been developing a system using kernel 2.4.18 and
the MTD drivers packaged with it on a system with a
Millenium DOC. I've enabled read-write support and can
successfully read the test VFAT filesystem on the DOC.
However, after multiple writes, approximately 6, I get
a "filesystem panic" from the kernel, and the device
is remounted read-only.

During the course of this, I've run nftl_format, tried
several filesystems, and repeated this on two systems
with identical hardware. Has anyone reported or
experienced the same kind of issues?


__________________________________________________
Do You Yahoo!?
Yahoo! Health - your guide to health and wellness
http://health.yahoo.com
