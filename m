Received: from imap.thunk.org ([2600:3c02::f03c:91ff:fe96:be03])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePJsn-00048j-PG
 for linux-mtd@lists.infradead.org; Thu, 14 Dec 2017 03:08:27 +0000
Date: Wed, 13 Dec 2017 22:08:07 -0500
From: Theodore Ts'o <tytso@mit.edu>
To: Eric Biggers <ebiggers@google.com>
Cc: fstests@vger.kernel.org, linux-mtd@lists.infradead.org,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: Re: [PATCH v2] xfstests-bld: add support for UBIFS using block2mtd
Message-ID: <20171214030807.3hsdycsazcsk3hzq@thunk.org>
References: <20171214020348.185463-1-ebiggers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171214020348.185463-1-ebiggers@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 13, 2017 at 06:03:48PM -0800, Eric Biggers wrote:
> Hi Ted, are you interested in taking this UBIFS support patch into
> xfstests-bld now?  The 'block2mtd' approach hasn't gotten any better
> from when I sent this patch out originally, but it's better than nothing
> (it's useful to me, at least).  Also, xfstests itself supports UBIFS
> now, so only xfstests-bld support is missing.

Agreed, thanks for doing this work!  I've applied this patch to
xfstests-bld.

						- Ted
