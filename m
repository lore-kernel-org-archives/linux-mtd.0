Received: from mail1.bizmail.net.au ([202.162.77.164])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GYXNY-0006U5-Ro
	for linux-mtd@lists.infradead.org; Fri, 13 Oct 2006 20:27:58 -0400
Received: from [127.0.0.1] (unknown [60.246.249.234])
	by mail1.bizmail.net.au (Postfix) with ESMTP id A96F8CDC071
	for <linux-mtd@lists.infradead.org>;
	Sat, 14 Oct 2006 10:39:27 +1000 (EST)
Message-ID: <45302F20.8030904@bizmail.com.au>
Date: Sat, 14 Oct 2006 10:28:16 +1000
From: yh@bizmail.com.au
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Failed to build mkfs.jffs2
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Reply-To: yh@bizmail.com.au
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am using the version mtd-20050122 for a linux arm system, I can build 
mtd under arm-linux-gcc, but failed to build a host tool mkfs.jffs2 by 
"make CC=cc" in util directory on FC5. Please see following error 
messages. Is there any way to fix it, rather than to change a new version?

compr_zlib.c:65: error: ‘z_stream’ has no member named ‘zalloc'
compr_zlib.c:66: error: ‘z_stream’ has no member named ‘zfree’

Thanks.

Jim
