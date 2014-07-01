Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1xKJ-0002e0-DX
 for linux-mtd@lists.infradead.org; Tue, 01 Jul 2014 12:38:23 +0000
Message-ID: <1404218279.6841.43.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 4/4] UBIFS: Remove useless statements
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Tue, 01 Jul 2014 15:37:59 +0300
In-Reply-To: <5397C22C.70305@huawei.com>
References: <5397C0E7.9070602@huawei.com> <5397C22C.70305@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-06-11 at 10:42 +0800, hujianyang wrote:
> diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
> index 0e045e7..f68e088 100644
> --- a/fs/ubifs/journal.c
> +++ b/fs/ubifs/journal.c
> @@ -389,6 +389,9 @@ out:
>  		ubifs_dump_budg(c, &c->bi);
>  		ubifs_dump_lprops(c);
>  		cmt_retries = dbg_check_lprops(c);
> +		if (cmt_retries)
> +			ubifs_err("fail to check lprops, error %d",
> +				  cmt_retries);
>  		up_write(&c->commit_sem);

The general approach we took in UBIFS is that the function prints about
its own problems itself. We tend to avoid not make calling function
print an error message for the called function.

Please, add an error message to 'dbg_check_lprops()' instead.

I've dropped this change. The other ones look OK, so I applied them.

Thanks!

-- 
Best Regards,
Artem Bityutskiy
