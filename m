Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gZvnd-0008Sy-6O
 for linux-mtd@lists.infradead.org; Thu, 20 Dec 2018 10:43:31 +0000
Subject: Re: [PATCH] jffs2: Fix integer underflow in jffs2_rtime_compress
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
CC: <dwmw2@infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
References: <20181215162350.12489-1-richard@nod.at>
From: Hou Tao <houtao1@huawei.com>
Message-ID: <cae86ca1-91f9-6728-df64-40580145220d@huawei.com>
Date: Thu, 20 Dec 2018 18:43:08 +0800
MIME-Version: 1.0
In-Reply-To: <20181215162350.12489-1-richard@nod.at>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 2018/12/16 0:23, Richard Weinberger wrote:
> The rtime compressor assumes that at least two bytes are
> compressed.
> If we try to compress just one byte, the loop condition will
> wrap around and an out-of-bounds write happens.
> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  fs/jffs2/compr_rtime.c | 3 +++
>  1 file changed, 3 insertions(+)
> It seems that it doesn't incur any harm because the minimal allocated
size will be 8-bytes and jffs2_rtime_compress() will write 2-bytes into
the allocated buffer.

> diff --git a/fs/jffs2/compr_rtime.c b/fs/jffs2/compr_rtime.c
> index 406d9cc84ba8..cbf700001fc9 100644
> --- a/fs/jffs2/compr_rtime.c
> +++ b/fs/jffs2/compr_rtime.c
> @@ -39,6 +39,9 @@ static int jffs2_rtime_compress(unsigned char *data_in,
>  
>  	memset(positions,0,sizeof(positions));
>  
> +	if (*dstlen < 2)
> +		return -1;
> +
>  	while (pos < (*sourcelen) && outpos <= (*dstlen)-2) {
>  		int backpos, runlen=0;
>  		unsigned char value;
> 
