Subject: Re: [PATCH 4/4] [MTD] nandsim: add option to use a file to cache pages
From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
In-Reply-To: <483FF983.9050305@nokia.com>
References: <483FF983.9050305@nokia.com>
Content-Type: text/plain
Date: Wed, 04 Jun 2008 17:48:28 +0100
Message-Id: <1212598108.32207.128.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-05-30 at 15:56 +0300, Adrian Hunter wrote:
> 
>  static int alloc_device(struct nandsim *ns)
>  {
> -       int i;
> +       struct file *cfile;
> +       int i, err;
> +
> +       if (cache_file) {
> +               cfile = filp_open(cache_file, O_CREAT | O_RDWR | O_LARGEFILE, 0640);
> +               if (IS_ERR(cfile))
> +                       return PTR_ERR(cfile);
> +               if (!cfile->f_op || (!cfile->f_op->read && !cfile->f_op->aio_read)) {
> +                       NS_ERR("alloc_device: cache file not readable\n");
> +                       err = -EINVAL;
> +                       goto err_close;
> +               }

Would you care to post that to linux-kernel@vger.kernel.org and see if
it passes muster?

-- 
dwmw2
