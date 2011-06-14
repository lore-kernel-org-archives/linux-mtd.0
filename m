Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QWWKf-0006ac-PE
	for linux-mtd@lists.infradead.org; Tue, 14 Jun 2011 16:19:14 +0000
Received: by yxe42 with SMTP id 42so1791874yxe.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Jun 2011 09:19:10 -0700 (PDT)
Message-ID: <4DF789FC.1030305@gmail.com>
Date: Tue, 14 Jun 2011 12:19:08 -0400
From: Peter Barada <peter.barada@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, Peter Barada <peter.barada@gmail.com>
Subject: Preventing JFFS2 partial page writes?
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm using a Micron 512MB NAND which has an internal 4-bit ECC engine, 
and am finding lots of ECC errors while using JFFS2.  The same NAND 
works find using YAFFS so I know the underlying MTD driver works properly.

The big question I have is whether JFFS2 does partial page writes and if 
so how to disable them.

Thanks in advance!

-- 
Peter Barada
peter.barada@gmail.com
