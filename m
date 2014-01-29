Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8S0m-0004tU-CS
 for linux-mtd@lists.infradead.org; Wed, 29 Jan 2014 10:04:48 +0000
Date: Wed, 29 Jan 2014 07:04:25 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Fabian Frederick <fabf@skynet.be>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 3/4] mtd: block2mtd: check device size
Message-ID: <20140129100424.GA15271@localhost>
References: <20140123205331.03314c6f82f24a6bb4b8ef53@skynet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140123205331.03314c6f82f24a6bb4b8ef53@skynet.be>
Cc: joern@lazybastard.org, akpm@linux-foundation.org, rdunlap@infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Fabian,

I saw you sent a v2 for one of the patches on this series,
but maybe this is worth considering too.

On Thu, Jan 23, 2014 at 08:53:31PM +0100, Fabian Frederick wrote:
[..]
> -/* FIXME: ensure that mtd->size % erase_size == 0 */
>  static struct block2mtd_dev *add_device(char *devname, int erase_size)
>  {
>  	const fmode_t mode = FMODE_READ | FMODE_WRITE | FMODE_EXCL;
> @@ -250,6 +249,11 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size)
>  		goto devinit_err1;
>  	}
>  
> +	if ((long)dev->blkdev->bd_inode->i_size % erase_size) {
> +		pr_err("erasesize muse be a divisor of device size\n");
> +		goto devinit_err1;
> +	}
> +

Brian: What do you think?

Fabian: Have you tested this patch? Can you elaborate a bit more about
the effect it would have, compared to the current behavior?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
