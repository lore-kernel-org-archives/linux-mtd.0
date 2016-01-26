Date: Tue, 26 Jan 2016 16:02:55 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, Grant Likely <grant.likely@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/6] mtd: augment the "arm,versatile-flash" bindings
Message-ID: <20160126220255.GA13707@rob-hp-laptop>
References: <1453806725-4880-1-git-send-email-linus.walleij@linaro.org>
 <1453806725-4880-2-git-send-email-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1453806725-4880-2-git-send-email-linus.walleij@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 26, 2016 at 12:12:00PM +0100, Linus Walleij wrote:
> The bindings for the "arm,versatile-flash" device was merged in
> commit 3ba7222ac992d24d09ccd0b55940b54849eef752
> "arm/versatile: Add device tree support" but was never used
> for anything.
> 
> Versatile flash chips are actually just standard CFI chips,
> but they have one or two bits in a system controller to control
> VPP and write protection. Let's use this compatible string in
> conjunction with "cfi-flash" to indicate that we have a
> normal CFI flash with some extra Versatile-specific protection.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Grant Likely <grant.likely@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../devicetree/bindings/mtd/arm-versatile.txt        | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
