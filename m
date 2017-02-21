Received: from aserp1040.oracle.com ([141.146.126.69])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cgF6r-0002Md-9j
 for linux-mtd@lists.infradead.org; Tue, 21 Feb 2017 18:24:23 +0000
Date: Tue, 21 Feb 2017 21:23:44 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: dedekind1@gmail.com
Cc: linux-mtd@lists.infradead.org
Subject: [bug report] UBIFS: add new flash file system
Message-ID: <20170221182344.GA28595@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

	fs/ubifs/sb.c:408 validate_sb()
	warn: we tested 'c->main_lebs < (3 + 6)' before and it was 'false'

fs/ubifs/sb.c
   380          if (c->log_lebs < UBIFS_MIN_LOG_LEBS ||
   381              c->lpt_lebs < UBIFS_MIN_LPT_LEBS ||
   382              c->orph_lebs < UBIFS_MIN_ORPH_LEBS ||
   383              c->main_lebs < UBIFS_MIN_MAIN_LEBS) {
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
We should delete this right?

   384                  err = 4;
   385                  goto failed;
   386          }
   387  
   388          /*
   389           * Calculate minimum allowed amount of main area LEBs. This is very
   390           * similar to %UBIFS_MIN_LEB_CNT, but we take into account real what we
   391           * have just read from the superblock.
   392           */
   393          min_leb_cnt = UBIFS_SB_LEBS + UBIFS_MST_LEBS + c->log_lebs;
   394          min_leb_cnt += c->lpt_lebs + c->orph_lebs + c->jhead_cnt + 6;
   395  
   396          if (c->leb_cnt < min_leb_cnt || c->leb_cnt > c->vi.size) {
   397                  ubifs_err(c, "bad LEB count: %d in superblock, %d on UBI volume, %d minimum required",
   398                            c->leb_cnt, c->vi.size, min_leb_cnt);
   399                  goto failed;
   400          }
   401  
   402          if (c->max_leb_cnt < c->leb_cnt) {
   403                  ubifs_err(c, "max. LEB count %d less than LEB count %d",
   404                            c->max_leb_cnt, c->leb_cnt);
   405                  goto failed;
   406          }
   407  
   408          if (c->main_lebs < UBIFS_MIN_MAIN_LEBS) {
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Because this is a duplicate, except we don't set "err = 4".

   409                  ubifs_err(c, "too few main LEBs count %d, must be at least %d",
   410                            c->main_lebs, UBIFS_MIN_MAIN_LEBS);
   411                  goto failed;
   412          }

regards,
dan carpenter
