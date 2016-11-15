Received: from mail-pf0-x22b.google.com ([2607:f8b0:400e:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6iWb-0004Bj-5D
 for linux-mtd@lists.infradead.org; Tue, 15 Nov 2016 18:32:06 +0000
Received: by mail-pf0-x22b.google.com with SMTP id c4so25546385pfb.1
 for <linux-mtd@lists.infradead.org>; Tue, 15 Nov 2016 10:31:44 -0800 (PST)
Date: Tue, 15 Nov 2016 10:31:40 -0800
From: Eric Biggers <ebiggers@google.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dedekind1@gmail.com,
 adrian.hunter@intel.com, tytso@mit.edu, jaegeuk@kernel.org,
 david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, mhalcrow@google.com, hch@infradead.org
Subject: Re: [PATCH 03/29] fscrypt: Enable partial page encryption
Message-ID: <20161115183140.GC127180@google.com>
References: <1479072072-6844-1-git-send-email-richard@nod.at>
 <1479072072-6844-4-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1479072072-6844-4-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 13, 2016 at 10:20:46PM +0100, Richard Weinberger wrote:
> From: David Gstir <david@sigma-star.at>
> 
> Not all filesystems work on full pages, thus we should allow them to
> hand partial pages to fscrypt for en/decryption.
> 
> Signed-off-by: David Gstir <david@sigma-star.at>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  fs/crypto/crypto.c       | 42 ++++++++++++++++++++++++++----------------
>  fs/ext4/inode.c          |  6 ++++--
>  fs/ext4/page-io.c        |  2 +-
>  fs/f2fs/data.c           |  2 ++
>  include/linux/fscrypto.h | 16 +++++++++++-----
>  5 files changed, 44 insertions(+), 24 deletions(-)
> 
> diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
> index 222a70520565..e170aa05011d 100644
> --- a/fs/crypto/crypto.c
> +++ b/fs/crypto/crypto.c
> @@ -149,6 +149,7 @@ typedef enum {
>  static int do_page_crypto(struct inode *inode,
>  			fscrypt_direction_t rw, pgoff_t index,
>  			struct page *src_page, struct page *dest_page,
> +			unsigned int src_len, unsigned int src_offset,
>  			gfp_t gfp_flags)

The naming of 'src_len' and 'src_offset', and 'plaintext_len' and
'plaintext_offset' below, is misleading because the length and offset actually
apply to the destination too.  Shouldn't they be 'len' and 'offset', or 'len'
and 'offs' like fscrypt_decrypt_page()?

I'm also a little concerned that users will mix up the src_len and src_offset
arguments and end up "encrypting" 0 bytes at offset PAGE_SIZE.  Adding a
'BUG_ON(len == 0)' may be appropriate.

>  /**
>   * fscypt_encrypt_page() - Encrypts a page
> - * @inode:          The inode for which the encryption should take place
> - * @plaintext_page: The page to encrypt. Must be locked.
> - * @gfp_flags:      The gfp flag for memory allocation
> + * @inode:            The inode for which the encryption should take place
> + * @plaintext_page:   The page to encrypt. Must be locked.
> + * @plaintext_len:    Length of plaintext within page
> + * @plaintext_offset: Offset of plaintext within page
> + * @gfp_flags:        The gfp flag for memory allocation
>   *
>   * Encrypts plaintext_page using the ctx encryption context. If
>   * the filesystem supports it, encryption is performed in-place, otherwise a
> @@ -229,13 +232,17 @@ static struct page *alloc_bounce_page(struct fscrypt_ctx *ctx, gfp_t gfp_flags)
>   * error value or NULL.
>   */
>  struct page *fscrypt_encrypt_page(struct inode *inode,
> -				struct page *plaintext_page, gfp_t gfp_flags)
> +				struct page *plaintext_page,
> +				unsigned int plaintext_len,
> +				unsigned int plaintext_offset,
> +				gfp_t gfp_flags)
> +
>  {
>  	struct fscrypt_ctx *ctx;
>  	struct page *ciphertext_page = plaintext_page;
>  	int err;
>  
> -	BUG_ON(!PageLocked(plaintext_page));
> +	BUG_ON(plaintext_len % FS_CRYPTO_BLOCK_SIZE != 0);

What is going on with PageLocked()?  Is it still a requirement?  If not the
function comment needs to be fixed.

> -int fscrypt_decrypt_page(struct inode *inode, struct page *page)
> +int fscrypt_decrypt_page(struct inode *inode, struct page *page,
> +			unsigned int len, unsigned int offs)
>  {
> -	BUG_ON(!PageLocked(page));
> -
> -	return do_page_crypto(inode, FS_DECRYPT, page->index, page, page,
> +	return do_page_crypto(inode, FS_DECRYPT, page->index, page, page, len, offs,
>  			GFP_NOFS);
>  }

Same with PageLocked().  Is it still a requirement?  If not the function comment
needs to be fixed.

Eric
