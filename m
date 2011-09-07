Message-ID: <4E672823.4080003@arm.com>
Date: Wed, 07 Sep 2011 09:15:31 +0100
From: Marc Zyngier <marc.zyngier@arm.com>
MIME-Version: 1.0
To: Linus Walleij <linus.walleij@stericsson.com>
Subject: Re: [PATCH] mtd: drop Integrator flash map Kconfig
References: <1315381829-21548-1-git-send-email-linus.walleij@stericsson.com>
In-Reply-To: <1315381829-21548-1-git-send-email-linus.walleij@stericsson.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Lee Jones <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/09/11 08:50, Linus Walleij wrote:
> From: Linus Walleij <linus.walleij@linaro.org>
> 
> The integrator flash has been deleted, even from the Makefile.
> Drop the Kconfig entry as well.
> 
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

I wonder how I managed to drop that hunk. Oh well...
Thanks for noticing this!

Acked-by: Marc Zyngier <marc.zyngier@arm.com>
-- 
Jazz is not dead. It just smells funny...
