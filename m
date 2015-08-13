Date: Wed, 12 Aug 2015 19:48:40 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Joachim Eastwood <manabian@gmail.com>
Cc: dwmw2@infradead.org, ezequiel@vanguardiasur.com.ar,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] mtd: spi-nor: add driver for NXP SPI Flash
 Interface (SPIFI)
Message-ID: <20150813024840.GE108786@google.com>
References: <1436473147-31063-1-git-send-email-manabian@gmail.com>
 <1436473147-31063-2-git-send-email-manabian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1436473147-31063-2-git-send-email-manabian@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 09, 2015 at 10:19:06PM +0200, Joachim Eastwood wrote:
> Add SPI-NOR driver for the SPI Flash Interface (SPIFI)
> controller that is found newer NXP MCU devices.
> 
> The controller supports serial SPI Flash devices with 1-, 2-
> and 4-bit width in either SPI mode 0 or 3. The controller
> can operate in either command or memory mode. In memory mode
> the Flash is exposed as normal memory and can be directly
> accessed by the CPU.
> 
> Signed-off-by: Joachim Eastwood <manabian@gmail.com>
> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Yep, same comments apply from v3. Sorry for the mixup.

Brian
