In-Reply-To: <20130704154927.GE27646@sirena.org.uk>
References: <CAHSAbzPNDSr_6N79fh0DTWSEg8buRRPyiw8SPodtKLPjzWXJsg@mail.gmail.com>
 <20130704130017.GA25997@sig21.net>
 <OFA0D5839D.0594EA10-ONC1257B9E.004A7347-C1257B9E.00524BA5@rohde-schwarz.com>
 <20130704154927.GE27646@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
MIME-Version: 1.0
Subject: Re: SPI: DUAL/QUAD support
From: Thomas.Betker@rohde-schwarz.com
Message-ID: <OFAD729A05.8C915625-ONC1257B9E.00576B25-C1257B9E.0058477D@rohde-schwarz.com>
Date: Thu, 4 Jul 2013 18:04:14 +0200
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd <linux-mtd-bounces@lists.infradead.org>,
 Johannes Stezenbach <js@sig21.net>, Grant Likely <grant.likely@secretlab.ca>,
 linux-mtd@lists.infradead.org, spi-devel-general@lists.sourceforge.net,
 yuhang wang <wangyuhang2014@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Mark:

> Well, there's two bits here.  One is the support in the client drivers
> for using the extra data lines and the other is the support in the SPI
> core for telling controllers to do this.  We need that second bit in
> place before the first one can be implemented.

I am not sure if we do. In the system I am working on, the QSPI controller 
recognizes the quad mode commands from the Tx data and automatically 
switches modes; no manual intervention by the flash driver is needed.

I agree that this may not be the case for all SPI controllers. Yuhang, can 
you tell us what your controller will do?

Best regards,
Thomas
