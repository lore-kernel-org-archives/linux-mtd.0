Received: from web80503.mail.yahoo.com ([66.218.79.73])
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AMVNl-0004Rm-UB
	for <linux-mtd@lists.infradead.org>; Wed, 19 Nov 2003 16:40:46 +0000
Message-ID: <20031119163841.9458.qmail@web80503.mail.yahoo.com>
Date: Wed, 19 Nov 2003 08:38:41 -0800 (PST)
From: Sherwin Liu <sherwinliu@sbcglobal.net>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: REF_PRISTINE node ...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm running Linux v2.4.18 under Montavista Linux on a 
PPC440GP. I have many JFFS2 partitions mounted and a 
test program that opens files on these partitions and 
constantly writes and reads these files. Once in a 
while I get this isolated message:

"REF_PRISTINE node at XX had a previous non-hole frag 
in the same page. Tell dwmw2."

Is this just a debugging message, or is it an 
indication of something wrong?

Thanks in advance...

-Sherwin
swl@dolby.com
