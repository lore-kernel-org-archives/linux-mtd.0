Received: from imap.thunk.org ([2600:3c02::f03c:91ff:fe96:be03])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDIJ9-00050K-GB
 for linux-mtd@lists.infradead.org; Sat, 03 Dec 2016 21:57:24 +0000
Date: Sat, 3 Dec 2016 16:56:31 -0500
From: Theodore Ts'o <tytso@mit.edu>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, david@sigma-star.at, dedekind1@gmail.com,
 ebiggers@google.com, mhalcrow@google.com, adrian.hunter@intel.com,
 linux-kernel@vger.kernel.org, hch@infradead.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 dengler@linutronix.de, sbabic@denx.de, wd@denx.de
Subject: Re: [PATCH 0/6] UBIFS related fscrypt updates
Message-ID: <20161203215631.vcmmlr4g5foo4bf7@thunk.org>
References: <1480630498-19201-1-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1480630498-19201-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 01, 2016 at 11:14:52PM +0100, Richard Weinberger wrote:
> This series applies on top of Ted's fscrypt tree[0] addresses the review
> comments from Eric.
> Ted, it would be awesome to have this patches in the v4.10 merge window.

Your patch 4/6 won't apply on my branch because it references
fs/ubifs/crypto.c (which of course isn't in my tree).  I could drop
it, but I want to make sure you then make the appropriate changes in
your tree.

Also, I think Eric Bigger's changes make sense.

As far as whether or not they make it for the 4.10 merge window.
Linus could be opening the merge window tomorrow, so it's getting a
bit late for that....  if he decides to do a -rc8, we could probably
do it.

					- Ted
