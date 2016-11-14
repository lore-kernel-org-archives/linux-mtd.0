Received: from imap.thunk.org ([2600:3c02::f03c:91ff:fe96:be03])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c67bZ-0007XU-6v
 for linux-mtd@lists.infradead.org; Mon, 14 Nov 2016 03:06:46 +0000
Date: Sun, 13 Nov 2016 22:05:48 -0500
From: Theodore Ts'o <tytso@mit.edu>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dedekind1@gmail.com,
 adrian.hunter@intel.com, jaegeuk@kernel.org, david@sigma-star.at,
 wd@denx.de, sbabic@denx.de, dengler@linutronix.de,
 ebiggers@google.com, mhalcrow@google.com, hch@infradead.org
Subject: Re: [PATCH 00/29] UBIFS File Encryption v1
Message-ID: <20161114030548.eils5al7ugfhlqwg@thunk.org>
References: <1479072072-6844-1-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1479072072-6844-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Richard,

Your fscrypt patches look good.  I've created an fscrypt branch on the
ext4.git tree which contains your changes as well as Eric Bigger's
recent fspatch cleanups changes.  If you want to base your ubifs
changes on that branch, that would be great.  The ext4 dev branch will
be including that fscrypt branch, so it will be feeding into
linux-next that way.  If you also base your patches on that, it will
avoid duplicate patches in linux-next and in Linus's tree when he
pulls them.

One quick question.  When ubifs uses subpage blocks, can you assume that
they are always powers of two?  Or more to the point, can you assume
that it will always be a multiple of the cipher's blocksize?

						- Ted
