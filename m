Received: from mho-03-ewr.mailhop.org ([204.13.248.66]
 helo=mho-01-ewr.mailhop.org)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vbzj9-0002yr-Js
 for linux-mtd@lists.infradead.org; Thu, 31 Oct 2013 21:24:28 +0000
Date: Thu, 31 Oct 2013 14:23:49 -0700
From: Tony Lindgren <tony@atomide.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v11 00/10] [PATCH v10 00/10] mtd:nand:omap2: clean-up
 of supported ECC schemes
Message-ID: <20131031212348.GK15154@atomide.com>
References: <1382619026-4182-1-git-send-email-pekon@ti.com>
 <20131024135258.GC9958@localhost>
 <CAN8TOE_KQxW4-6KgjQDczyB31wmYB_y9Tirxa34GWQGgY39sNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN8TOE_KQxW4-6KgjQDczyB31wmYB_y9Tirxa34GWQGgY39sNQ@mail.gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Pawel Moll <Pawel.Moll@arm.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Avinash Philip <avinashphilipk@gmail.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 "jp.francois@cynove.com" <jp.francois@cynove.com>, "Balbi,
 Felipe" <balbi@ti.com>, Rob Herring <robherring2@gmail.com>,
 Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 "olof@lixom.net" <olof@lixom.net>, Benoit Cousson <bcousson@baylibre.com>,
 Ivan Djelic <ivan.djelic@parrot.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Brian Norris <computersforpeace@gmail.com> [131029 21:00]:
> 
> Tony, you mentioned the DTS update in patch 8 going in via an ARM
> tree? This patch is not urgent, and it should probably wait until we
> know what release the rest of the series makes it into. This may
> depend on David Woodhouse's recommendation, but I'm not sure this
> series will have enough time baking in linux-next before entering
> mainline in 3.13 (the merge window is approaching).

Yes Benoit or I can apply that patch if Pekon pings me or resends
that patch when it's OK to merge it.

Regards,

Tony
