Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T3Rn2-0008WL-GM
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 13:13:09 +0000
Received: by bkcji2 with SMTP id ji2so2182842bkc.36
 for <linux-mtd@lists.infradead.org>; Mon, 20 Aug 2012 06:13:05 -0700 (PDT)
Date: Mon, 20 Aug 2012 16:12:59 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH 8/8] mtd: nand: use ECC, if present, when scanning OOB
Message-ID: <20120820161259.14357a12@pixies.home.jungo.com>
In-Reply-To: <1345113602.3393.196.camel@sauron.fi.intel.com>
References: <1340408145-24531-1-git-send-email-computersforpeace@gmail.com>
 <1340408145-24531-9-git-send-email-computersforpeace@gmail.com>
 <1345032317.3393.135.camel@sauron.fi.intel.com>
 <20120815173116.51de197a@pixies.home.jungo.com>
 <1345113602.3393.196.camel@sauron.fi.intel.com>
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

On Thu, 16 Aug 2012 13:40:02 +0300 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> If you object merging these patches, I'd appreciate if you could
> elaborate why they would be _harmful_ to have.

Thanks. I understand your point.

Took another look, and no, these are _not_ harmful to have.

Regards,
Shmulik
