Subject: Re: [PATCH v4] mtd: Do not corrupt backing device of device node inode
From: David Woodhouse <dwmw2@infradead.org>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
In-Reply-To: <1273074054-11849-1-git-send-email-kirill@shutemov.name>
References: <1273074054-11849-1-git-send-email-kirill@shutemov.name>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 14 May 2010 02:04:34 +0100
Message-ID: <1273799074.9999.653.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Jan Kara <jack@suse.cz>, Artem Bityutskiy <dedekind1@gmail.com>,
	linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
	Alexander Shishkin <virtuoso@slind.org>, linux-mtd@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel@vger.kernel.org, stable@kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-05-05 at 18:40 +0300, Kirill A. Shutemov wrote:
> We cannot modify file->f_mapping->backing_dev_info, because it will corrupt
> backing device of device node inode, since file->f_mapping is equal to
> inode->i_mapping (see __dentry_open() in fs/open.c).
> 
> Let's introduce separate inode for MTD device with appropriate backing
> device.

I hate the fact that we have to do this -- is it really the only option?

Is it _just_ for the backing_device_info? Can't that be done
differently?

> @@ -85,11 +88,27 @@ static int mtd_open(struct inode *inode, struct file *file)
>  		goto out;
>  	}
>  
> -	if (mtd->backing_dev_info)
> -		file->f_mapping->backing_dev_info = mtd->backing_dev_info;
> +	if (!mtd->inode) {
> +		mtd->inode = new_inode(mtd_inode_mnt->mnt_sb);

I believe that would be a race condition, if it wasn't for the BKL.

And what happens when you close the chardevice and call iput() on the
inode so it's destroyed, and then you re-open the device? You never set
mtd->inode = NULL, so won't it now try to igrab a stale pointer?

You won't have seen this in your testing unless you made it prune the
icache between the close and open calls.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
