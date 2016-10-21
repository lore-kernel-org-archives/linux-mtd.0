Received: from mail-pf0-x233.google.com ([2607:f8b0:400e:c00::233])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxeX1-0007u3-Qh
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 18:27:04 +0000
Received: by mail-pf0-x233.google.com with SMTP id s8so60939164pfj.2
 for <linux-mtd@lists.infradead.org>; Fri, 21 Oct 2016 11:26:03 -0700 (PDT)
Date: Fri, 21 Oct 2016 11:25:59 -0700
From: Eric Biggers <ebiggers@google.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dedekind1@gmail.com,
 adrian.hunter@intel.com, tytso@mit.edu, jaegeuk@kernel.org,
 david@sigma-star.at, wd@denx.de, sbabic@denx.de, dengler@linutronix.de
Subject: Re: [PATCH 15/26] ubifs: Implement encrypt/decrypt for all IO
Message-ID: <20161021182559.GB90712@google.com>
References: <1477054121-10198-1-git-send-email-richard@nod.at>
 <1477054121-10198-16-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1477054121-10198-16-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 21, 2016 at 02:48:30PM +0200, Richard Weinberger wrote:
> +
> +	if (ubifs_crypt_is_encrypted(inode)) {
> +		int clen = le16_to_cpu(dn->compr_size);
> +
> +		if (clen <= 0 || clen > UBIFS_BLOCK_SIZE || clen > dlen)
> +			goto dump;
> +
> +		ubifs_assert(dlen <= UBIFS_BLOCK_SIZE);
> +		err = fscrypt_decrypt_buffer(inode, &dn->data, &dn->data, dlen, block, GFP_NOFS);
> +		if (err) {
> +			ubifs_err(c, "fscrypt_decrypt_buffer failed: %i", err);
> +			return err;
> +		}
> +
> +		ubifs_assert(clen <= dlen);
> +		dlen = clen;
> +	}
> +

There are several code blocks like this, calling either fscrypt_decrypt_buffer()
or fscrypt_encrypt_buffer(), which seem to be mostly duplicated.  Is it possible
to refactor them into helper functions?  There are also some lines well over 80
characters.

Eric
