Received: from mail-wi0-f169.google.com ([209.85.212.169])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T1ed0-0000s9-LB
 for linux-mtd@lists.infradead.org; Wed, 15 Aug 2012 14:31:23 +0000
Received: by wibhm2 with SMTP id hm2so4669781wib.0
 for <linux-mtd@lists.infradead.org>; Wed, 15 Aug 2012 07:31:20 -0700 (PDT)
Date: Wed, 15 Aug 2012 17:31:16 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH 8/8] mtd: nand: use ECC, if present, when scanning OOB
Message-ID: <20120815173116.51de197a@pixies.home.jungo.com>
In-Reply-To: <1345032317.3393.135.camel@sauron.fi.intel.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-9-git-send-email-computersforpeace@gmail.com>
 <1345032317.3393.135.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Mike Dunn <mikedunn@newsguy.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Wed, 15 Aug 2012 15:05:17 +0300 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Fri, 2012-06-22 at 16:35 -0700, Brian Norris wrote:
> > scan_read_raw_oob() is used in only in places where the MTD_OPS_PLACE_OOB
> > mode is preferable MTD_OPS_RAW mode, so use MTD_OPS_PLACE_OOB instead.
> > MTD_OPS_PLACE_OOB provides the same functionality with the potential[1]
> > added bonus of error correction.
> 
> Amended the commit message to satisfy Smulik's request, and pushed to
> l2-mtd.git, thanks Brian!

I had some second thoughts WRT the move from MTD_OPS_RAW to
MTD_OPS_PLACE_OOB.

When reading BBT content, MTD_OPS_PLACE_OOB is preferred.

But when scanning the OOBs for BBMs (when creating the table), I guess
MTD_OPS_RAW should be used - since manufacturer bad blocks are not
protected by ECC (as Matthieu noted in [1], and I elaborated in [2]).

Can you please review and comment regarding the ideas discussed there?

Thanks,
Shmulik

[1]
http://thread.gmane.org/gmane.linux.drivers.mtd/42243/focus=42365
[2]
http://thread.gmane.org/gmane.linux.drivers.mtd/42243/focus=42669
