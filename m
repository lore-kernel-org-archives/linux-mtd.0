Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XY2Y9-00064P-IT
 for linux-mtd@lists.infradead.org; Sun, 28 Sep 2014 00:41:18 +0000
Received: by mail-pa0-f41.google.com with SMTP id fa1so7075022pad.14
 for <linux-mtd@lists.infradead.org>; Sat, 27 Sep 2014 17:40:56 -0700 (PDT)
Date: Sat, 27 Sep 2014 17:40:52 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Subject: Re: [PATCH] mtdtest: Check bbt at index of (eb + 1) when we access 2
 EBs.
Message-ID: <20140928004052.GQ7362@norris-Latitude-E6410>
References: <1408328879-22771-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1408328879-22771-1-git-send-email-yangds.fnst@cn.fujitsu.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, akinobu.mita@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 18, 2014 at 10:27:59AM +0800, Dongsheng Yang wrote:
> When we want to access 2 eraseblocks, we need to make sure the
> two eraseblocks both are not bad.
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
>  drivers/mtd/tests/stresstest.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/tests/stresstest.c b/drivers/mtd/tests/stresstest.c
> index c9d42cc..076d409 100644
> --- a/drivers/mtd/tests/stresstest.c
> +++ b/drivers/mtd/tests/stresstest.c
> @@ -60,7 +60,7 @@ again:
>  	eb = prandom_u32();
>  	/* Read or write up 2 eraseblocks at a time - hence 'ebcnt - 1' */
>  	eb %= (ebcnt - 1);
> -	if (bbt[eb])
> +	if (bbt[eb] || bbt[eb + 1])

Was this change actually needed? Did you see some kind of test failure
without it?

>From what I can see, stresstest.c already handles the second block just
fine; it skips the block with code like this:

static int do_read(void)
{
...
        if (bbt[eb + 1]) {
                if (offs >= mtd->erasesize)
                        offs -= mtd->erasesize;
                if (offs + len > mtd->erasesize)
                        len = mtd->erasesize - offs;
        }
...
}

and similar in do_write().

Plus, your patch actually skips *any* block where the subsequent block
is bad. That is not ideal, as it skews the randomness.

So unless I'm missing something, I will not take this patch.

>  		goto again;
>  	return eb;
>  }

Regards,
Brian
