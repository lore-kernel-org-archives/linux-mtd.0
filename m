Received: from mail-bw0-f21.google.com ([209.85.218.21])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LUKUG-0005bT-3G
	for linux-mtd@lists.infradead.org; Tue, 03 Feb 2009 12:34:47 +0000
Received: by bwz14 with SMTP id 14so1128712bwz.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 03 Feb 2009 04:34:43 -0800 (PST)
Sender: Corentin Chary <corentin.chary@gmail.com>
From: Corentin Chary <corentincj@iksaif.net>
To: linux-mtd@lists.infradead.org
Subject: Request for review: NandFS
Date: Tue, 3 Feb 2009 13:27:59 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200902031327.59536.corentincj@iksaif.net>
Cc: linux-fsdevel@vger.kernel.org,
	Gregory CLEMENT <gclement@adeneo.adetelgroup.com>,
	HIBLOT Jean-Jacques <jjhiblot@adeneo.adetelgroup.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
Here is NandFS, a NAND Flash Filesystem.
NandFS is similar to YAFFS2 (in some ways), but the codebase is much more
cleaner and simpler. And we'll try to go mainline.

Development started at Adeneo (http://www.adeneo-embedded.com/srt/en/home) in 
2007. After a long pause, I re-started to clean the code in october 2008.

With the new UBIFS, we might think than there is no room for another flash 
filesystem. But another GPLed filesystem can't hurt anyone. Some of us may 
have heard some words about UFFS, but this project is in no way related to 
NandFS.

*IMPORTANT*: NandFS is under active development, and can't be considered safe 
or stable !

NandFS aims to be:
- Simple
- Clean
- Ram-Efficient
- Power-Failure-Resistant
- Write-Optimized (write-back + internal caches)
- Wear-Leveling

NandFS work-in-progress:
- writeback and "budgeting"
- kernel-doc

NandFS short term todo:
- (A lot of) Test
- Better locking (no more "Big NandFS Lock")
- checkpoint/summary support
- ram usage optimizations
- xattr support
- acl support

The code can be found at http://git.iksaif.net/

I'm currently working on kernel-doc, but the more important is done.
There is no whitepaper to explain how it works right now, but nandfs.h and 
scan.c explains a lot and they are well commented.

It's all Licenced under GPLv2.

Please post your question/comments/bugs/patches.

-- 
Corentin Chary
http://xf.iksaif.net
