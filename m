Date: Tue, 14 Dec 2010 14:28:21 -0800
From: Tony Lindgren <tony@atomide.com>
To: Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>
Subject: Re: [PATCH v2] MTD: NAND: ams-delta: convert to platform driver
Message-ID: <20101214222821.GA14990@atomide.com>
References: <201012111840.05270.jkrzyszt@tis.icnet.pl>
	<1292346023.2538.103.camel@localhost>
	<201012142109.42784.jkrzyszt@tis.icnet.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201012142109.42784.jkrzyszt@tis.icnet.pl>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-omap@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Janusz Krzysztofik <jkrzyszt@tis.icnet.pl> [101214 12:31]:
> In its current form, the driver may interfere with different hardware on 
> different boards if built into the kernel, hence is not suitable for 
> inclusion into a defconfig, inteded to be usable with multiple OMAP1 cpu and 
> machine types.
> 
> Convert it to a platform driver, that should be free from this issue.
> 
> Created and tested against linux-2.6.37-rc5 on Amstrad Delta.

Good to see this happen, I assume this is for MTD. If not and you
want me to merge it instead, let me know.

Acked-by: Tony Lindgren <tony@atomide.com>
