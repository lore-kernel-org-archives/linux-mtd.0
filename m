Subject: Re: [PATCH] nand: fix .correct callback return value check
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
In-Reply-To: <ca767a0d6cafbea862c307e944c2b800dafb6660.1281327492.git.baruch@tkos.co.il>
References: <20100808204341.GA20065@pengutronix.de>
	<ca767a0d6cafbea862c307e944c2b800dafb6660.1281327492.git.baruch@tkos.co.il>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 29 Aug 2010 14:01:03 +0300
Message-ID: <1283079663.2131.0.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	John Ogness <john.ogness@linutronix.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-08-09 at 07:20 +0300, Baruch Siach wrote:
> Drivers may (and do) return negative errno values other than -1 from the
> .correct callback.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Pushed to l2-mtd-2.6.git / master, thank you!

Artem.
