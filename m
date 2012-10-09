MIME-Version: 1.0
Sender: viresh.linux@gmail.com
In-Reply-To: <2b88c853b3691338fae037f569917fc300cd6032.1349778821.git.vipin.kumar@st.com>
References: <cover.1349778820.git.vipin.kumar@st.com>
 <2b88c853b3691338fae037f569917fc300cd6032.1349778821.git.vipin.kumar@st.com>
Date: Tue, 9 Oct 2012 23:11:25 +0530
Message-ID: <CAOh2x=mwWPyPDQG1NZ-XKXCjxFuPdypUNcn8b-prmrv3f2QxsQ@mail.gmail.com>
Subject: Re: [PATCH 07/11] fsmc/nand: Provide contiguous buffers to dma
From: viresh kumar <viresh.kumar@linaro.org>
To: Vipin Kumar <vipin.kumar@st.com>, "pratyush.anand" <pratyush.anand@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: dedekind1@gmail.com, linus.walleij@linaro.org, spear-devel@list.st.com,
 linux-mtd@lists.infradead.org, plagnioj@jcrosoft.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 9, 2012 at 4:14 PM, Vipin Kumar <vipin.kumar@st.com> wrote:
> diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
> @@ -675,7 +676,8 @@ static void fsmc_read_buf_dma(struct mtd_info *mtd, uint8_t *buf, int len)
>         struct fsmc_nand_data *host;
>
>         host = container_of(mtd, struct fsmc_nand_data, mtd);
> -       dma_xfer(host, buf, len, DMA_FROM_DEVICE);
> +       dma_xfer(host, host->dma_buf, len, DMA_FROM_DEVICE);
> +       memcpy(buf, (const void *)host->dma_buf, len);

Ahh.. Too much overhead. Can't you do something better here?
- DMA can be done to user buffers too, Pratyush has done some work in
past on this.
- There must be some other way of sharing kernel buffer to user space.

--
viresh
