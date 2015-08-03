Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMMKd-0006w2-PJ
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 20:27:36 +0000
Subject: Re: [PATCH v2] ubifs: make ubifs_[get|set]xattr atomic
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, dedekind1@gmail.com
References: <55BABB80.9080406@cn.fujitsu.com>
 <1438305123-31675-1-git-send-email-yangds.fnst@cn.fujitsu.com>
Cc: linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <55BFCEA0.7080900@nod.at>
Date: Mon, 3 Aug 2015 22:27:12 +0200
MIME-Version: 1.0
In-Reply-To: <1438305123-31675-1-git-send-email-yangds.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 31.07.2015 um 03:12 schrieb Dongsheng Yang:
> This commit make the ubifs_[get|set]xattr protected by ui_mutex.
> 
> Originally, there is a possibility that ubifs_getxattr to get
> a wrong value.
> 
>     P1				    P2
> ----------			----------
> ubifs_getxattr			ubifs_setxattr
> 				   - kfree()
>    - memcpy()
> 				   - kmemdup()
> 
> Then ubifs_getxattr() would get a non-sense data. To solve this
> problem, this commit make the xattr of ubifs_inode updated in
> atomic.

so, ui->data needs protection?
The comment in fs/ubifs/ubifs.h does not mention ->data.
I'm asking because I want to make sure that ui_mutex is the correct lock to take.

> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
> 	-v2:
> 		Add more description in commit message
>  fs/ubifs/xattr.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
> index 96f3448..dec1afd 100644
> --- a/fs/ubifs/xattr.c
> +++ b/fs/ubifs/xattr.c
> @@ -208,6 +208,7 @@ static int change_xattr(struct ubifs_info *c, struct inode *host,
>  	if (err)
>  		return err;
>  
> +	mutex_lock(&ui->ui_mutex);
>  	kfree(ui->data);
>  	ui->data = kmemdup(value, size, GFP_NOFS);
>  	if (!ui->data) {
> @@ -216,6 +217,7 @@ static int change_xattr(struct ubifs_info *c, struct inode *host,
>  	}
>  	inode->i_size = ui->ui_size = size;
>  	ui->data_len = size;
> +	mutex_unlock(&ui->ui_mutex);

You also need a mutex_unlock(&ui->ui_mutex) under out_free, otherwise
the if (!ui->data) { branch will trigger a deadlock.

Thanks,
//richard
