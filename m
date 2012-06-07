Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Scgbf-0006Vy-8S
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2012 17:34:47 +0000
Message-ID: <4FD0E632.2080905@newsguy.com>
Date: Thu, 07 Jun 2012 10:34:42 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: artem.bityutskiy@linux.intel.com
Subject: Re: flash bbt broken due to unitialized bitflip_threshold?
References: <20120605220647.GV30400@pengutronix.de>
 <20120606125013.5897a02d@pixies.home.jungo.com>
 <1338989453.6875.49.camel@sauron.fi.intel.com>
 <20120606181529.291aa9a6@halley>
 <1338997575.6875.72.camel@sauron.fi.intel.com>
 <20120606175507.GC17332@parrot.com>
 <1339054570.6875.84.camel@sauron.fi.intel.com>
In-Reply-To: <1339054570.6875.84.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Ivan Djelic <ivan.djelic@parrot.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/07/2012 12:36 AM, Artem Bityutskiy wrote:
> On Wed, 2012-06-06 at 19:55 +0200, Ivan Djelic wrote:
>> 1. on legacy systems with 1-bit nand and strength = 1, default bitflip_threshold is 1
>> 2. on legacy systems with 1-bit nand and strength > 1, default bitflip_threshold is 'strength'
>> 3. on new systems   with 2+ bit nand and strength > 1, default bitflip_threshold is 'strength'
> 
> Ivan, Shmulik,
> 
> I've gave this another though, and I think it is OK to leave this as it
> is now. Your replies were very helpful, thanks.


Yes, many thanks guys.  It seems I picked the wrong couple days to be away from
email.

This is not an issue on my docg4 because it does not use a flash-based BBT, but
instead scans the whole device for blocks that are marked bad in oob. EUCLEAN is
ignored in this case.  The following code is present in both scan_block_full()
and scan_block_fast():

	/* Ignore ECC errors when checking for BBM */
	if (ret && !mtd_is_bitflip_or_eccerr(ret))
		return ret;

Digging into this, it turns out this is a problem only in the case of:

  (1) nand->td != NULL (flash-based BBT present)
  (2) NAND_BBT_NO_OOB is not set

Here's the call stack for the above case, and with NAND_BBT_ABSPAGE not set
(this is true for the mxc_nand controller).  The problem occurs in
scan_read_raw_oob()...

nand_scan_bbt()
|
+-> search_read_bbts()                ignores return code
    |
    +-> search_bbt()                  always returns 1
        |
        +-> scan_read_raw()           -EUCLEAN propagated up
            |
            +-> scan_read_raw_oob()   returns without updating buf, len, offs
                |
                +-> mtd_read_oob()    -EUCLEAN returned


I addition to the patch suggested by Shmulik, I would also suggest the
following, in the interest of consistency with the bad block scanning code, and
also thoroughness:

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 30d1319..ed59aa8 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -319,7 +319,7 @@ static int scan_read_raw_oob(struct mtd_info *mtd, uint8_t
*buf, loff_t offs,

                res = mtd_read_oob(mtd, offs, &ops);

-               if (res)
+               if (res && !mtd_is_bitflip_or_eccerr(res))
                        return res;

                buf += mtd->oobsize + mtd->writesize;

Shmulik, please let me know if yuo'd like me to submit the patch you suggested,
and I will do so promptly.  Otherwise, thanks again!

More gory details... by comparison, here's the call stack for the same case,
except NAND_BBT_NO_OOB is set.  Here, there's no problem.

nand_scan_bbt()
|
+-> search_read_bbts()                ignores return code
    |
    +-> search_bbt()                  always returns 1
        |
        +-> scan_read_raw()           -EUCLEAN propagated up
            |
            +-> scan_read_raw_data()  -EUCLEAN propagated up
                |
                +-> mtd_read_oob()    -EUCLEAN returned


Thanks, and sorry for the oversight,
Mike
