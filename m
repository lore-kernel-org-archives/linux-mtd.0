Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ScCsg-00049c-NO
 for linux-mtd@lists.infradead.org; Wed, 06 Jun 2012 09:50:23 +0000
Received: by werc12 with SMTP id c12so5071515wer.36
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jun 2012 02:50:20 -0700 (PDT)
Date: Wed, 6 Jun 2012 12:50:13 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, Mike Dunn <mikedunn@newsguy.com>
Subject: Re: flash bbt broken due to unitialized bitflip_threshold?
Message-ID: <20120606125013.5897a02d@pixies.home.jungo.com>
In-Reply-To: <20120605220647.GV30400@pengutronix.de>
References: <20120605220647.GV30400@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sascha,

On Wed, 6 Jun 2012 00:06:47 +0200 Sascha Hauer <s.hauer@pengutronix.de> wrote:
> Hi All,
> 
> nand_scan_tail calls chip->scan_bbt which in case of a flash based bbt
> calls mtd_read. mtd_read returns -EUCLEAN when the number of errors
> exceeds bitflip_threshold. The problem is that bitflip_threshold is
> uninitialized at that time, it is initialized in add_mtd_device which is
> called after nand_scan. This is seen on the mxc_nand controller, but
> probably on other drivers aswell.
> 
> Am I missing something?

Yep, you are correct.
The result is that the BBTs will always be scrubbed (re-programmed).

I think the below fix is missing, should do the job.

Mike, does it look sane to you?

It assigns a 'bitflip_threshold' for the master mtd
(defaults to ecc_strength unless previously set by the driver).

It makes page reads of the BBT area adhere to an erase-block "health"
policy, either initially set by the driver, or set by default to
ecc_strength.

Note that if multiple partitions are later registered, one can't
later override the master's bitflip_threshold via sysfs.
But I guess this isn't important as the BBT is read once, when the nand
is probed.

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 61805e7..46c7d2b 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3484,6 +3484,8 @@ int nand_scan_tail(struct mtd_info *mtd)
 	/* propagate ecc info to mtd_info */
 	mtd->ecclayout = chip->ecc.layout;
 	mtd->ecc_strength = chip->ecc.strength;
+	if (!mtd->bitflip_threshold)
+		mtd->bitflip_threshold = mtd->ecc_strength;
 
 	/* Check, if we should skip the bad block table scan */
 	if (chip->options & NAND_SKIP_BBTSCAN)
