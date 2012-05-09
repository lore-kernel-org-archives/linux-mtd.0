Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SS47t-0007Zt-5d
 for linux-mtd@lists.infradead.org; Wed, 09 May 2012 10:28:10 +0000
Received: by wgbds1 with SMTP id ds1so76478wgb.18
 for <linux-mtd@lists.infradead.org>; Wed, 09 May 2012 03:26:20 -0700 (PDT)
Date: Wed, 9 May 2012 13:26:13 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Regarding latest EUCLEAN/bitflip_threshold patchset
Message-ID: <20120509132613.40db5533@pixies.home.jungo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mike,

I noticed 'nand_do_read_oob' explicitly tests 'mtd->ecc_stats.corrected'
and returns EUCLEAN - as it was not ported to use the new
'bitflip_threshold'.

=46rom nand_base.c:

	if (mtd->ecc_stats.failed - stats.failed)
		return -EBADMSG;

	return  mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;

- May drivers increment mtd->ecc_stats.{corrected,failed} during their
  ecc.read_oob() call?

- If so, can we (should we?) report EUCLEAN according to the
  bitflip_threshold in this case?

Regards,
Shmulik
