Received: from mail-pf0-x22b.google.com ([2607:f8b0:400e:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6iKy-0005WS-0l
 for linux-mtd@lists.infradead.org; Tue, 15 Nov 2016 18:20:04 +0000
Received: by mail-pf0-x22b.google.com with SMTP id 189so37460321pfz.3
 for <linux-mtd@lists.infradead.org>; Tue, 15 Nov 2016 10:19:43 -0800 (PST)
Date: Tue, 15 Nov 2016 10:19:39 -0800
From: Eric Biggers <ebiggers@google.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dedekind1@gmail.com,
 adrian.hunter@intel.com, tytso@mit.edu, jaegeuk@kernel.org,
 david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, mhalcrow@google.com, hch@infradead.org
Subject: Re: [PATCH 02/29] fscrypt: Allow fscrypt_decrypt_page() to function
 with non-writeback pages
Message-ID: <20161115181939.GB127180@google.com>
References: <1479072072-6844-1-git-send-email-richard@nod.at>
 <1479072072-6844-3-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1479072072-6844-3-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 13, 2016 at 10:20:45PM +0100, Richard Weinberger wrote:
>  /**
>   * f2crypt_decrypt_page() - Decrypts a page in-place
> - * @page: The page to decrypt. Must be locked.
> + * @inode: The encrypted inode to decrypt.
> + * @page:  The page to decrypt. Must be locked.

Strictly speaking, it's not the inode itself being decrypted, but rather the
data associated with it.  Could this be better expressed as something like
"The inode to which the page belongs"?

Eric
