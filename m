Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtG7f-0005p8-UJ
 for linux-mtd@lists.infradead.org; Tue, 25 Nov 2014 13:25:40 +0000
Message-ID: <1416921915.5858.40.camel@sauron.fi.intel.com>
Subject: Re: returning custom error codes in ubi_eba_read_leb()
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Nov 2014 15:25:15 +0200
In-Reply-To: <20141106081902.GA29928@mwanda>
References: <20141106081902.GA29928@mwanda>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-11-06 at 11:19 +0300, Dan Carpenter wrote:
> Hello Artem Bityutskiy,
> 
> The patch 1e51764a3c2a: "UBIFS: add new flash file system" from Jul
> 14, 2008, leads to the following static checker warning:

Thanks, I guess something like this would be the fix.


>From fcef9b2f2fdbff0b61e7de4e32f7ce4d2dce7772 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Tue, 25 Nov 2014 11:34:02 +0200
Subject: [PATCH] UBI: do propagate positive error codes up

UBI uses positive function return codes internally, and should not propagate
them up, except in the place this path fixes. Here is the original bug report
from Dan Carpenter:

The problem is really in ubi_eba_read_leb().

drivers/mtd/ubi/eba.c
   412                  err = ubi_io_read_vid_hdr(ubi, pnum, vid_hdr, 1);
   413                  if (err && err != UBI_IO_BITFLIPS) {
   414                          if (err > 0) {
   415                                  /*
   416                                   * The header is either absent or corrupted.
   417                                   * The former case means there is a bug -
   418                                   * switch to read-only mode just in case.
   419                                   * The latter case means a real corruption - we
   420                                   * may try to recover data. FIXME: but this is
   421                                   * not implemented.
   422                                   */
   423                                  if (err == UBI_IO_BAD_HDR_EBADMSG ||
   424                                      err == UBI_IO_BAD_HDR) {
   425                                          ubi_warn("corrupted VID header at PEB %d, LEB %d:%d",
   426                                                   pnum, vol_id, lnum);
   427                                          err = -EBADMSG;
   428                                  } else
   429                                          ubi_ro_mode(ubi);

On this path we return UBI_IO_FF and UBI_IO_FF_BITFLIPS and it
eventually gets passed to ERR_PTR().  We probably dereference the bad
pointer and oops.  At that point we've gone read only so it was already
a bad situation...

   430                          }
   431                          goto out_free;
   432                  } else if (err == UBI_IO_BITFLIPS)
   433                          scrub = 1;
   434

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/eba.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index a40020c..b698534 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -426,6 +426,7 @@ retry:
 						 pnum, vol_id, lnum);
 					err = -EBADMSG;
 				} else
+					err = -EINVAL;
 					ubi_ro_mode(ubi);
 			}
 			goto out_free;
-- 
1.9.3
