Date: Sat, 6 Jul 2013 21:55:26 +0200
From: Jean Delvare <khali@linux-fr.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: MTD EEPROM support and driver integration
Message-ID: <20130706215526.7fc3e191@endymion.delvare>
In-Reply-To: <8997501.Dchyii8uWX@wuerfel>
References: <20130705201118.GM2959@lukather> <5811519.oHVuMujf0I@wuerfel>
 <20130706120112.GA11069@lukather> <8997501.Dchyii8uWX@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>, oliver@schinagl.nl,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Shawn Guo <shawn.guo@linaro.org>, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 06 Jul 2013 21:06:49 +0200, Arnd Bergmann wrote:
> On Saturday 06 July 2013 14:01:12 Maxime Ripard wrote:
> > So that leave us with mainly one path to achieve this goal:
> >   - Add a regmap-mtd backend
> >   - Add DT parsing code for regmap
> >   - Move the EEPROM drivers from misc to mtd
> 
> Yes, I think that would be good. For the last step, we definitely need
> buy-in from Wolfgand and Jean, as they are maintaining the current eeprom
> drivers.

I am maintaining the legacy eeprom driver, which nobody should be using
in conjunction with DT. So you don't need my approval for anything.

-- 
Jean Delvare
