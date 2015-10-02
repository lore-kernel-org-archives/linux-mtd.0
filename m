Date: Thu, 1 Oct 2015 20:08:00 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Josh Wu <josh.wu@atmel.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Huang Shijie <shijie.huang@intel.com>,
 Bryan Wu <bryan.wu@analog.com>, Stefan Agner <stefan@agner.ch>,
 devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2] mtd: nand: pass page number to
 ecc->write_xxx() methods
Message-ID: <20151002030800.GE107187@google.com>
References: <1443728091-13859-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1443728091-13859-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 01, 2015 at 09:34:51PM +0200, Boris Brezillon wrote:
> The ->read_xxx() methods are all passed the page number the NAND controller
> is supposed to read, but ->write_xxx() do not have such a parameter.
> 
> This is a problem if we want to properly implement data
> scrambling/randomization in order to mitigate MLC sensibility to repeated
> pattern: to prevent bitflips in adjacent pages in the same block we need
> to avoid repeating the same pattern at the same offset in those pages,
> hence the randomizer/scrambler engine need to be passed the page value
> in order to adapt its seed accordingly.
> 
> Moreover, adding the page parameter to the ->write_xxx() methods add some
> consistency to the current API.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> CC: Josh Wu <josh.wu@atmel.com>
> CC: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> CC: Maxime Ripard <maxime.ripard@free-electrons.com>
> CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> CC: Huang Shijie <shijie.huang@intel.com>
> CC: Bryan Wu <bryan.wu@analog.com>
> CC: Stefan Agner <stefan@agner.ch>
> CC: devel@driverdev.osuosl.org
> CC: linux-arm-kernel@lists.infradead.org
> CC: linux-kernel@vger.kernel.org
> ---
> Sorry for the noise, I didn't send the correct patch version (the one
> fixing the compilation error in the doc4g driver).
> 
> Changes since v1:
> - rebased on l2-mtd/master
> - fixed compilation error in the doc4g driver

Didn't really look at the patch yet, but my build tests say:

drivers/mtd/nand/gpmi-nand/gpmi-nand.c: In function ‘gpmi_ecc_write_oob_raw’:
drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1536:2: error: too few arguments to function ‘gpmi_ecc_write_page_raw’
drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1446:12: note: declared here

Brian
