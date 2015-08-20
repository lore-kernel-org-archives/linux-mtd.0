Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSGBX-0002C1-LA
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 03:06:36 +0000
Message-ID: <55D542C5.6040500@cn.fujitsu.com>
Date: Thu, 20 Aug 2015 11:00:21 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
 <dedekind1@gmail.com>
Subject: Re: [PATCH 2/2] ubifs: Allow O_DIRECT
References: <1440016553-26481-1-git-send-email-richard@nod.at>
 <1440016553-26481-2-git-send-email-richard@nod.at>
In-Reply-To: <1440016553-26481-2-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/20/2015 04:35 AM, Richard Weinberger wrote:
> Currently UBIFS does not support direct IO, but some applications
> blindly use the O_DIRECT flag.
> Instead of failing upon open() we can do better and fall back
> to buffered IO.

Hmmmm, to be honest, I am not sure we have to do it as Dave
suggested. I think that's just a work-around for current fstests.

IMHO, perform a buffered IO when user request direct IO without
any warning sounds not a good idea. Maybe adding a warning would
make it better.

I think we need more discussion about AIO&DIO in ubifs, and actually
I have a plan for it. But I have not listed the all cons and pros of
it so far.

Artem, what's your opinion?

Yang
>
> Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> Cc: dedekind1@gmail.com
> Suggested-by: Dave Chinner <david@fromorbit.com>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>   fs/ubifs/file.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
> index a3dfe2a..a61fe86 100644
> --- a/fs/ubifs/file.c
> +++ b/fs/ubifs/file.c
> @@ -1540,6 +1540,15 @@ static int ubifs_file_mmap(struct file *file, struct vm_area_struct *vma)
>   	return 0;
>   }
>
> +/*
> + * For now fall back to buffered IO.
> + */
> +static ssize_t ubifs_direct_IO(struct kiocb *iocb, struct iov_iter *iter,
> +				   loff_t offset)
> +{
> +	return 0;
> +}
> +
>   const struct address_space_operations ubifs_file_address_operations = {
>   	.readpage       = ubifs_readpage,
>   	.writepage      = ubifs_writepage,
> @@ -1548,6 +1557,7 @@ const struct address_space_operations ubifs_file_address_operations = {
>   	.invalidatepage = ubifs_invalidatepage,
>   	.set_page_dirty = ubifs_set_page_dirty,
>   	.releasepage    = ubifs_releasepage,
> +	.direct_IO	= ubifs_direct_IO,
>   };
>
>   const struct inode_operations ubifs_file_inode_operations = {
>
