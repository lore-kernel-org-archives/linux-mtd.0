Received: from main.gmane.org ([80.91.224.249])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bvatv-0007HS-4S
	for linux-mtd@lists.infradead.org; Fri, 13 Aug 2004 08:11:20 -0400
Received: from root by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1Bvath-0002YR-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Aug 2004 14:11:03 +0200
Received: from a2125958202.net-htp.de ([212.59.58.202])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Aug 2004 14:11:01 +0200
Received: from sst by a2125958202.net-htp.de with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Aug 2004 14:11:01 +0200
To: linux-mtd@lists.infradead.org
From: Stefan =?utf-8?b?U3TDvHJrZQ==?= <sst@pandatel.com>
Date: Fri, 13 Aug 2004 12:02:23 +0000 (UTC)
Message-ID: <loom.20040813T140134-351@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: news <news@sea.gmane.org>
Subject: mkfs.jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I want to create a jffs2 image which should be loaded to
different mtd-flash devices via software download.

My problem is, that I cannot be sure which erasesize the
target flash will have. Because two flash types with different
sector sizes (64k and 128k) have to be supported.

Is it possible to create a jffs2 image that can run on both flashes,
or do I have to create two diffenent images?

My current command for creating the filesystem is:

mkfs.jffs2 -b -e $erasesize -p -r $source -o fs.jffs2

Thanks in advance
Stefan

-- 
Stefan Stürke
