Received: from mail-yk0-f181.google.com ([209.85.160.181])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhIMu-0002Tn-8w
 for linux-mtd@lists.infradead.org; Mon, 05 May 2014 12:51:41 +0000
Received: by mail-yk0-f181.google.com with SMTP id q200so6110944ykb.12
 for <linux-mtd@lists.infradead.org>; Mon, 05 May 2014 05:51:18 -0700 (PDT)
Date: Mon, 5 May 2014 09:50:47 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Problems in Out of tree TI SDK omap2-nand driver (Re: [PATCH 3/3]
 nandtest: Introduce multiple reads & check iterations)
Message-ID: <20140505125047.GA11106@arch.cereza>
References: <1398690859-11494-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1398690859-11494-4-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20980858CB6D3A4BAE95CA194937D5E73EACA5DB@DBDE04.ent.ti.com>
 <20140505103335.GF2873@arch.cereza>
 <20980858CB6D3A4BAE95CA194937D5E73EACA6B9@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EACA6B9@DBDE04.ent.ti.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've changed the subject of this mail, since it seems we've moved from the
discussion.

On 05 May 10:58 AM, Gupta, Pekon wrote:
> 
> However, I know of some issues in OMAP NAND driver bundled with
> 3.2 kernel, which might be helpful in nailing down your specific issue.
> 

FWIW, I'm not using such driver anymore. Right after spotting this, we've
ran the *same* test on the mainline driver, which passed. This was the kick
we needed to start using mainline (we also need mainline for other reasons).

> (1) 3.2 kernel does not have concept of bitflip_threshold, so by default
> scrubbing and peb_torture happens even for single bit-flips. So please
> pull-in following patch series.
> [PATCH v2 0/7] mtd: Change meaning of -EUCLEAN return code on reads
> http://lists.infradead.org/pipermail/linux-mtd/2012-April/040945.html
> 

Isn't this series related to the higher-level treatment of bitflips?
In that case, it's not related to the issue I got. Keep in mind that
this simple test failed in our v3.2 stress (using this nandtest patch):

  * erase
  * write
  * read
  * read
  * ...
  * read (20 times)

> (2) OMAP NAND in 3.2 kernel does not factor bit-flips in empty pages
> Hence if empty pages with bit-flips are encountered, then it treats them
> like programmed pages and expects a ECC correction on them. But as
> empty pages do not have ECC stored in OOB, the driver bails out giving
> 'uncorrectable ecc' read errors.
> 

Since the test doesn't involve empty pages, I'd say this is not relevant.

If you're still interested in debugging the problematic TI SDK omap2-nand
driver, I suggest that you try using this nandtest patch and see how it
goes.

Despite you saying drivers can fail the test, I think it's still a nice test.
Keep in mind the nandtest tool reports the number of corrected ECC errors
after reads, so if that number is adding-up and increasing you can even
use this patch to see this evolution.

All in all, I think it's still a nice improvement on stock nandtest.
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
