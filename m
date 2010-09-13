Subject: Re: [patch] mtd: sanity check input
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Dan Carpenter <error27@gmail.com>
In-Reply-To: <20100908193956.GB3463@bicker>
References: <20100908193956.GB3463@bicker>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 13 Sep 2010 11:53:43 +0300
Message-ID: <1284368023.27765.179.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	linux-mtd@lists.infradead.org, Ben Hutchings <bhutchings@solarflare.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-09-08 at 21:39 +0200, Dan Carpenter wrote:
> If "ur_idx" is wrong we could go past the end of the array.  The
> "ur_idx" comes from root so it's not a huge deal, but adding a sanity
> check makes the code more robust.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
> index a825002..9c00549 100644
> --- a/drivers/mtd/mtdchar.c
> +++ b/drivers/mtd/mtdchar.c
> @@ -513,6 +513,9 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
>  		if (get_user(ur_idx, &(ur->regionindex)))
>  			return -EFAULT;
>  
> +		if (ur_idx >= mtd->numeraseregions)
> +			return -EINVAL;
> +

Pushed to l2-mtd-2.6.git with my "Signed-off-by", thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
