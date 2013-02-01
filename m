Date: Fri, 1 Feb 2013 14:12:10 -0800
From: Tony Lindgren <tony@atomide.com>
To: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 3/3] arm: omap2: gpmc: add DT bindings for OneNAND
Message-ID: <20130201221209.GA22517@atomide.com>
References: <1359116591-32730-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1359116591-32730-3-git-send-email-ezequiel.garcia@free-electrons.com>
 <20130125155633.GC16795@e106331-lin.cambridge.arm.com>
 <CALF0-+X2qsF5OETerRSVsJbjkC-JdVXsZhyw1sxQYR+PWX6LHA@mail.gmail.com>
 <20130128115339.GD7754@e106331-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130128115339.GD7754@e106331-lin.cambridge.arm.com>
Cc: Javier Martinez Canillas <martinez.javier@gmail.com>,
 Ezequiel Garcia <elezegarcia@gmail.com>,
 "matthias.bgg@googlemail.com" <matthias.bgg@googlemail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>,
 "zonque@gmail.com" <zonque@gmail.com>,
 "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "jon-hunter@ti.com" <jon-hunter@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "b-cousson@ti.com" <b-cousson@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Mark Rutland <mark.rutland@arm.com> [130128 03:57]:
> 
> So if I've understood correctly, the first address cell is the CS, and the
> second the offset within this (as the comment in the onenand@0 node hints)?
> 
> If so, the code now makes sense to me :)

Sounds like further checking can be added as needed, so applying this
series into omap-for-v3.9/gpmc.

Regards,

Tony
