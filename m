Received: from avanto.mpei.ac.ru ([193.233.71.179])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CGzGb-000384-Bv
	for linux-mtd@lists.infradead.org; Mon, 11 Oct 2004 08:27:06 -0400
Received: from skorinkod.lan ([10.255.2.21])
	by avanto.mpei.ac.ru with esmtp (Exim 3.36 #1 (Debian))
	id 1CGzGT-0001WB-00
	for <linux-mtd@lists.infradead.org>; Mon, 11 Oct 2004 16:26:57 +0400
From: Dmitry Skorinko <skorinkod@mosk.ru>
To: linux-mtd@lists.infradead.org
Date: Mon, 11 Oct 2004 16:27:58 +0400
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200410111627.58486.skorinkod@mosk.ru>
Subject: BNAND Media Header not found
Reply-To: skorinkod@mail.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

first, sorry for my English

2.6.8.1 kernel
pc104 system with DiskOnChip 2000 256MB

After nftl_format I start modules and have: 
DiskOnChip BNAND Media Header not found
and diskonchip don't find my flash :(
/proc/mtd and /dev/mtd0 is empty....
How I can return this header?


second question:
when I had working system (hehe), there was note:
DiskOnChip 2000 (INFTL model) during modules were loading
                 ^^^^^^^

I tried "insmod" inftl.ko but I had kernel panic with it.... and I "insmod" 
nftl.ko...
where is problem?

I'm only starting work with flash and study all these drivers and i'm sorry 
for silly questions...


Dmitry
