Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X6cl8-0007IG-7I
 for linux-mtd@lists.infradead.org; Mon, 14 Jul 2014 09:41:23 +0000
Message-ID: <53C3A576.70305@huawei.com>
Date: Mon, 14 Jul 2014 17:40:06 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: =?UTF-8?B?546L5LiB?= <walklook@gmail.com>
Subject: Re: ubifs issue about xattr node when replay journal
References: <CAEGnBBSC=k5kkQYkLn37Q8KLLC+n43KiNr9ZZ-8NPJaGkGf0Qg@mail.gmail.com>
In-Reply-To: <CAEGnBBSC=k5kkQYkLn37Q8KLLC+n43KiNr9ZZ-8NPJaGkGf0Qg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Wang,

I have researched into the code but I still have some problems:

1) What's your kernel version?
2) Is the mechanism of removing XENT_NODE as same as removing
   DATA_NODE?
3) Is the mechanism of removing XENT_NODE same on ubifs_removexattr()
   and ubifs_jnl_delete_inode().

On 2014/7/12 21:36, 王丁 wrote:
> Hi all,
> 
> Now we use xattr based on ubifs, and find some issues about it.
> Situation like that:
> 1.poweron ->2.create a file -> 3.set xattr -> 4.delete the file -> 5.power cut
> After several cycles with above steps, we can not boot up the device
> with the error below.
> 
> 
> Analysis:
> when delete a file, ubifs will remove the xent node from tnc, if gc
> happend, it will remove the xent node data from the GCed LEB because
> of it has been removed form tnc ,
> then if a power cut happen, the journal replay may also try to remove
> the related xattr node, the error occurred because of it has been
> GCed.
> 
> 
> Now I run commit when ubifs_jnl_delete_inode called, and it's OK.
> Does anyone have a better way for the issue?
>  

Can you draw a figure of this race? According to your description,
I think the race is removing XENT_NODE twice. Is that true?

> 
> diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
> index f755a24..eba555e 100755
> --- a/fs/ubifs/journal.c
> +++ b/fs/ubifs/journal.c
> @@ -900,6 +900,9 @@ int ubifs_jnl_delete_inode(struct ubifs_info *c,
> const struct inode *inode)
>         else
>                 ubifs_delete_orphan(c, inode->i_ino);
>         up_read(&c->commit_sem);
> +
> +       ubifs_run_commit(c);
> +
>         return err;
> }

Run commit after each deletion is not a good choice and I think this
fix is just decreasing the rate of error happening.

Let's find out a better solution.

Thanks,

Hu
