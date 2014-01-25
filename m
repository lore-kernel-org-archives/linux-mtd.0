Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6vwo-0006C6-Nq
 for linux-mtd@lists.infradead.org; Sat, 25 Jan 2014 05:38:27 +0000
Date: Sat, 25 Jan 2014 02:38:17 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Fabian Frederick <fabf@skynet.be>
Subject: Re: [PATCH 2/4] mtd: block2mtd: Add mutex_destroy
Message-ID: <20140125053816.GB24609@localhost>
References: <20140123205147.943d63fecf3140aa6cc76994@skynet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140123205147.943d63fecf3140aa6cc76994@skynet.be>
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

On Thu, Jan 23, 2014 at 08:51:47PM +0100, Fabian Frederick wrote:
> mutex_destroy added on each device in block2mtd_exit and add_device failure
> 
> Signed-off-by: Fabian Frederick <fabf@skynet.be>
> ---
>  drivers/mtd/devices/block2mtd.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
> index 0efee5b..8071596 100644
> --- a/drivers/mtd/devices/block2mtd.c
> +++ b/drivers/mtd/devices/block2mtd.c
> @@ -240,14 +240,14 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size)
>  
>  	if (IS_ERR(bdev)) {
>  		pr_err("error: cannot open device %s\n", devname);
> -		goto devinit_err;
> +		goto devinit_err1;

Ah, this one commit looks good, but the naming of the labels doesn't.

Instead, you should use a name describing what the error path does,
such as "err_free_block2mtd" and "err_destroy_mutex" or something like that.

We have a language full of words with meaning, so it's shame to use
dumb numbers :-)
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
