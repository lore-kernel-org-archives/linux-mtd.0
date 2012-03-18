Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S9B2C-0006nS-F5
 for linux-mtd@lists.infradead.org; Sun, 18 Mar 2012 08:00:13 +0000
Received: by werp11 with SMTP id p11so6285714wer.36
 for <linux-mtd@lists.infradead.org>; Sun, 18 Mar 2012 01:00:07 -0700 (PDT)
Date: Sun, 18 Mar 2012 10:00:00 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH 0/3] MTD: Change meaning of -EUCLEAN return code on reads
Message-ID: <20120318100000.336c347d@pixies.home.jungo.com>
In-Reply-To: <4F64F17C.2070409@newsguy.com>
References: <1331832353-15569-1-git-send-email-mikedunn@newsguy.com>
 <20120316111939.GA10362@parrot.com> <4F636964.3030904@newsguy.com>
 <20120316184345.GF10228@parrot.com> <4F64F17C.2070409@newsguy.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Ivan Djelic <ivan.djelic@parrot.com>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mike,

On Sat, 17 Mar 2012 13:18:04 -0700 Mike Dunn <mikedunn@newsguy.com> wrote:
> So if we're all convinced that thresholds must be evaluated at the ecc.size
> level, there's more work <sigh>.  As Ivan pointed out earlier, the nand drivers
> currently do not track bitflip corrections per ecc step, which means all the
> nand drivers must be modified.  Before I start on this, I'd like to get a
> blessing from Artem / David, since the chamges will touch many drivers in a
> somehat non-trivial manner.

Well the change would affect more places, that's for sure.
However it could be a trivial change; see below.

> I think the best approach is to have the nand drivers return max_bitflips over
> all ecc steps, same idea as what the previous patches returned to mtd, but at a
> finer granularity.  Then the nand code just passes this up to mtd, instead of
> examining the ecc_stats as previously.

Please consider the following scheme:

(1) 'ecc.read_page' interface is changed.
  The return value will denote max bitflips over all ecc steps.
  (currently all implementations return 0)
  Please examine nand_read_page_swecc/nand_read_page_hwecc (and other
  implementations) and observe how easy this can be implemeted.

  Downside: we'll have to do this (max calculation) for each 'read_page'
  implementation.
  There are about ~10 implementations.
  (BTW most implementations are SO similar, maybe the code can be
  consolidated?)

(2) Modify nand_base's 'nand_do_read_ops', similary to what you've
  already done, to aggregate the maximum bitflips according to the
  returned values of the 'chip->ecc.read_page()' calls.
  Meaning, instead of your aggregation:
+	max_bitflips = max(max_bitflips, mtd->ecc_stats.corrected - prev_corrected);
  let's use:
+	max_bitflips = max(max_bitflips, read_page_returned_max_bitflips);

(3)  Finally, 'nand_do_read_ops' may return -EUCLEAN if max_bitflips is
  above the threshold:
-	return  mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;
+	return  max_bitflips >= mtd->bitflip_threshold ? -EUCLEAN : 0;

  [ BTW, at a side note, I failed to understand why you prefer the
  threshold comparison at the generic 'mtd_read' wrapper, and not within
  nand_base.c.
  I guess you didn't want to duplicate the condition into onenand_base.c
  and alauda.c?
  Thing is, I feel mtd->bitflip_threshold is a NAND property, so it
  makes more sense if it is tested within the NAND infrastricture (and
  clones).
  Changing the 'mtd->_read' interface was less elegant IMO. ]

Obvisouly, the above said is 30000 feet high, cutting a few corners :-)
We must let the code talk.

The only immediate blocker for such a scheme would be those nand
controller drivers, where the controller is responsible of the ECC
correction, and it does not report per-step stats to the software.
Are there any?
(In that case, we have nothing else to do besides falling back to a
per-page decision. For example, such driver's 'read_page' may return
total_corrected_per_page/ecc.steps as an estimate of the number of
per-step corrected bits, or alike)

Regards,
Shmulik
