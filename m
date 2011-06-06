Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTfqU-00056v-EB
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 19:52:19 +0000
Received: by yxk30 with SMTP id 30so560519yxk.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 12:52:15 -0700 (PDT)
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: ubifs_decompress: cannot decompress ...
Date: Mon,  6 Jun 2011 15:52:06 -0400
Message-Id: <1307389926-12209-1-git-send-email-mlcreech@gmail.com>
In-Reply-To: <1307377091.3112.100.camel@localhost>
References: <1307377091.3112.100.camel@localhost>
Cc: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 6, 2011 at 12:18 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>
> I have to go home now - could you please improve dbg_dump_leb().
> Currently it calls ubifs_scan(), which scans, finds corrupted node,
> prints corruption information and returns -EUCLEAN and destroys the
> scanned data.
>

Will something like this be okay?  Or do you still want to dump the
partially-parsed data from the corrupt node as well (not just the raw contents
of the LEB)?


Currently an error in ubifs_scan() will cause dbg_dump_leb() to abort without
completing the dump.  Instead, we should abandon parsing the data, but dump
the raw (uninterpreted) LEB contents instead.

Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>
---
 fs/ubifs/debug.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
index 26d4c61..6ab43e4 100644
--- a/fs/ubifs/debug.c
+++ b/fs/ubifs/debug.c
@@ -901,6 +901,9 @@ void dbg_dump_leb(const struct ubifs_info *c, int lnum)
 	sleb = ubifs_scan(c, lnum, 0, buf, 0);
 	if (IS_ERR(sleb)) {
 		ubifs_err("scan error %d", (int)PTR_ERR(sleb));
+		printk(KERN_DEBUG "\tLEB data buffer:\n");
+		print_hex_dump(KERN_DEBUG, "\t", DUMP_PREFIX_OFFSET, 32, 1,
+			       buf, c->leb_size, 0);
 		goto out;
 	}
 
-- 
1.6.3.3
