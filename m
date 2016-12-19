Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJ6c1-0001yv-7p
 for linux-mtd@lists.infradead.org; Mon, 19 Dec 2016 22:40:54 +0000
Received: by mail-io0-x241.google.com with SMTP id p13so20693390ioi.0
 for <linux-mtd@lists.infradead.org>; Mon, 19 Dec 2016 14:40:32 -0800 (PST)
Date: Mon, 19 Dec 2016 14:40:29 -0800
From: Eric Biggers <ebiggers3@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 jaegeuk@kernel.org, tytso@mit.edu, hch@infradead.org, arnd@arndb.de,
 dedekind1@gmail.com, linux-mtd@lists.infradead.org,
 adrian.hunter@intel.com, linux-ext4@vger.kernel.org,
 ebiggers@google.com, rdunlap@infradead.org, david@sigma-star.at
Subject: Re: [PATCH v2] fscrypt: Factor out bio specific functions
Message-ID: <20161219224029.GE37112@gmail.com>
References: <20161219103929.GA16197@infradead.org>
 <20161219112532.18863-1-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161219112532.18863-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 19, 2016 at 12:25:32PM +0100, Richard Weinberger wrote:
> That way we can get rid of the direct dependency on CONFIG_BLOCK.
> 
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Fixes: d475a507457b ("ubifs: Add skeleton for fscrypto")
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
> Changes since v1:
>  - Moved fscrypt_zeroout_range() also to bio.c

Reviewed-by: Eric Biggers <ebiggers@google.com>

Thanks,

Eric
