Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DDrah-0004jz-Ny
	for linux-mtd@lists.infradead.org; Tue, 22 Mar 2005 17:11:12 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DDrUM-0005ak-PM
	for linux-mtd@lists.infradead.org; Tue, 22 Mar 2005 23:04:41 +0100
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 22 Mar 2005 23:04:38 +0100
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 22 Mar 2005 23:04:38 +0100
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Tue, 22 Mar 2005 21:57:30 +0000 (UTC)
Message-ID: <loom.20050322T224733-491@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: atomic file operations
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I am working on a logging application where a (large) log file is appended 
with 1 kByte data chunks. I cannot miss a chunk or duplicate a chunk in 
case of a power failure. Kermit will be used to ensure atomicity for 
incomming data chunks. Now, the question is what file operations on JFFS2 
are guaranteed to be atomic/transactional? 
Is a write of 1024 bytes atomic? 
Does it relate to the page size in any way? BTW I am using NAND and the page 
may vary between 512 and 2048 bytes depending on a device.
Is file rename atomic?
Other file operations?

Second issue is: How badly these small chunks will affect my mount time?

Thanks in advance

Sergei Sharonov
