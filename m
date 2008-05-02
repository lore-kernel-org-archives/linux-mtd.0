Received: from risingsoftware01.propagation.net ([66.221.33.65])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jrniq-0003IQ-MH
	for linux-mtd@lists.infradead.org; Fri, 02 May 2008 05:22:16 +0000
Received: from c122-107-142-134.eburwd5.vic.optusnet.com.au ([122.107.142.134]
	helo=noddy.cloud.net.au)
	by risingsoftware01.propagation.net with esmtpsa
	(TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63)
	(envelope-from <hamish@cloud.net.au>) id 1Jrnip-0003Wt-Q7
	for linux-mtd@lists.infradead.org; Fri, 02 May 2008 00:22:16 -0500
Received: from hamish by noddy.cloud.net.au with local (Exim 4.69)
	(envelope-from <hamish@cloud.net.au>) id 1Jrnil-0001mC-Si
	for linux-mtd@lists.infradead.org; Fri, 02 May 2008 15:22:11 +1000
Date: Fri, 2 May 2008 15:22:11 +1000
From: Hamish Moffatt <hamish@cloud.net.au>
To: linux-mtd@lists.infradead.org
Subject: [RFC][PATCH] making ubifs compile with gcc-3.4
Message-ID: <20080502052211.GB6654@cloud.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ubifs fails to compile with my gcc 3.4.4 (for arm), bombing with:

fs/built-in.o: In function `ubifs_create_dflt_lpt':
lpt_commit.c:(.text+0x88690): undefined reference to `__you_cannot_kmalloc_that_much'
make[1]: *** [.tmp_vmlinux1] Error 1

It compiles with 4.1.2 ok though. Some web searches suggest that this is
due to a compiler bug. Patches have been applied in other parts of the 
tree to work around this so perhaps you'll consider this patch for ubifs 
also.

I found that rearranging the kmalloc order makes it compile. I don't
believe there is any effect on the behaviour.

Signed-off-by: Hamish Moffatt <hamish@cloud.net.au>

--

--- a/fs/ubifs/lpt.c	(revision 4400)
+++ b/fs/ubifs/lpt.c	(working copy)
@@ -597,11 +597,11 @@
 	/* Needed by 'ubifs_pack_lsave()' */
 	c->main_first = c->leb_cnt - *main_lebs;
 
+	lsave = kmalloc(sizeof(int) * c->lsave_cnt, GFP_KERNEL);
 	pnode = kzalloc(sizeof(struct ubifs_pnode), GFP_KERNEL);
 	nnode = kzalloc(sizeof(struct ubifs_nnode), GFP_KERNEL);
 	buf = vmalloc(c->leb_size);
 	ltab = vmalloc(sizeof(struct ubifs_lpt_lprops) * c->lpt_lebs);
-	lsave = kmalloc(sizeof(int) * c->lsave_cnt, GFP_KERNEL);
 	if (!pnode || !nnode || !buf || !ltab || !lsave) {
 		err = -ENOMEM;
 		goto out;

-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
