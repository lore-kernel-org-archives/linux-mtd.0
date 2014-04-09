Date: Tue, 8 Apr 2014 23:00:59 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 07/15] mtd: st_spi_fsm: Extend fsm_clear_fifo to handle
 unwanted bytes
Message-ID: <20140409060059.GD3131@norris-Latitude-E6410>
References: <1395851969-13520-1-git-send-email-lee.jones@linaro.org>
 <1395851969-13520-8-git-send-email-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395851969-13520-8-git-send-email-lee.jones@linaro.org>
Cc: angus.clark@st.com, linux-mtd@lists.infradead.org,
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

On Wed, Mar 26, 2014 at 04:39:21PM +0000, Lee Jones wrote:
> From: Angus Clark <angus.clark@st.com>
...
> diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
> index 8c56b94..9df59e7 100644
> --- a/drivers/mtd/devices/st_spi_fsm.c
> +++ b/drivers/mtd/devices/st_spi_fsm.c
...
> +	dev_dbg(fsm->dev, "cleared %d byte(s) from the data FIFO\n", 4 - i);
> +}
> +
>  static int stfsm_write_fifo(struct stfsm *fsm, uint32_t *buf, uint32_t size)

This patch does not apply to l2-mtd.git, and neither do several of the
following patches. You probably didn't rebase onto the patches regarding
the above line (adding 'const').

>  {
>  	uint32_t words = size >> 2;

Brian
