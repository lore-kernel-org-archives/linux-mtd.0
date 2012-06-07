Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ScdI3-0001qM-GT
 for linux-mtd@lists.infradead.org; Thu, 07 Jun 2012 14:02:21 +0000
Received: by laap9 with SMTP id p9so506447laa.36
 for <linux-mtd@lists.infradead.org>; Thu, 07 Jun 2012 07:02:16 -0700 (PDT)
Date: Thu, 7 Jun 2012 17:02:08 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: artem.bityutskiy@linux.intel.com
Subject: Re: flash bbt broken due to unitialized bitflip_threshold?
Message-ID: <20120607170208.57ba86ca@pixies.home.jungo.com>
In-Reply-To: <1339054570.6875.84.camel@sauron.fi.intel.com>
References: <20120605220647.GV30400@pengutronix.de>
 <20120606125013.5897a02d@pixies.home.jungo.com>
 <1338989453.6875.49.camel@sauron.fi.intel.com>
 <20120606181529.291aa9a6@halley>
 <1338997575.6875.72.camel@sauron.fi.intel.com>
 <20120606175507.GC17332@parrot.com>
 <1339054570.6875.84.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Mike Dunn <mikedunn@newsguy.com>, Ivan Djelic <ivan.djelic@parrot.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Sascha Hauer <s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 07 Jun 2012 10:36:10 +0300 Artem Bityutskiy <artem.bityutskiy@linux.intel.com> wrote:
> Shmulik, would you please send your BBT read fix as a nice patch?
> Please, add a not to the commit message that this fixes an issue
> introduced in 3.5-rc1 and should be merged before 3.5. Thanks!

Will do.

Regards,
Shmulik
