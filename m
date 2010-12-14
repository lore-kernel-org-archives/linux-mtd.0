Subject: Re: [PATCH] MTD: NAND: ams-delta: convert to platform driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>
In-Reply-To: <201012111840.05270.jkrzyszt@tis.icnet.pl>
References: <201012111840.05270.jkrzyszt@tis.icnet.pl>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 14 Dec 2010 19:00:23 +0200
Message-ID: <1292346023.2538.103.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Tony Lindgren <tony@atomide.com>, David Woodhouse <dwmw2@infradead.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-12-11 at 18:40 +0100, Janusz Krzysztofik wrote:
> In its current form, the driver may break unrelated machines if built into the 
> kernel, hence is not suitable for inclusion into a kernel built for multiple 
> OMAP1 machines. Convert it to a platform driver, that should be free from that 
> issue.
> 
> While being at it, get rid of depreciated omap_read/write(), use ioremap() 
> instead.
> 
> Created and tested against linux-2.6.37-rc5 on Amstrad Delta.
> 
> Signed-off-by: Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>

Sorry, but would it please be possible to split this few small patches -
this one is too difficult to review, at least for me.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
