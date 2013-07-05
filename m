MIME-Version: 1.0
In-Reply-To: <51D67851.8020402@ti.com>
References: <CAHSAbzPNDSr_6N79fh0DTWSEg8buRRPyiw8SPodtKLPjzWXJsg@mail.gmail.com>
 <20130704130017.GA25997@sig21.net>
 <OFA0D5839D.0594EA10-ONC1257B9E.004A7347-C1257B9E.00524BA5@rohde-schwarz.com>
 <20130704154927.GE27646@sirena.org.uk>
 <OFAD729A05.8C915625-ONC1257B9E.00576B25-C1257B9E.0058477D@rohde-schwarz.com>
 <CAHSAbzOg+uHndydSC43moF7pijc67pqzB2rPnY69ynXHEzw79g@mail.gmail.com>
 <51D67851.8020402@ti.com>
Date: Fri, 5 Jul 2013 16:48:22 +0800
Message-ID: <CAHSAbzNvMo_oeaqtzO8-xDm-L-f8wVccVqfuVqbR=OwqWJhVwg@mail.gmail.com>
Subject: Re: SPI: DUAL/QUAD support
From: yuhang wang <wangyuhang2014@gmail.com>
To: Sourav Poddar <sourav.poddar@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd <linux-mtd-bounces@lists.infradead.org>,
 Johannes Stezenbach <js@sig21.net>, Grant Likely <grant.likely@secretlab.ca>,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Thomas.Betker@rohde-schwarz.com, spi-devel-general@lists.sourceforge.net,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> To add to all the discussion going on,
> I am using a qspi controller with a spansion flash device.
> I tried using quad read mode bit, and what is required to change in
> my case is the following:
>
> 1. enable quad mode in flash configuration register.
> 2. change my read opcode to QUAD READ opcode according to flash datasheet.
> 3. Configure my qspi controller cmd reg to use 6 PIN whenever quad mode is
> used.
>

Sorry, to the third point I am still not very clear. The first time,
spi controller should send
QUAD READ opcode to your spansion flash with 1 line, then receive datas from
flash with 4 lines. So how does your controller master this process
automatically.

Please give me some details.

Thanks
