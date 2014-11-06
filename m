Received: from userp1040.oracle.com ([156.151.31.81])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmII5-0006yz-O1
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 08:19:38 +0000
Date: Thu, 6 Nov 2014 11:19:02 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Artem.Bityutskiy@nokia.com
Subject: returning custom error codes in ubi_eba_read_leb()
Message-ID: <20141106081902.GA29928@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Artem Bityutskiy,

The patch 1e51764a3c2a: "UBIFS: add new flash file system" from Jul
14, 2008, leads to the following static checker warning:

	fs/ubifs/scan.c:158 ubifs_start_scan()
	error: passing non negative 2 to ERR_PTR

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

regards,
dan carpenter
