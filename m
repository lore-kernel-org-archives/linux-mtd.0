Received: from isengard.yottayotta.com ([209.115.177.37])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 170wZw-0000X1-00
	for <linux-mtd@lists.infradead.org>; Fri, 26 Apr 2002 04:39:24 +0100
Message-ID: <3CC8CB90.7020108@yottayotta.com>
Date: Thu, 25 Apr 2002 21:37:52 -0600
From: Murtada Shah <mshah@yottayotta.com>
MIME-Version: 1.0
To: linux-arm-kernel <linux-arm-kernel@lists.arm.linux.org.uk>,
	linux-mtd@lists.infradead.org
Subject: inode deleted
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

i'm using 2.4.18-rmk3
I was using 2.4.5-rmk7

the new one 2.4.18-rmk3 with latest mtd seems to erase an inode in 
jffs2_build_filesystem function in build.c... Although that's a valid 
directory.
 ("Inode #7 was a directory with chidlren... removing those too...")

I haven't made my filesystem with the newest mkfs.jffs2 of the latest 
mtd but did so with the older one (20000704). Could this be why? I'm 
just copying stuff over to the filesystem.

Murtada
