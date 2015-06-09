Date: Tue, 9 Jun 2015 22:05:04 +0200
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH v4 1/6] mtd: nand: vf610_nfc: Freescale NFC for VF610,
 MPC5125 and others
Message-ID: <20150609200504.GB5720@breakpoint.cc>
References: <1427300909-20825-1-git-send-email-stefan@agner.ch>
 <1427300909-20825-2-git-send-email-stefan@agner.ch>
 <20150603081059.GA6944@breakpoint.cc>
 <821b4731043fef279b6a82b920707982@agner.ch>
 <20150603120355.GA1668@breakpoint.cc>
 <b457fab56ff3ebc72f264a400a0ab33f@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b457fab56ff3ebc72f264a400a0ab33f@agner.ch>
Cc: mark.rutland@arm.com, boris.brezillon@free-electrons.com,
 aaron@tastycactus.com, pawel.moll@arm.com, marb@ixxat.de,
 ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org,
 shawn.guo@linaro.org, devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, galak@codeaurora.org,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, bpringlemeir@nbsps.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015-06-03 17:09:33 [+0200], Stefan Agner wrote:
> Hm, so on PPC the boot ROM is making use of the HW ECC controller, is
> this correct?
On MPC5125, yes.

> --
> Stefan

Sebastian
