Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Idqwx-0003fM-D9
	for linux-mtd@lists.infradead.org; Fri, 05 Oct 2007 18:26:58 +0100
From: "Joakim Tjernlund" <joakim.tjernlund@transmode.se>
To: <dedekind@infradead.org>,
	"'David Woodhouse'" <dwmw2@infradead.org>
Subject: RE: [PATCH] Revert "[JFFS2] Reduce time for which erase_free_sem
	isheld during erase."
Date: Fri, 5 Oct 2007 19:26:19 +0200
Message-ID: <008401c80774$d8050eb0$0e67a8c0@Jocke>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1191597989.4586.16.camel@sauron>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 > -----Original Message-----
> From: Artem Bityutskiy [mailto:dedekind@infradead.org] 
> Sent: den 5 oktober 2007 17:26
> To: David Woodhouse
> Cc: Joakim Tjernlund; linux-mtd@lists.infradead.org
> Subject: [PATCH] Revert "[JFFS2] Reduce time for which 
> erase_free_sem isheld during erase."
> 
> >From e1d782add3a72421eb637a119c594a6d9b774727 Mon Sep 17 
> 00:00:00 2001
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Date: Fri, 5 Oct 2007 20:09:45 +0300
> Subject: [PATCH] Revert "[JFFS2] Reduce time for which 
> erase_free_sem is held during erase."
> 
> This reverts commit d364fb18cd991734eb54aa8840e70030b0c9f699.
> 
> This patch locks up the system because it takes the 
> 'erase_free_sem' in
> the erase callback function, which is in turn called from NAND/OneNAND
> driver with NAND/OneNAND chip locked. Obviously, another process which
> holds 'erase_free_sem' and calls an I/O function will deadlock at the
> NAND/OneNAND chip lock. Below is the backtrace of this deadlock which
> we observed in practice:

uhh, I guess this problem is NAND specific? I don't think reverting
this patch is the answer. There got to be a better fix, as my patch
solves a real problem too.

 Jocke
