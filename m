Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fi3TZ-00086C-MX
 for linux-mtd@lists.infradead.org; Tue, 24 Jul 2018 20:00:08 +0000
Date: Tue, 24 Jul 2018 21:59:47 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Zhiqiang Hou <Zhiqiang.Hou@nxp.com>, linux-mtd@lists.infradead.org,
 Linux Kernel <linux-kernel@vger.kernel.org>, David Woodhouse
 <dwmw2@infradead.org>, Boris BREZILLON
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, NeilBrown <neil@brown.name>
Subject: Re: [PATCHv3 2/2] mtd: m25p80: restore the status of SPI flash when
 exiting
Message-ID: <20180724215947.150373be@bbrezillon>
In-Reply-To: <20180724195202.GB190016@ban.mtv.corp.google.com>
References: <20171206025342.7266-1-Zhiqiang.Hou@nxp.com>
 <20171206025342.7266-3-Zhiqiang.Hou@nxp.com>
 <20180723181350.GA58212@ban.mtv.corp.google.com>
 <20180723221002.736e0830@bbrezillon>
 <CAN8TOE904WXMScHo1b2jhusz-L8eGBK=gzUUX079ZVfiFk+HoQ@mail.gmail.com>
 <20180724011811.40165a35@bbrezillon>
 <20180724195202.GB190016@ban.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 24 Jul 2018 12:52:02 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> > > Or even better: put this hack behind a DT flag, so that one has to
> > > admit that their board design is broken before it will even do
> > > anything. Proposal: "linux,badly-designed-flash-reset".  
> > 
> > I think we can remove the "linux," prefix. If it's badly designed, it
> > applies to all OSes, don't you think?  
> 
> Sure.
> 
> Shall I send a patch?

Yep.
