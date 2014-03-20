Date: Thu, 20 Mar 2014 00:55:43 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 25/35] mtd: st_spi_fsm: Add the ability to read from a
 Serial Flash device
Message-ID: <20140320075543.GD31517@norris-Latitude-E6410>
References: <1392735362-1245-1-git-send-email-lee.jones@linaro.org>
 <1392735362-1245-26-git-send-email-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1392735362-1245-26-git-send-email-lee.jones@linaro.org>
Cc: Angus.Clark@st.com, DCG_UPD_stlinux_kernel@list.st.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 18, 2014 at 02:55:52PM +0000, Lee Jones wrote:
> diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
> index fe538bb..e4815fe 100644
> --- a/drivers/mtd/devices/st_spi_fsm.c
> +++ b/drivers/mtd/devices/st_spi_fsm.c
> @@ -942,6 +945,100 @@ static int stfsm_n25q_config(struct stfsm *fsm)
[...]
> +static int stfsm_mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
> +			  size_t *retlen, u_char *buf)
> +{
> +	struct stfsm *fsm = dev_get_drvdata(mtd->dev.parent);
> +	uint32_t bytes;
> +
> +	dev_dbg(fsm->dev, "%s from 0x%08x, len %zd\n",
> +		__func__, (u32)from, len);
> +
> +	mutex_lock(&fsm->lock);
> +
> +	while (len > 0) {
> +		bytes = min_t(size_t, len, FLASH_PAGESIZE);
> +
> +		stfsm_read(fsm, buf, bytes, from);
> +
> +		buf += bytes;
> +		from += bytes;
> +		len -= bytes;
> +
> +		if (retlen)

Same as with your _write implementation; you can assume that retlen is
always non-NULL.

> +			*retlen += bytes;
> +	}
> +
> +	mutex_unlock(&fsm->lock);
> +
> +	return 0;
> +}
> +
>  static void stfsm_read_jedec(struct stfsm *fsm, uint8_t *const jedec)
>  {
>  	const struct stfsm_seq *seq = &stfsm_seq_read_jedec;

Brian
