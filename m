Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCkF9-0005nj-D6
 for linux-mtd@lists.infradead.org; Fri, 02 Dec 2016 09:35:00 +0000
Received: by mail-lf0-x243.google.com with SMTP id 98so21421491lfs.0
 for <linux-mtd@lists.infradead.org>; Fri, 02 Dec 2016 01:34:38 -0800 (PST)
Date: Fri, 2 Dec 2016 10:28:40 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, david@sigma-star.at, tytso@mit.edu,
 dedekind1@gmail.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 adilger.kernel@dilger.ca, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org
Subject: Re: [PATCH 4/6] ubifs: Maintain a parent pointer
Message-ID: <20161202092840.i67lhgglzlnugwpd@gmail.com>
References: <1480629741-18375-1-git-send-email-richard@nod.at>
 <1480629741-18375-5-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1480629741-18375-5-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 01, 2016 at 11:02:19PM +0100, Richard Weinberger wrote:
>  
> +	if (new_dir != old_dir) {
> +		fst_inode_ui->parent_inum = new_dir->i_ino;
> +		snd_inode_ui->parent_inum = old_dir->i_ino;
> +	}
> +
>  	if (old_dir != new_dir) {
>  		if (S_ISDIR(fst_inode->i_mode) && !S_ISDIR(snd_inode->i_mode)) {
>  			inc_nlink(new_dir);

Insignificant thing, but use the existing if-statment instead?

Cheers,
Marcus Folkesson
