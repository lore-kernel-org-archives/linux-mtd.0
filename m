Subject: Re: [PATCH v2] MTD: NAND: ams-delta: convert to platform driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>
In-Reply-To: <201012142109.42784.jkrzyszt@tis.icnet.pl>
References: <201012111840.05270.jkrzyszt@tis.icnet.pl>
	<1292346023.2538.103.camel@localhost>
	<201012142109.42784.jkrzyszt@tis.icnet.pl>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 15 Dec 2010 11:37:45 +0200
Message-ID: <1292405865.2512.28.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Tony Lindgren <tony@atomide.com>, David Woodhouse <dwmw2@infradead.org>,
	linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-12-14 at 21:09 +0100, Janusz Krzysztofik wrote:
> In its current form, the driver may interfere with different hardware on 
> different boards if built into the kernel, hence is not suitable for 
> inclusion into a defconfig, inteded to be usable with multiple OMAP1 cpu and 
> machine types.
> 
> Convert it to a platform driver, that should be free from this issue.
> 
> Created and tested against linux-2.6.37-rc5 on Amstrad Delta.
> 
> Signed-off-by: Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>

Pushed to l2-mtd-2.6.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
