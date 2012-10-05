Received: from rcsinet15.oracle.com ([148.87.113.117])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TK1qX-00071V-FE
 for linux-mtd@lists.infradead.org; Fri, 05 Oct 2012 06:57:18 +0000
Date: Fri, 5 Oct 2012 09:57:04 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [bug reportish] UBI_MAX_ERASECOUNTER not used consistently
Message-ID: <20121005065704.GA26466@elgon.mountain>
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

Hi Artem,

I normally audit for underflows and I had a question about this code.

mtd/ubi/attach.c
   665  static int early_erase_peb(struct ubi_device *ubi,
   666                             const struct ubi_attach_info *ai, int pnum, int ec)
   667  {
   668          int err;
   669          struct ubi_ec_hdr *ec_hdr;
   670  
   671          if ((long long)ec >= UBI_MAX_ERASECOUNTER) {

Casting to long long doesn't serve any purpose.  We normally say that
"> UBI_MAX_ERASECOUNTER" is invalid but "== UBI_MAX_ERASECOUNTER" is Ok.
The "ec" variable is signed and negative values are missed on this
check.

   672                  /*
   673                   * Erase counter overflow. Upgrade UBI and use 64-bit
   674                   * erase counters internally.
   675                   */
   676                  ubi_err("erase counter overflow at PEB %d, EC %d", pnum, ec);
   677                  return -EINVAL;
   678          }
   679  
   680          ec_hdr = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);

regards,
dan carpenter
