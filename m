Date: Sat, 13 Sep 2014 17:08:29 -0400
From: Jason Cooper <jason@lakedaemon.net>
To: klightspeed@killerwolves.net
Subject: Re: [PATCH reword] ARM: MVEBU: Netgear RN102: Use Hardware BCH ECC
Message-ID: <20140913210829.GI30828@titan.lakedaemon.net>
References: <1410339341-3372-1-git-send-email-klightspeed@killerwolves.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1410339341-3372-1-git-send-email-klightspeed@killerwolves.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>,
 Arnaud Ebalard <arno@natisbad.org>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 10, 2014 at 06:55:41PM +1000, klightspeed@killerwolves.net wrote:
> The bootloader on the Netgear ReadyNAS RN102 uses Hardware BCH ECC
> (strength = 4), while the pxa3xx NAND driver by default uses 
> Hamming ECC (strength = 1).
> 
> This patch changes the ECC mode on these machines to match that
> of the bootloader and of the stock firmware. That way, it is
> now possible to update the kernel from userland (e.g. using
> standard tools from mtd-utils package); u-boot will happily
> load and boot it.
> 
> Fixes: 92beaccd8b49 ("ARM: mvebu: Enable NAND controller in ReadyNAS 102 .dts file")
> Signed-off-by: Ben Peddell <klightspeed@killerwolves.net>
> Acked-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> Tested-by: Arnaud Ebalard <arno@natisbad.org>
> ---
>  arch/arm/boot/dts/armada-370-netgear-rn102.dts | 4 ++++
>  1 file changed, 4 insertions(+)

I've already applied this the mvebu/fixes:

  500abb6ccb9e ARM: mvebu: Netgear RN2120: Use Hardware BCH ECC

thx,

Jason.
