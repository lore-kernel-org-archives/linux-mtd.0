Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aq32k-0002JD-AT
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2016 18:28:07 +0000
Date: Tue, 12 Apr 2016 20:27:32 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: <linux-mtd@lists.infradead.org>, <linux-leds@vger.kernel.org>, Brian
 Norris <computersforpeace@gmail.com>, Jacek Anaszewski
 <j.anaszewski@samsung.com>
Subject: Re: [PATCH 2/2] leds: trigger: Introduce a MTD (NAND/NOR) trigger
Message-ID: <20160412202732.30d291c2@bbrezillon>
In-Reply-To: <1460478395-25925-3-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460478395-25925-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460478395-25925-3-git-send-email-ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

On Tue, 12 Apr 2016 13:26:35 -0300
Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:

> This commit introduces a MTD trigger for flash (NAND/NOR) device
> activity. The implementation is copied from IDE disk.
> 
> This deprecates the "nand-disk" LED trigger, but for backwards
> compatibility, we still keep the "nand-disk" trigger around.
> 
> The motivation for deprecating the "nand-disk" LED trigger is that
> it only works for NAND drivers, whereas the "mtd" LED trigger
> is more generic (in fact, "nand-disk" currently only works for
> certain NAND drivers).
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  drivers/leds/trigger/Kconfig       |  8 +++++++
>  drivers/leds/trigger/Makefile      |  1 +
>  drivers/leds/trigger/ledtrig-mtd.c | 49 ++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/mtdcore.c              |  7 ++++++
>  drivers/mtd/nand/nand_base.c       | 29 +---------------------
>  include/linux/leds.h               |  6 +++++

I'd suggest splitting this patch in 2, one adding ledtrig-mtd code, and
another one make use of ledtrig_mtd_activity() and removing
nand-trigger code.

IMHO, we should also factorize ledtrig-ide and ledtrig-mtd code
(after all, you just copied the implementation from ledtrig-ide).
How about renaming the ledtrig-ide into ledtrig-storage and
ledtrig_ide_activity() into ledtrig_storage_activity()?

You can then add a trigger named "storage" in addition to the existing
"nand-disk" and "ide-disk" ones.

Anyway, this is just a suggestion, and I let leds maintainers decide
whether this is appropriate or not.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
