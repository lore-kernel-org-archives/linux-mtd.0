Received: from mailout2.echostar.com ([204.76.128.102])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BQ5FS-0004Gu-0v
	for linux-mtd@lists.infradead.org; Tue, 18 May 2004 15:07:16 +0100
Message-ID: <C86A9402F6A07E47B2F50A302DFA9BAE044C60@alm-exch.europe.echostar.com>
From: "Teuling, Sieme" <Sieme.Teuling@echostar.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Tue, 18 May 2004 08:07:06 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: patch for nand support linux-2.4.21 jffs2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanx for the replies,

I have tried to run the mtd patch from cvs on my kernel tree (sh patchin.sh
-j /../linux-2.4.21), but now my kernel doesn't compile anymore, I get:

fs/fs.o(.text+0x4d860): In function `jffs2_gc_fetch_inode':
/../linux-2.4.21/fs/jffs2/fs.c:561: undefined reference to `ilookup'

Is this a known problem with a know solution?


Sieme,
