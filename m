Date: Sun, 5 Oct 2014 23:40:30 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 8/9] mtd: nand: stm_nand_bch: add support for ST's BCH
 NAND controller
Message-ID: <20141006064030.GA20598@norris-Latitude-E6410>
References: <1409143344-22458-1-git-send-email-lee.jones@linaro.org>
 <1409143344-22458-9-git-send-email-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1409143344-22458-9-git-send-email-lee.jones@linaro.org>
Cc: pekon@pek-sem.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 27, 2014 at 01:42:23PM +0100, Lee Jones wrote:
> Reviewed-By: Pekon Gupta <pekon@pek-sem.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/mtd/nand/Kconfig        |    7 +
>  drivers/mtd/nand/Makefile       |    1 +
>  drivers/mtd/nand/stm_nand_bch.c | 1616 +++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/nand/stm_nand_dt.c  |  110 +++
>  drivers/mtd/nand/stm_nand_dt.h  |   24 +
>  include/linux/mtd/stm_nand.h    |  147 ++++
>  6 files changed, 1905 insertions(+)
>  create mode 100644 drivers/mtd/nand/stm_nand_bch.c
>  create mode 100644 drivers/mtd/nand/stm_nand_dt.c
>  create mode 100644 drivers/mtd/nand/stm_nand_dt.h
>  create mode 100644 include/linux/mtd/stm_nand.h

One more thing: you never answered my question from [1]: 

Does your driver pass the MTD tests? (drivers/mtd/tests/)

Brian

[1] http://lists.infradead.org/pipermail/linux-mtd/2014-August/055084.html
