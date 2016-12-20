Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJE8E-0003kJ-Lv
 for linux-mtd@lists.infradead.org; Tue, 20 Dec 2016 06:42:39 +0000
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v2] fscrypt: Factor out bio specific functions
From: David Gstir <david@sigma-star.at>
In-Reply-To: <20161219112532.18863-1-richard@nod.at>
Date: Tue, 20 Dec 2016 07:42:14 +0100
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 jaegeuk@kernel.org, tytso@mit.edu, hch@infradead.org, arnd@arndb.de,
 dedekind1@gmail.com, linux-mtd@lists.infradead.org,
 adrian.hunter@intel.com, linux-ext4@vger.kernel.org, ebiggers@google.com,
 rdunlap@infradead.org
Content-Transfer-Encoding: 7bit
Message-Id: <C1B6C185-6DF1-4118-80E4-7B2FE33225E1@sigma-star.at>
References: <20161219103929.GA16197@infradead.org>
 <20161219112532.18863-1-richard@nod.at>
To: Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> On 19.12.2016, at 12:25, Richard Weinberger <richard@nod.at> wrote:
> 
> That way we can get rid of the direct dependency on CONFIG_BLOCK.
> 
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Fixes: d475a507457b ("ubifs: Add skeleton for fscrypto")
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
> Changes since v1:
> - Moved fscrypt_zeroout_range() also to bio.c

Looks good to me.

Reviewed-by: David Gstir <david@sigma-star.at>

- David
