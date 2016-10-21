Received: from mail-pf0-x230.google.com ([2607:f8b0:400e:c00::230])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxemv-0008VM-W5
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 18:43:31 +0000
Received: by mail-pf0-x230.google.com with SMTP id s8so61195350pfj.2
 for <linux-mtd@lists.infradead.org>; Fri, 21 Oct 2016 11:42:35 -0700 (PDT)
Date: Fri, 21 Oct 2016 11:42:31 -0700
From: Eric Biggers <ebiggers@google.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dedekind1@gmail.com,
 adrian.hunter@intel.com, tytso@mit.edu, jaegeuk@kernel.org,
 david@sigma-star.at, wd@denx.de, sbabic@denx.de, dengler@linutronix.de
Subject: Re: [PATCH 20/26] ubifs: Add support for encrypted symlinks
Message-ID: <20161021184231.GD90712@google.com>
References: <1477054121-10198-1-git-send-email-richard@nod.at>
 <1477054121-10198-21-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1477054121-10198-21-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 21, 2016 at 02:48:35PM +0200, Richard Weinberger wrote:
> +
> +	if (!dentry)
> +		return ERR_PTR(-ECHILD);
> +
> +	if (ubifs_crypt_is_encrypted(inode)) {
> +		err = fscrypt_get_encryption_info(inode);
> +		if (err)
> +			return ERR_PTR(err);
> +	} else
> +		return ui->data;
> +

This will make path lookups drop out of RCU mode when an unencrypted symlink is
followed.  This can be avoided by checking for unencrypted symlinks first:

	if (!ubifs_crypt_is_encrypted(inode))
		return ui->data;

	if (!dentry)
		return ERR_PTR(-ECHILD);

	err = fscrypt_get_encryption_info(inode);
	if (err)
		return ERR_PTR(err);

> +
> +	pstr.name[err] = '\0';
> +

In 4.9, fscrypt_fname_{disk_to_usr,usr_to_disk} return 0 instead of the output
length, so this will need to be changed to 'pstr.name[pstr.len] = '\0''.
