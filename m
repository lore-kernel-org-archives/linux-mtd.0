Received: from 64.mail-out.ovh.net ([91.121.185.65])
	by canuck.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QN7LK-0007Jn-4j
	for linux-mtd@lists.infradead.org; Thu, 19 May 2011 17:49:03 +0000
Date: Thu, 19 May 2011 19:37:10 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v6 8/8] MTD: physmap: let set_vpp() pass a
	platform_device instead of a map_info
Message-ID: <20110519173710.GR15292@game.jcrosoft.org>
References: <1305637877-24436-1-git-send-email-marc.zyngier@arm.com>
	<1305637877-24436-9-git-send-email-marc.zyngier@arm.com>
	<1305803858.2630.67.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1305803858.2630.67.camel@localhost>
Cc: Eric Miao <eric.y.miao@gmail.com>, Philipp Zabel <philipp.zabel@gmail.com>,
	Marc Zyngier <marc.zyngier@arm.com>,
	Nicolas Ferre <nicolas.ferre@atmel.com>,
	linux-mtd@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>,
	Russell King <linux@arm.linux.org.uk>,
	David Woodhouse <dwmw2@infradead.org>, Andrew Victor <linux@maxim.org.za>,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 14:17 Thu 19 May     , Artem Bityutskiy wrote:
> On Tue, 2011-05-17 at 14:11 +0100, Marc Zyngier wrote:
> > The set_vpp() method provided by physmap passes a map_info back to
> > the platform code, which has little relevance as far as the platform
> > is concerned (this parameter is completely unused).
> > 
> > Instead, pass the platform_device, which can be used in the pismo
> > driver to retrieve some important information in a nicer way, instead
> > of the hack that was in place.
> > 
> > The empty set_vpp function in board-at572d940hf_ek.c is left untouched,
> > as the board/SoC is scheduled for removal.
> > 
> > Cc: Andrew Victor <linux@maxim.org.za>
> > Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
> > Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
> > Cc: Russell King <linux@arm.linux.org.uk>
> > Cc: Philipp Zabel <philipp.zabel@gmail.com>
> > Cc: Eric Miao <eric.y.miao@gmail.com>
> > Cc: Ben Dooks <ben-linux@fluff.org>
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
> 
> Acked-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>

Best Regards,
J.
