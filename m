Date: Fri, 11 Dec 2015 14:11:43 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Ryan Mallon <rmallon@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 Alexander Clouter <alex@digriz.org.uk>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Gregory CLEMENT <gregory.clement@free-electrons.com>,
 Jason Cooper <jason@lakedaemon.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Marek Vasut <marek.vasut@gmail.com>, Steven Miao <realmz6@gmail.com>,
 adi-buildroot-devel@lists.sourceforge.net,
 Mikael Starvik <starvik@axis.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-cris-kernel@axis.com, Josh Wu <josh.wu@atmel.com>,
 Wan ZongShun <mcuos.com@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com,
 Stefan Agner <stefan@agner.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 devel@driverdev.osuosl.org, stable@vger.kernel.org,
 Dinh Nguyen <dinh.linux@gmail.com>
Subject: Re: [PATCH v4 01/58] mtd: nand: denali: add missing nand_release()
 call in denali_remove()
Message-ID: <20151211221143.GR144338@google.com>
References: <1449734442-18672-1-git-send-email-boris.brezillon@free-electrons.com>
 <1449734442-18672-2-git-send-email-boris.brezillon@free-electrons.com>
 <20151211004008.GQ144338@google.com>
 <20151211230305.506e2071@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151211230305.506e2071@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Fri, Dec 11, 2015 at 11:03:05PM +0100, Boris Brezillon wrote:
> On Thu, 10 Dec 2015 16:40:08 -0800
> Brian Norris <computersforpeace@gmail.com> wrote:
> > On Thu, Dec 10, 2015 at 08:59:45AM +0100, Boris Brezillon wrote:
> > > Unregister the NAND device from the NAND subsystem when removing a denali
> > > NAND controller, otherwise the MTD attached to the NAND device is still
> > > exposed by the MTD layer, and accesses to this device will likely crash
> > > the system.
> > > 
> > > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> > > Cc: <stable@vger.kernel.org> #3.8+
> > 
> > Does this follow these rules, from
> > Documentation/stable_kernel_rules.txt?
> > 
> >  - It must be obviously correct and tested.
> > 
> >  - It must fix a real bug that bothers people (not a, "This could be a
> >    problem..." type thing).
> 
> Sorry to bring the "stable or not stable (that is the question :-))"
> debate back, but after thinking a bit more about the implications of
> this missing nand_release() call, I think it is worth backporting the
> fix to all stable kernels.
> The reason is, it can potentially introduce a security hole, because if
> the mtd device is not unregister but the underlying mtd object is freed
> and the kernel reuses the same memory region for a different object,
> the MTD layer will possibly call one of the mtd->_method() function,
> and this field might point to another completely different function.
> 
> You'll say that denali devices are probably never removed and this is
> the reason why people have never seen this problem before, which would
> be a good reason to not bother backporting the patch.
> But, given that the driver can be compiled as a module (the user can
> possibly load/unload it, which will in turn create/destroy the
> NAND/MTD device), and that the denali controller can be exposed through
> a PCI bus (which, AFAIK is hotpluggable), I really think this fix
> should be sent to stable.

That's all well and good, but still nobody has told me they've tested
this.

I've pushed your v5 (+ comments, + ack) to l2-mtd.git. If it gets
testing and this request is made again at that point, we can easily send
it to stable after it hits Linus' tree. See option 2 in
Documentation/stable_kernel_rules.txt. You can even send the email
yourself, just CC me and anyone else relevant. I'll ack it if it's been
tested.

Regards,
Brian
