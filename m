Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMtnr-0004Uk-3q
 for linux-mtd@lists.infradead.org; Wed, 05 Aug 2015 08:11:59 +0000
Message-ID: <1438762294.26877.14.camel@gmail.com>
Subject: Re: [PATCH v2 19/35] ubifs: budget for inode in ubifs_dirty_inode
 if necessary
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, viro@ZenIV.linux.org.uk,
 jack@suse.cz, richard.weinberger@gmail.com
Cc: linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Date: Wed, 05 Aug 2015 11:11:34 +0300
In-Reply-To: <1438235311-23788-20-git-send-email-yangds.fnst@cn.fujitsu.com>
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-20-git-send-email-yangds.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2015-07-30 at 13:48 +0800, Dongsheng Yang wrote:
> In ubifs, we have to do a budget for inode before marking
> it as dirty. But sometimes, we would call dirty_inode in vfs
> which will not do a budget for inode. In this case, we have
> to do a budget in ubifs_dirty_inode() by ourselvies.
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>

Could you please explain some more the problem you are trying to solve.
Locking looks confusing and broken. It looks like what you are
expressing is that the 'ui_mutex' is optional, and this smells fishy. 

>  static void ubifs_dirty_inode(struct inode *inode, int flags)
>  {
>          struct ubifs_inode *ui = ubifs_inode(inode);
> +	int locked = mutex_is_locked(&ui->ui_mutex);

Suppose another process has it locked, so 'locked' is set to 1 here.

> +	struct ubifs_info *c = inode->i_sb->s_fs_info;
> +	int ret = 0;
> +
> +	if (!locked)

So we skip this.
> +		mutex_lock(&ui->ui_mutex);

And if the other process has released the lock by this time, we do not
mind, right? Therefore, ui_mutex is "optional"?

> -	ubifs_assert(mutex_is_locked(&ui->ui_mutex));
>  	if (!ui->dirty) {
> +		if (!locked) {

And similar here, we do not run this code because 'locked' is 1.
> +			struct ubifs_budget_req req = { .dirtied_ino 
> = 1,
> +				   .dirtied_ino_d = ALIGN(ui
> ->data_len, 8) };
> +			ret = ubifs_budget_space(c, &req);
> +			if (ret)
> +				goto out;
> +		}

But the other process has already released it, and we do not mind?


Please, try to explain what you want to achieve some more. I am not
sure I understand the end goal.

Artem.
