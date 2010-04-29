Subject: Re: [PATCH] mtd: cfi_cmdset_0002: Fix trivial merge conflict
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <02d08adf6882611e6c0121481e70a61d20a10acf@localhost.localdomain>
References: <02d08adf6882611e6c0121481e70a61d20a10acf@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 29 Apr 2010 08:34:22 +0300
Message-ID: <1272519262.7750.66.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-04-28 at 17:26 -0700, Kevin Cernekee wrote:
> Stefani Seibold's patch changed chip->mutex, once a spinlock, into a
> mutex.  This patch applies the same change to cfi_amdstd_reset(), part
> of the new reboot notifier code.
> 
> Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
> index d356827..c16b8ce 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -1945,7 +1945,7 @@ static int cfi_amdstd_reset(struct mtd_info *mtd)
>  
>  		chip = &cfi->chips[i];
>  
> -		spin_lock(chip->mutex);
> +		mutex_lock(&chip->mutex);
>  
>  		ret = get_chip(map, chip, chip->start, FL_SHUTDOWN);
>  		if (!ret) {
> @@ -1954,7 +1954,7 @@ static int cfi_amdstd_reset(struct mtd_info *mtd)
>  			put_chip(map, chip, chip->start);
>  		}
>  
> -		spin_unlock(chip->mutex);
> +		mutex_unlock(&chip->mutex);
>  	}
>  
>  	return 0;

Could you instead resend one patch which is a merge of this one and the
old one, please?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
