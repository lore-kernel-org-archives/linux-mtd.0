Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VK7gm-0001EG-Oa
 for linux-mtd@lists.infradead.org; Thu, 12 Sep 2013 14:16:09 +0000
Date: Thu, 12 Sep 2013 15:10:11 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [PATCH v3 0/8] Add the Quadspi driver for vf610-twr
Message-ID: <20130912141011.GK12758@n2100.arm.linux.org.uk>
References: <20130911104126.GN29403@sirena.org.uk>
 <52304BFF.4060007@freescale.com> <20130911113002.GP29403@sirena.org.uk>
 <523186DF.4070203@freescale.com>
 <1378982395.2627.416.camel@shinybook.infradead.org>
 <20980858CB6D3A4BAE95CA194937D5E73EA0EE8B@DBDE04.ent.ti.com>
 <1378984665.2627.423.camel@shinybook.infradead.org>
 <20130912114831.GL29403@sirena.org.uk>
 <20130912115549.GI12758@n2100.arm.linux.org.uk>
 <alpine.DEB.2.00.1309121523130.2394@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1309121523130.2394@lnxricardw.se.axis.com>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "b44548@freescale.com" <b44548@freescale.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "b18965@freescale.com" <b18965@freescale.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>,
 Mark Brown <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "lznuaa@gmail.com" <lznuaa@gmail.com>,
 "shawn.guo@linaro.org" <shawn.guo@linaro.org>,
 Huang Shijie <shijie8@gmail.com>, Huang Shijie <b32955@freescale.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 12, 2013 at 03:25:45PM +0200, Ricard Wanderlof wrote:
> A bit of an odd name when used in this context I think; LUTs are usually  
> used to perform mapping or transformation functions, e.g. looking up a  
> value 'y' given an input value 'x'. In this case it's just a table of  
> commands to be executed. But I guess the name LUT has been used in some  
> hardware specification so there's not much we can do about it.

Remember that not all designers speak the English language, so they
may very well call something like this a lookup table, because it's
very similar to what they may have implemented in things like video
chips to translate colour indexes to actual colours... especially
when they call the thing which controls where in the "table" entries
are read from an "index".  They could've also called it an "array"
too.

Either way, it doesn't matter - the principle is that it's a sequence
of consecutive programmable entries which provide commands for the
controller to use.

Just remember all the problems of flat pack furnature where the
instructions are a poor translation of another language - or indeed
technological devices for that matter.  There's plenty of examples
out there where stuff is "lost in translation" and you're left
wondering what they're talking about.
