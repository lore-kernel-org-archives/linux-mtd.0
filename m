From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-omap@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Tony Lindgren <tony@atomide.com>,
 Richard Weinberger <richard@nod.at>, linux-gpio@vger.kernel.org,
 Aaro Koskinen <aaro.koskinen@iki.fi>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH v2 07/12] mtd: rawnand: ams-delta: Set port direction
 once per transfer
Date: Wed, 08 Aug 2018 18:55:35 +0200
Message-ID: <3260564.acbQT1CZaz@z50>
In-Reply-To: <20180807205752.32cd3e53@bbrezillon>
References: <20180718235710.18242-1-jmkrzyszt@gmail.com>
 <20180806222918.12644-8-jmkrzyszt@gmail.com>
 <20180807205752.32cd3e53@bbrezillon>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Tuesday, August 7, 2018 8:57:52 PM CEST Boris Brezillon wrote:
> On Tue,  7 Aug 2018 00:29:13 +0200
> Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:
> 
> > In its current shape, the driver sets data port direction before each
> > byte read/write operation, even during multi-byte transfers.  Since
> > performance of the driver is completely not acceptable on Amstrad Delta
> > after it has been converted to GPIO bitbang, try to improve things a
> > bit by setting the port direction only on first byte of each transfer.
> ...
> I'd suggest a slightly different approach where the data pins
> direction state is stored in the the priv struct and only changed when
> required. This way you just have to add a test in
> ams_delta_read/write_byte().

Good idea, I'm going to use it, thanks.

Once done, may I also move that one earlier in the series so that it can be 
applied while our discussion on GPIO bitmap changes still continues?

Thanks,
Janusz
