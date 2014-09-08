Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQxls-0000nH-21
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 12:10:12 +0000
Message-ID: <1410178188.10764.159.camel@sauron.fi.intel.com>
Subject: Re: mtd-utils-1.5.1 bug report
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: David Binderman <dcb314@hotmail.com>
Date: Mon, 08 Sep 2014 15:09:48 +0300
In-Reply-To: <DUB128-W61F274D19C6B54433EDD629CC00@phx.gbl>
References: <DUB128-W61F274D19C6B54433EDD629CC00@phx.gbl>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2014-09-07 at 14:58 +0000, David Binderman wrote:
> Hello there,
> 
> ubi-utils/ubiformat.c:636:28: warning: logical not is only applied to the left hand side of comparison [-Wlogical-not-parentheses]
> 
>                 if (!args.subpage_size != mtd->min_io_size)
>                     normsg("may be sub-page size is "
>                            "incorrect?");

Hi,

I'd propose this patch to fix the issue:

Subject: [PATCH] ubiformat: fix the subpage size hint on the error path

David Binderman <dcb314@hotmail.com> reports that the following piece of looks
wrong:

if (!args.subpage_size != mtd->min_io_size)
    normsg("may be sub-page size is incorrect?");

I totally agree with him and I believe that we actually meant to have no
negation in fron to f 'args.subpage_size', so instead, the code should look
like this:

if (args.subpage_size != mtd->min_io_size)
    normsg("may be sub-page size is incorrect?");

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 ubi-utils/ubiformat.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
index 1b8f6fb..21409ca 100644
--- a/ubi-utils/ubiformat.c
+++ b/ubi-utils/ubiformat.c
@@ -633,9 +633,8 @@ static int format(libmtd_t libmtd, const struct mtd_dev_info *mtd,
                                   write_size, eb);
 
                        if (errno != EIO) {
-                               if (!args.subpage_size != mtd->min_io_size)
-                                       normsg("may be sub-page size is "
-                                              "incorrect?");
+                               if (args.subpage_size != mtd->min_io_size)
+                                       normsg("may be sub-page size is incorrect?");
                                goto out_free;
                        }
 
-- 
1.9.3

-- 
Best Regards,
Artem Bityutskiy
