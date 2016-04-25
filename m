From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Russell King - ARM Linux <linux@arm.linux.org.uk>,
 "arm@kernel.org" <arm@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [GIT PULL] move Versatile flash protection to the device tree
Date: Mon, 25 Apr 2016 23:44:40 +0200
Message-ID: <6943273.jykU37cR72@wuerfel>
In-Reply-To: <20160404163626.GA30894@localhost>
References: <CACRpkdZxrhkL7a6DG3frKeR+=xF6X4nczepAbqj1PGDs3VsmMQ@mail.gmail.com>
 <20160404163626.GA30894@localhost>
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

On Monday 04 April 2016 09:36:26 Brian Norris wrote:
> 
> On Mon, Apr 04, 2016 at 10:45:48AM +0200, Linus Walleij wrote:
> > Hi ARM SoC folks,
> > 
> > now I'm tired of waiting for the MTD maintainers' word on this patch
> > series. I sent a question about this approach on february 13:
> > http://marc.info/?l=linux-arm-kernel&m=145537026603174&w=2
> > 
> > With subsequent pings on feb 22, mar 5, mar 31, and the cleanup
> > missing the merge window.
> > 
> > As you can see the flash protection patch also caters for the
> > RealView flash protection bits.
> > 
> > Please pull this into the ARM SoC tree for testing in linux-next
> > for the v4.7 series. If the MTD people appear again and have issues
> > you can always drop the branch.
> > 

> > 
> 
> Acked-by: Brian Norris <computersforpeace@gmail.com>
> 

Merged into next/drivers, thanks!

	Arnd
