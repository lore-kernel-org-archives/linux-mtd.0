Subject: Re: [PATCH] mtd: Do not corrupt backing device for inode
From: David Woodhouse <dwmw2@infradead.org>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
In-Reply-To: <1271863269-5423-1-git-send-email-kirill@shutemov.name>
References: <20100415172300.GF3561@quack.suse.cz>
	<1271863269-5423-1-git-send-email-kirill@shutemov.name>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 22 Apr 2010 12:08:55 +0100
Message-ID: <1271934535.11751.1550.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	David Howells <dhowells@redhat.com>,
	Alexander Shishkin <virtuoso@slind.org>, linux-mtd@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-04-21 at 18:21 +0300, Kirill A. Shutemov wrote:
> +		/*
> +		 * We cannot modify file->f_mapping->backing_dev_info directly,
> +		 * because it will corrupt backing device for inode, since
> +		 * inode->i_mapping is equal to file->f_mapping. So we have to
> +		 * copy f_mapping first.
> +		 */
> +		file->f_mapping = kmalloc(sizeof(*file->f_mapping), GFP_KERNEL);
> +		memcpy(file->f_mapping, inode->i_mapping,
> +				sizeof(*file->f_mapping));
>  		file->f_mapping->backing_dev_info = mtd->backing_dev_info;
> +	}

Ick. What about the rest of file->f_mapping? That'll still be inherited.

Jan pointed at drivers/char/raw.c as an example, but that doesn't do
anything as ugly as this -- that sets file->f_mapping to point at
bdev->bd_inode->i_mapping instead.

I suspect we should do something similar -- have an inode for the MTD
device, with a valid i_data of its own.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
