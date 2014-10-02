Message-ID: <542D46A1.9090905@ti.com>
Date: Thu, 2 Oct 2014 15:35:45 +0300
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: Rostislav Lisovy <lisovy@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Tony
 Lindgren <tony@atomide.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] mtd: nand: omap: Do not use global variables
References: <1412252173-20454-1-git-send-email-lisovy@merica.cz>
In-Reply-To: <1412252173-20454-1-git-send-email-lisovy@merica.cz>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: michal.vokac@comap.cz, Rostislav Lisovy <lisovy@merica.cz>,
 sojkam1@fel.cvut.cz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/02/2014 03:16 PM, Rostislav Lisovy wrote:
> Since the commit 97a288ba2cfa ("ARM: omap2+: gpmc-nand: Use
> dynamic platform_device_alloc()") gpmc-nand driver supports
> multiple NAND flash devices connected to the single controller.
> Remove global variable to make the code thread-safe.
> 
> Signed-off-by: Rostislav Lisovy <lisovy@merica.cz>

Acked-by: Roger Quadros <rogerq@ti.com>

cheers,
-roger
