Received: from py-out-1112.google.com ([64.233.166.177])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FoMIt-0008A1-Mp
	for linux-mtd@lists.infradead.org; Thu, 08 Jun 2006 11:20:18 -0400
Received: by py-out-1112.google.com with SMTP id i49so638977pyi
	for <linux-mtd@lists.infradead.org>;
	Thu, 08 Jun 2006 08:20:06 -0700 (PDT)
Message-ID: <44884012.8060609@gmail.com>
Date: Thu, 08 Jun 2006 23:19:46 +0800
From: xie chao <xiechao.mail@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: MTD NAND driver supports for  multi-page read and write
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi
I found that JFFS2 invokes MTD callback directly. Does every read/write
to JFFS2 will make be scheduled by block device layer? Because I find
that most of read to my NAND flash is composed by one page, write to my
NAND flash is composed by one or two page when i use iozone to test the
JFFS2 performance. In fact, the NAND flash i have con support
multi-pages(at most 32 pages) read/write which has better efficiency.
How i have improve the JFFS2 performance by read/write as many pages i
during one access to the FS? Thanks.
