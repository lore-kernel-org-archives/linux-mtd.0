Received: from wa-out-1112.google.com ([209.85.146.179])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JHsaR-0004VF-6P
	for linux-mtd@lists.infradead.org; Thu, 24 Jan 2008 03:17:07 +0000
Received: by wa-out-1112.google.com with SMTP id v33so101709wah.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Jan 2008 19:13:10 -0800 (PST)
Message-ID: <bae050c10801231913r43473c02r2d9093a205a00c87@mail.gmail.com>
Date: Thu, 24 Jan 2008 11:13:10 +0800
From: Nancy <nancydreaming@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Is there really need to build Block Device Emulation over UBI?
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
   Is there really need to build Block Device Emulation over UBI? Why
can't use the mtd_blkdev.c and mtdblock.c directly?
   Thanks to gluebi, make UBI and MTD become one. More interesting
thing is,  volume can be treat like a mtd partition. mtdblock.c do not
have wear-leveling and bad block management mechanism but UBI has.
gluebi make all those functions mix together right?
   I have tried, and it work.
