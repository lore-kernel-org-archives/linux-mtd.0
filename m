Date: Sun, 27 Jul 2014 22:31:15 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Subject: Re: [PATCHv4 0/5] mtd: gpmi: make blockmark swapping optional
Message-ID: <20140728053115.GB3095@norris-Latitude-E6410>
References: <1402579245-13377-1-git-send-email-LW@KARO-electronics.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1402579245-13377-1-git-send-email-LW@KARO-electronics.de>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Boris BREZILLON <b.brezillon.dev@gmail.com>, linux-doc@vger.kernel.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-mtd@lists.infradead.org,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Jingoo Han <jg1.han@samsung.com>, Shawn Guo <shawn.guo@freescale.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Fabio Estevam <fabio.estevam@freescale.com>, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, Rob Landley <rob@landley.net>,
 Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawn.guo@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 12, 2014 at 03:20:40PM +0200, Lothar Waßmann wrote:
> With a flash-based BBT there is no reason to move the Factory Bad
> Block Marker from the data area buffer (to where it is mapped by the
> GPMI NAND controller) to the OOB buffer. Thus, make this feature
> configurable via DT. This is required for the Ka-Ro electronics
> i.MX6 platforms.

Pushed patches 1-3 to l2-mtd.git. Thanks!

Brian
