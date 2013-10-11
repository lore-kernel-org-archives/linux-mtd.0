Received: from mho-02-ewr.mailhop.org ([204.13.248.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VUkYM-0000Mc-O5
 for linux-mtd@lists.infradead.org; Fri, 11 Oct 2013 21:47:23 +0000
Date: Fri, 11 Oct 2013 14:46:54 -0700
From: Tony Lindgren <tony@atomide.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v8 6/6] mtd: nand: omap: updated devm_xx for all
 resource allocation and free calls
Message-ID: <20131011214653.GA29913@atomide.com>
References: <1381498603-15715-1-git-send-email-pekon@ti.com>
 <1381498603-15715-7-git-send-email-pekon@ti.com>
 <20131011181515.GJ23337@ld-irv-0074.broadcom.com>
 <20131011182840.GW29913@atomide.com>
 <CAN8TOE9S63a1YdtzS+urTGBoMqrhq83cXXEeGinvQi9=dyUX1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN8TOE9S63a1YdtzS+urTGBoMqrhq83cXXEeGinvQi9=dyUX1Q@mail.gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Pawel Moll <Pawel.Moll@arm.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Avinash Philip <avinashphilipk@gmail.com>, "Balbi, Felipe" <balbi@ti.com>,
 robherring2@gmail.com, Pekon Gupta <pekon@ti.com>, bcousson@baylibre.com,
 Stephen Warren <swarren@wwwdotorg.org>, "olof@lixom.net" <olof@lixom.net>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Brian Norris <computersforpeace@gmail.com> [131011 12:35]:
> On Fri, Oct 11, 2013 at 11:28 AM, Tony Lindgren <tony@atomide.com> wrote:
> >
> > FYI, the .dts changes should be queued separately by Benoit to avoid
> > pointless merge conflicts. The arch/arm/mach-omap2/gpmc.c changes I
> > need to look, hopefully I can ack those for you today so you can take
> > the code related changes into the MTD tree.
> 
> Why are you replying to this patch, instead of the DTS?

Because you said you might merrge some parts of the series and I've
seen many merge cycles of pointless merge conflicts with driver
maintainers merging .dts files along with the driver changes? :)

Pekon, can please post the .dts changes entirely separately from
the driver changes in the future?
 
> Also, I don't think all of this code is ready. There are several
> comments from weeks ago that Pekon hasn't addressed. It's possible the
> DT binding changes can go in, but not some of the later patches, yet.

Yes that's up to you. I have not looked at the MTD parts and I
appreciate the fact that you are reviewing that stuff. I've acked
the arch/arm/*omap* parts so hopefully I'm out of the loop now.

Regards,

Tony
