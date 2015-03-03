Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSgve-0000A7-MB
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 07:07:43 +0000
Received: by pdbfp1 with SMTP id fp1so8957548pdb.7
 for <linux-mtd@lists.infradead.org>; Mon, 02 Mar 2015 23:07:19 -0800 (PST)
Date: Mon, 2 Mar 2015 23:07:15 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH] MTD: m25p80: fix inconsistency in m25p_ids for Micron
 devices
Message-ID: <20150303070715.GC29684@norris-Latitude-E6410>
References: <1425288411-6888-1-git-send-email-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1425288411-6888-1-git-send-email-mike.looijmans@topic.nl>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, michal.simek@xilinx.com,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 02, 2015 at 10:26:51AM +0100, Mike Looijmans wrote:
> As stated in a5b7616c5, "mtd: m25p80,spi-nor: Fix module aliases for
> m25p80", m25p_ids[] in m25p80.c needs to be kept in sync with
> spi_nor_ids[] in spi-nor.c.
> 
> This patch fixes the mismatches for the Micron devices, the
> "n25q256a" and "n25q512a" do not exist in the spi_nor_ids, so

Huh?

$ git grep -n 'n25q512a' drivers/mtd
drivers/mtd/devices/m25p80.c:269:       {"n25q512a"},   {"n25q512ax3"}, {"n25q00"},
drivers/mtd/spi-nor/spi-nor.c:569:      { "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
drivers/mtd/spi-nor/spi-nor.c:570:      { "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
$ git grep -n 'n25q256a' drivers/mtd
drivers/mtd/devices/m25p80.c:268:       {"n25q064"},    {"n25q128a11"}, {"n25q128a13"}, {"n25q256a"},
drivers/mtd/spi-nor/spi-nor.c:568:      { "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },

> replace them with the correct names for these chips.
> 
> This repairs the disappearance of NOR flash on the Miami boards since 3.18.

$ git grep -n 'n25q256a' v3.18 -- drivers/mtd
v3.18:drivers/mtd/devices/m25p80.c:283: {"n25q064"},    {"n25q128a11"}, {"n25q128a13"}, {"n25q256a"},
v3.18:drivers/mtd/spi-nor/spi-nor.c:538:        { "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K) },
$ git grep -n 'n25q512a' v3.18 -- drivers/mtd
v3.18:drivers/mtd/devices/m25p80.c:284: {"n25q512a"},   {"n25q512ax3"}, {"n25q00"},
v3.18:drivers/mtd/spi-nor/spi-nor.c:539:        { "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K) },
v3.18:drivers/mtd/spi-nor/spi-nor.c:540:        { "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, USE_FSR) },

Perhaps you're looking at a modified 3.18 kernel from your vendor?

> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>  drivers/mtd/devices/m25p80.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index b2b33e4..402172c 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -280,8 +280,11 @@ static const struct spi_device_id m25p_ids[] = {
>  	{"mx25l3205d"},	{"mx25l3255e"},	{"mx25l6405d"},	{"mx25l12805d"},
>  	{"mx25l12855e"},{"mx25l25635e"},{"mx25l25655e"},{"mx66l51235l"},
>  	{"mx66l1g55g"},
> -	{"n25q064"},	{"n25q128a11"},	{"n25q128a13"},	{"n25q256a"},
> -	{"n25q512a"},	{"n25q512ax3"},	{"n25q00"},
> +	{"n25q064"},
> +	{"n25q128a11"},	{"n25q128a13"},
> +	{"n25q256a11"},	{"n25q256a13"},
> +	{"n25q512a11"},	{"n25q512a13"},	{"n25q512ax3"},
> +	{"n25q00"},

Even if I were to take your change (which I will not), please don't make
arbitrary whitespace changes.

>  	{"pm25lv512"},	{"pm25lv010"},	{"pm25lq032"},
>  	{"s25sl032p"},	{"s25sl064p"},	{"s25fl256s0"},	{"s25fl256s1"},
>  	{"s25fl512s"},	{"s70fl01gs"},	{"s25sl12800"},	{"s25sl12801"},

Brian
