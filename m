From: Arnd Bergmann <arnd@arndb.de>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 00/22] Random ARM randconfig fixes in drivers
Date: Fri, 9 May 2014 13:48:49 +0200
References: <1399560433-1402630-1-git-send-email-arnd@arndb.de>
 <20140508164157.GA22224@roeck-us.net>
In-Reply-To: <20140508164157.GA22224@roeck-us.net>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201405091348.49713.arnd@arndb.de>
Cc: wsa@the-dreams.de, tony@atomide.com, linux-pci@vger.kernel.org,
 linus.walleij@linaro.org, nicolas.ferre@atmel.com, linux-ide@vger.kernel.org,
 wim@iguana.be, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, vinod.koul@intel.com,
 linux-sh@vger.kernel.org, kishon@ti.com, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, plagnioj@jcrosoft.com, ohad@wizery.com,
 linux-watchdog@vger.kernel.org, broonie@kernel.org, bhelgaas@google.com,
 linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org,
 gregkh@linuxfoundation.org, dmitry.torokhov@gmail.com,
 linux-kernel@vger.kernel.org, balbi@ti.com, josh.wu@atmel.com,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, dwmw2@infradead.org,
 jic23@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 08 May 2014, Guenter Roeck wrote:
> On Thu, May 08, 2014 at 04:46:51PM +0200, Arnd Bergmann wrote:
> > These are a bunch of fixes I had to do to get all randconfig
> > configurations on ARM working. Most of these are really old
> > bugs, but there are also some new ones. I don't think any of
> > them require a backport to linux-stable.
> > 
> > I have checked that they are all still required on yesterday's
> > linux-next kernel. Please apply on the appropriate trees unless
> > there are objections.
> > 
> Is this series of patches also going to fix arm:allmodconfig ?

Possibly, I haven't checked in a while. I'm unfortunately sitting on
about 200 other patches in the same branch, which together fix all
build errors in any configuration I encountered.

I should really do some allmodconfig/allnoconfig/allyesconfig
builds without my series again, and prioritize sending out the
ones required for that.

	Arnd
