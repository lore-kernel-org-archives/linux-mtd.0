Subject: Re: [PATCH] [OneNAND] OTP support re-implementation 1/1
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Amul Kumar Saha <amul.saha@samsung.com>
In-Reply-To: <8A3568961C4E4E7495A397D2267B6E37@sisodomain.com>
References: <EF4202CC14044212993EE17E6010D5E7@sisodomain.com>
	<87D6E94B11734CE1A253D9AE203F4192@sisodomain.com>
	<4A94CF0A.6060106@gmail.com>
	<6098B9D32DCD48C387EF96034FFFC55D@sisodomain.com>
	<1251466736.3514.10.camel@localhost>
	<A32D4C31541C4D8B9BF6CB4D6EF4B5DC@sisodomain.com>
	<9c9fda240908310234h6cef3afev6a3f6e315321631b@mail.gmail.com>
	<C48D93C7DF3C4F9C96E47BE9D6F51F37@sisodomain.com>
	<4A9E0C47.205@gmail.com>
	<8A3568961C4E4E7495A397D2267B6E37@sisodomain.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 03 Sep 2009 09:10:45 +0300
Message-Id: <1251958245.5060.6.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kyungmin Park <kmpark@infradead.org>, David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-09-03 at 11:21 +0530, Amul Kumar Saha wrote:
> Hi Artem,
> 
> >> +if MTD_ONENAND_OTP
> >> +
> >> +config ONENAND_OTP_AREA
> >> + bool "OTP area ONLY"
> >> + depends on MTD_ONENAND_OTP
> >> + select ON_OTP_AREA
> >> +
> >> +config ONENAND_OTP_BLOCK0
> >> + bool "Block[0] ONLY"
> >> + depends on MTD_ONENAND_OTP&&  !ONENAND_OTP_AREA
> >> + select ON_OTP_BLOCK0
> >> +
> >> +config ONENAND_OTP_AREA_BLOCK0
> >> + bool "BOTH OTP area AND Block[0]"
> >> + depends on MTD_ONENAND_OTP&&  !ONENAND_OTP_AREA&&  !ONENAND_OTP_BLOCK0
> >> + select ON_OTP_AREA_BLOCK0
> >> +
> >> +endif #MTD_ONENAND_OTP
> >
> > If there were 10 OTP blocks, would you add 10 options?
> > I mean, are these switches really needed? Can we remove them?
> 
> There is just one OTP block.
> Three options are provided for the three known combinations of 1st Block and the OTP Block.
> The option to choose one should be provided to the user.

Wouldn't it be better to  make this run-time configurable? E.g., module
parameters? Too many config options are frowned upon usually.

> >> + struct onenand_chip *this = mtd->priv;
> >> + int value, block, page;
> >> +
> >> + /* Address translation */
> >> + switch (cmd) {
> >> + case ONENAND_CMD_OTP_ACCESS:
> >> + block = (int) (addr>>  this->erase_shift);
> >
> > Why do you need the (int) cast there? How about cleaning up
> >>> (missing space) ?
> 
> I can do that, but (int) cast has been followed throughout onenand_base.c file
> Just adhering to that.

Ok, you could send a cleanup patch for all places.

> 
> >> + page = -1;
> >> + break;
> >> +
> >> + default:
> >> + block = (int) (addr>>  this->erase_shift);
> >> + page = (int) (addr>>  this->page_shift);
> >
> > Ditto. And there are many places where you did not have put spaces properly.
> 
> I can't see any in the patch I sent.

Sorry, this is my stupid Thunderbug, probably.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
