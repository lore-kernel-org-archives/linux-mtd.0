Received: from mail-pg0-x230.google.com ([2607:f8b0:400e:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6iGQ-0002tK-OQ
 for linux-mtd@lists.infradead.org; Tue, 15 Nov 2016 18:15:23 +0000
Received: by mail-pg0-x230.google.com with SMTP id 3so69300292pgd.0
 for <linux-mtd@lists.infradead.org>; Tue, 15 Nov 2016 10:15:00 -0800 (PST)
Date: Tue, 15 Nov 2016 10:14:55 -0800
From: Eric Biggers <ebiggers@google.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dedekind1@gmail.com,
 adrian.hunter@intel.com, tytso@mit.edu, jaegeuk@kernel.org,
 david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, mhalcrow@google.com, hch@infradead.org
Subject: Re: [PATCH 01/29] fscrypt: Add in-place encryption mode
Message-ID: <20161115181455.GA127180@google.com>
References: <1479072072-6844-1-git-send-email-richard@nod.at>
 <1479072072-6844-2-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1479072072-6844-2-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Sun, Nov 13, 2016 at 10:20:44PM +0100, Richard Weinberger wrote:
> From: David Gstir <david@sigma-star.at>
> 
> ext4 and f2fs require a bounce page when encrypting pages. However, not
> all filesystems will need that (eg. UBIFS). This is handled via a
> flag on fscrypt_operations where a fs implementation can select in-place
> encryption over using a bounce page (which is the default).
> 
> Signed-off-by: David Gstir <david@sigma-star.at>
> Signed-off-by: Richard Weinberger <richard@nod.at>

The comment for fscrypt_encrypt_page() still says the following:

 * Called on the page write path.  The caller must call
 * fscrypt_restore_control_page() on the returned ciphertext page to
 * release the bounce buffer and the encryption context.

It seems this isn't correct anymore.  It also looks like the fscrypt_context
never gets released in the case where the page is encrypted in-place.

Additionally, after this change the name of the flag FS_WRITE_PATH_FL is
misleading, since it now really indicates the presence of a bounce buffer rather
than the "write path".

Eric
