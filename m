Received: from n58.bullet.mail.sp1.yahoo.com ([98.136.44.46])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kb477-0007PX-5k
	for linux-mtd@lists.infradead.org; Thu, 04 Sep 2008 01:58:25 +0000
Date: Wed, 3 Sep 2008 18:58:22 -0700 (PDT)
From: Kaima Ko <kaimi2005@yahoo.com>
Subject: Finding a valid solution for upgrading an in-use jffs2 filesystem
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <342445.15201.qm@web44904.mail.sp1.yahoo.com>
Reply-To: kaimi2005@yahoo.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I have a jffs2 partition being mounted rw. Some executables on this jffs2
are being loaded and run in RAM. And I am using low-level erase/copy 
(flash_erase from mtd-util and dd command) to upgrade this jffs2 partition 
while those executables running (and my mission is to keep them running during upgrading). I am sure that during the upgrading time, all those 
executables (and also other applications in my system) don't access the jffs2 file system. But the upgrading isn't always successful. Very seldom, 
but it still happened that the kernel hangs during flash erase/write. I 
think the jffs2 garbage collector may be the cause (though I read that the 
gc only starts when some app requires more space, but during low-level 
erase/write and no app accesses the jffs2 so the gc would not run). To be 
sure, I killed the gc daemon before upgrading. Since then, I don't see the 
problem happens again.

But with limited understanding about jffs2 and filesytem in general, I am so afraid that the things I've done still isn't a valid solution for 
upgrading an in-use jffs2 filesystem. Can gc be the cause of the case of 
kernel hang? Can the gc automatically starts again after I kill it? Is 
there any other thing I must consider?

Thank you!
KM




      
