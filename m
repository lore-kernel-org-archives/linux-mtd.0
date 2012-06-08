Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sd1sk-0006a8-EO
 for linux-mtd@lists.infradead.org; Fri, 08 Jun 2012 16:17:51 +0000
Received: by lbbgg6 with SMTP id gg6so1708258lbb.36
 for <linux-mtd@lists.infradead.org>; Fri, 08 Jun 2012 09:17:48 -0700 (PDT)
Date: Fri, 8 Jun 2012 19:17:41 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy
 <artem.bityutskiy@linux.intel.com>
Subject: Re: [PATCH] mtd: nand: Properly initialize 'mtd->bitflip_threshold'
 prior 'scan_bbt()' is invoked
Message-ID: <20120608191741.3877cd3a@halley>
In-Reply-To: <20120608182906.57b4844a@halley>
References: <20120608182906.57b4844a@halley>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

Artem, David,

Patch was accidentally submitted twice.

Disregard this post please.

Sorry for the inconvenience.

Regards,
Shmulik

On Fri, 8 Jun 2012 18:29:06 +0300 Shmulik Ladkani <shmulik@jungo.com> wrote:
> As of edbc454 [mtd: driver _read() returns max_bitflips; mtd_read()
> returns -EUCLEAN], 'mtd->bitflip_threshold' must be set for mtd devices
> having ECC, prior any 'mtd_read()' call.
> Otherwise, 'mtd_read()' will falsely return -EUCLEAN.
> 
> Normally, 'mtd->bitflip_threshold' is initialized when the MTD is added.
> 
> However, this is too late for NAND MTDs, as 'scan_bbt()' is invoked
> prior the existing initialization of 'mtd->bitflip_threshold'.
> 
> This is a problem since 'scan_bbt()' calls 'mtd_read()', in the case
> of a flash-based bad block table.
> It resulted in a falsely reported bitflips indication during BBT read,
> which lead to constant scrubbing of the flash BBT blocks.
> 
> Initialize 'mtd->bitflip_threshold' to its default value (if not already
> set by the driver), prior invocation of 'scan_bbt()'.
> 
> Reported-by: Sascha Hauer <s.hauer@pengutronix.de>
> Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
