Received: from mail-pf0-x234.google.com ([2607:f8b0:400e:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6iiQ-0000bd-T5
 for linux-mtd@lists.infradead.org; Tue, 15 Nov 2016 18:44:19 +0000
Received: by mail-pf0-x234.google.com with SMTP id d2so37558711pfd.0
 for <linux-mtd@lists.infradead.org>; Tue, 15 Nov 2016 10:43:58 -0800 (PST)
Date: Tue, 15 Nov 2016 10:43:54 -0800
From: Eric Biggers <ebiggers@google.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dedekind1@gmail.com,
 adrian.hunter@intel.com, tytso@mit.edu, jaegeuk@kernel.org,
 david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, mhalcrow@google.com, hch@infradead.org
Subject: Re: [PATCH 05/29] fscrypt: Let fs select encryption index/tweak
Message-ID: <20161115184354.GD127180@google.com>
References: <1479072072-6844-1-git-send-email-richard@nod.at>
 <1479072072-6844-6-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1479072072-6844-6-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 13, 2016 at 10:20:48PM +0100, Richard Weinberger wrote:
> From: David Gstir <david@sigma-star.at>
> 
> Avoid re-use of page index as tweak for AES-XTS when multiple parts of
> same page are encrypted. This will happen on multiple (partial) calls of
> fscrypt_encrypt_page on same page.
> page->index is only valid for writeback pages.
> 
> Signed-off-by: David Gstir <david@sigma-star.at>
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
>  fs/crypto/crypto.c       | 11 +++++++----
>  fs/ext4/inode.c          |  4 ++--
>  fs/ext4/page-io.c        |  3 ++-
>  fs/f2fs/data.c           |  5 +++--
>  include/linux/fscrypto.h |  9 +++++----
>  5 files changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
> index f5c5e84ea9db..b6029785714c 100644
> --- a/fs/crypto/crypto.c
> +++ b/fs/crypto/crypto.c
> @@ -218,6 +218,8 @@ static struct page *alloc_bounce_page(struct fscrypt_ctx *ctx, gfp_t gfp_flags)
>   * @plaintext_page:   The page to encrypt. Must be locked.
>   * @plaintext_len:    Length of plaintext within page
>   * @plaintext_offset: Offset of plaintext within page
> + * @index:            Index for encryption. This is mainly the page index, but
> + *                    but might be different for multiple calls on same page.

Index reuse (IV reuse) has implications for confidentiality of the encrypted
data.  Really the index *MUST* not be reused unless there is no alternative.
The comment should express this, not just suggest that the index "might" be
different.

>   * @gfp_flags:        The gfp flag for memory allocation
>   *
>   * Encrypts plaintext_page using the ctx encryption context. If
> @@ -235,7 +237,7 @@ struct page *fscrypt_encrypt_page(const struct inode *inode,
>  				struct page *plaintext_page,
>  				unsigned int plaintext_len,
>  				unsigned int plaintext_offset,
> -				gfp_t gfp_flags)
> +				pgoff_t index, gfp_t gfp_flags)

Now that 'index' is no longer necessarily the page offset, perhaps it should
have type 'u64' instead of 'pgoff_t'?

Also, if the intent is just that the 'index' represent the data's offset in
filesystem blocks rather than in pages, then perhaps it should be documented as
such.  (This would be correct for ext4 and f2fs; they just happen to only
support encryption with block_size = PAGE_SIZE currently.)

Eric
