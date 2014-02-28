Message-ID: <5310AEA8.1070804@ti.com>
Date: Fri, 28 Feb 2014 10:43:36 -0500
From: Santosh Shilimkar <santosh.shilimkar@ti.com>
MIME-Version: 1.0
To: <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v6 0/2] Introduce AEMIF driver for Davinci/Keystone archs
References: <1393262772-24442-1-git-send-email-ivan.khoronzhuk@ti.com>
In-Reply-To: <1393262772-24442-1-git-send-email-ivan.khoronzhuk@ti.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, grygorii.strashko@ti.com,
 linux@arm.linux.org.uk, pawel.moll@arm.com, swarren@wwwdotorg.org,
 ijc+devicetree@hellion.org.uk, nsekhar@ti.com, galak@kernel.crashing.org,
 rob.herring@calxeda.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, robherring2@gmail.com, rob@landley.net,
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greg,

On Monday 24 February 2014 12:26 PM, Ivan Khoronzhuk wrote:
> These patches introduce Async External Memory Interface (EMIF16/AEMIF)
> controller driver for Davinci/Keystone archs.
> 
> For more informations see documentation:
> Davinci DM646x - http://www.ti.com/lit/ug/sprueq7c/sprueq7c.pdf
> OMAP-L138 - http://www.ti.com/lit/ug/spruh77a/spruh77a.pdf
> Kestone - http://www.ti.com/lit/ug/sprugz3a/sprugz3a.pdf
> 
[..]

> 
> v5..v6:
> - memory: ti-aemif: introduce AEMIF driver
> - memory: ti-aemif: add bindings for AEMIF driver
> 	changed opaque names for cs node properties
> 
Can you please pick these two patches ? 

Regards,
Santosh
