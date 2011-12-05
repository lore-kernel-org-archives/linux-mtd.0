Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXRht-0006qb-Lf
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2011 06:07:18 +0000
Received: by laai10 with SMTP id i10so1293347laa.36
 for <linux-mtd@lists.infradead.org>; Sun, 04 Dec 2011 22:07:15 -0800 (PST)
Subject: Re: [PATCH v2] MTD: modify mtd api to return bitflip info on read
 operations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Mon, 05 Dec 2011 08:07:12 +0200
In-Reply-To: <4EDB89E9.6070306@newsguy.com>
References: <1322943640-11728-1-git-send-email-mikedunn@newsguy.com>
 <4EDB3295.6040201@bitbox.co.uk> <4EDB7B1D.60603@newsguy.com>
 <1323009827.9400.75.camel@sauron.fi.intel.com>
 <4EDB89E9.6070306@newsguy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1323065234.2316.2.camel@koala>
Mime-Version: 1.0
Cc: Peter Horton <phorton@bitbox.co.uk>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-12-04 at 06:55 -0800, Mike Dunn wrote:
> So you're thinking that the driver would supply both ecc_strength and
> "scrublevel" (or maybe bb_threshold)?  Would these go into struct mtd_info?

Probably yes. After all, UBI has no idea about what kind of flash is
that and what kind of ECC it uses and what bit-flip level needs
scrubbing. So I think this kind of information should come from the
driver or from the user via mtd sysfs files. What do you think?

Artem.
