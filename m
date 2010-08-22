Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OnFJW-0004WZ-1W
	for linux-mtd@lists.infradead.org; Sun, 22 Aug 2010 18:30:39 +0000
Received: by fxm12 with SMTP id 12so3156544fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 22 Aug 2010 11:30:35 -0700 (PDT)
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <1280243535.3021.29.camel@localhost.localdomain>
References: <AANLkTi=nYBryUf8SyNFAcx_PPqTfdmY=x835Q-RhLmAn@mail.gmail.com>
	<1280121714.14917.40.camel@localhost>
	<AANLkTinJbZXx+YY7dxhmuEJ4XgN4Fj77=fFo_2WYL1fJ@mail.gmail.com>
	<1280243535.3021.29.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 22 Aug 2010 21:30:32 +0300
Message-ID: <1282501832.16502.97.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-07-27 at 18:12 +0300, Artem Bityutskiy wrote:
> > Certainly.  I enabled all the relevant UBI and UBIFS debugging options
> > that I saw, along with internal self-checks, but there's still not a
> > whole lot of output.  Full console dump is attached - this is a
> > different device than the first, but exhibits the same problem.
> 
> I'm sure your ring buffer contains more information. This is one of the
> reasons I gave you the above link - it explains that not all messages go
> to console and how to get all meassages. Try to use dmesg. In UBIFS code
> I see that 'ubifs_read_node()' calls 'dbg_dump_node()' which should dump
> the node.
> 
> But '255' is 0xFF, so probably UBIFS read all 0xFF. This may be an UBIFS
> bug, or some corruption, difficult to say. For some reason the place
> where a valid znode should live is erased.
> 
> May be if I have a NAND dump of your broken device I can look at it, but
> do not promise anything, and I'm also on holiday :-)

Could you please dump LEB 5586 and check whether it is really erased or
not? Please, apply the following patch:

>From feb1616809b0bebeaf0cb596fdb5d715f6d75700 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Sun, 22 Aug 2010 21:27:30 +0300
Subject: [PATCH] UBIFS: improve error reporting when reading bad node

When an error happens during validation of read node, the typical situation is that
the LEB we read is unmapped (due to some bug). It is handy to include the mapping
status into the error message.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/io.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
index bcf5a16..9432431 100644
--- a/fs/ubifs/io.c
+++ b/fs/ubifs/io.c
@@ -815,7 +815,8 @@ int ubifs_read_node(const struct ubifs_info *c, void *buf, int type, int len,
 	return 0;
 
 out:
-	ubifs_err("bad node at LEB %d:%d", lnum, offs);
+	ubifs_err("bad node at LEB %d:%d, LEB mapping status %d", lnum, offs,
+		  ubi_is_mapped(c->ubi, lnum));
 	dbg_dump_node(c, buf);
 	dbg_dump_stack();
 	return -EINVAL;
-- 
1.7.2.1
