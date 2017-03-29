Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ctFNl-0007KV-Vn
 for linux-mtd@lists.infradead.org; Wed, 29 Mar 2017 15:19:37 +0000
Date: Wed, 29 Mar 2017 17:19:12 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: chenwy <chenwy-fnst@cn.fujitsu.com>
Cc: <linux-mtd@lists.infradead.org>, fnstml-fjl@cn.fujitsu.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtdram: check offs and len where appropriate
Message-ID: <20170329171912.52327b15@bbrezillon>
In-Reply-To: <20170317022939.5511-1-chenwy-fnst@cn.fujitsu.com>
References: <20170317022939.5511-1-chenwy-fnst@cn.fujitsu.com>
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

On Fri, 17 Mar 2017 10:29:39 +0800
chenwy <chenwy-fnst@cn.fujitsu.com> wrote:

> We should prevent user to operating mtd device with
> an illegal offset or length.

I realize that all the tests you do here are already done in mtdcore.c.
If one is missing, please patch mtdcore.c instead.

Thanks,

Boris

> 
> Signed-off-by: Chen Wenyong <chenwy-fnst@cn.fujitsu.com>
> ---
>  drivers/mtd/devices/mtdram.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
> index cbd8547..83e1603 100644
> --- a/drivers/mtd/devices/mtdram.c
> +++ b/drivers/mtd/devices/mtdram.c
> @@ -58,6 +58,10 @@ static int ram_erase(struct mtd_info *mtd, struct erase_info *instr)
>  {
>  	if (check_offs_len(mtd, instr->addr, instr->len))
>  		return -EINVAL;
> +	if (mtd->size < (instr->len + instr->addr) || instr->addr < 0
> +		       	|| instr->len < 0)
> +		return -EINVAL;
> +
>  	memset((char *)mtd->priv + instr->addr, 0xff, instr->len);
>  	instr->state = MTD_ERASE_DONE;
>  	mtd_erase_callback(instr);
> @@ -67,6 +71,9 @@ static int ram_erase(struct mtd_info *mtd, struct erase_info *instr)
>  static int ram_point(struct mtd_info *mtd, loff_t from, size_t len,
>  		size_t *retlen, void **virt, resource_size_t *phys)
>  {
> +	if (mtd->size < (len + from) || from < 0 || len < 0)
> +		return -EINVAL;
> +
>  	*virt = mtd->priv + from;
>  	*retlen = len;
>  	return 0;
> @@ -74,6 +81,9 @@ static int ram_point(struct mtd_info *mtd, loff_t from, size_t len,
>  
>  static int ram_unpoint(struct mtd_info *mtd, loff_t from, size_t len)
>  {
> +	if (mtd->size < (len + from) || from < 0 || len < 0)
> +		return -EINVAL;
> +
>  	return 0;
>  }
>  
> @@ -93,6 +103,9 @@ static unsigned long ram_get_unmapped_area(struct mtd_info *mtd,
>  static int ram_read(struct mtd_info *mtd, loff_t from, size_t len,
>  		size_t *retlen, u_char *buf)
>  {
> +	if (mtd->size < (len + from) || from < 0 || len < 0)
> +		return -EINVAL;
> +
>  	memcpy(buf, mtd->priv + from, len);
>  	*retlen = len;
>  	return 0;
> @@ -101,6 +114,9 @@ static int ram_read(struct mtd_info *mtd, loff_t from, size_t len,
>  static int ram_write(struct mtd_info *mtd, loff_t to, size_t len,
>  		size_t *retlen, const u_char *buf)
>  {
> +	if (mtd->size < (len + to) || to < 0 || len < 0)
> +		return -EINVAL;
> +
>  	memcpy((char *)mtd->priv + to, buf, len);
>  	*retlen = len;
>  	return 0;
