Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1coRao-0007E1-LG
 for linux-mtd@lists.infradead.org; Thu, 16 Mar 2017 09:21:12 +0000
Date: Thu, 16 Mar 2017 10:20:49 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: chenwy <chenwy-fnst@cn.fujitsu.com>
Cc: <linux-mtd@lists.infradead.org>, fnstml-fjl@cn.fujitsu.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: mtdram: check offs and len in mtdram->point
 madram->unpoint, mtdram->write and mtdram->read
Message-ID: <20170316102049.4bcc2b7d@bbrezillon>
In-Reply-To: <20170303073100.27590-1-chenwy-fnst@cn.fujitsu.com>
References: <20170303073100.27590-1-chenwy-fnst@cn.fujitsu.com>
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

Hi Chen,

Can you use something shorter for your commit title. Something like

"mtd: mtdram: check offs and len where appropriate"

On Fri, 3 Mar 2017 15:31:00 +0800
chenwy <chenwy-fnst@cn.fujitsu.com> wrote:

>     We should prevent user to erasing mtd device with

			     ^ from

>     an unaligned offset or length.

Why are you putting 5 spaces before each line of your commit message?

> 
> Signed-off-by: Chen  Wenyong <chenwy-fnst@cn.fujitsu.com>
> ---
>  drivers/mtd/devices/mtdram.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
> index cbd8547..b0468c1 100644
> --- a/drivers/mtd/devices/mtdram.c
> +++ b/drivers/mtd/devices/mtdram.c
> @@ -67,6 +67,8 @@ static int ram_erase(struct mtd_info *mtd, struct erase_info *instr)
>  static int ram_point(struct mtd_info *mtd, loff_t from, size_t len,
>  		size_t *retlen, void **virt, resource_size_t *phys)
>  {
> +	if (check_offs_len(mtd, from, len))
> +		return -EINVAL;

Add an empty line.

>  	*virt = mtd->priv + from;
>  	*retlen = len;
>  	return 0;
> @@ -74,6 +76,8 @@ static int ram_point(struct mtd_info *mtd, loff_t from, size_t len,
>  
>  static int ram_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
>  {
> +	if (check_offs_len(mtd, from, len))
> +		return -EINVAL;

Ditto.

>  	return 0;
>  }
>  
> @@ -93,6 +97,8 @@ static unsigned long ram_get_unmapped_area(struct mtd_info *mtd,
>  static int ram_read(struct mtd_info *mtd, loff_t from, size_t len,
>  		size_t *retlen, u_char *buf)
>  {
> +	if (check_offs_len(mtd, from, len))
> +		return -EINVAL;

Ditto.

>  	memcpy(buf, mtd->priv + from, len);
>  	*retlen = len;
>  	return 0;
> @@ -101,6 +107,8 @@ static int ram_read(struct mtd_info *mtd, loff_t from, size_t len,
>  static int ram_write(struct mtd_info *mtd, loff_t to, size_t len,
>  		size_t *retlen, const u_char *buf)
>  {
> +	if (check_offs_len(mtd, to, len))
> +		return -EINVAL;

Ditto.

>  	memcpy((char *)mtd->priv + to, buf, len);
>  	*retlen = len;
>  	return 0;
