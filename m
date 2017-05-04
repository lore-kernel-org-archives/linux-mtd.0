Received: from imap.thunk.org ([2600:3c02::f03c:91ff:fe96:be03])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d6IAQ-000117-LW
 for linux-mtd@lists.infradead.org; Thu, 04 May 2017 14:55:44 +0000
Date: Thu, 4 May 2017 10:55:16 -0400
From: Theodore Ts'o <tytso@mit.edu>
To: Eric Biggers <ebiggers3@gmail.com>
Cc: linux-fscrypt@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Gwendal Grignou <gwendal@chromium.org>, hashimoto@chromium.org,
 kinaba@chromium.org, Eric Biggers <ebiggers@google.com>
Subject: Re: [PATCH] fscrypt: correct collision claim for digested names
Message-ID: <20170504145516.7vwyb3f44iz7njly@thunk.org>
References: <20170501184332.37532-1-ebiggers3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170501184332.37532-1-ebiggers3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 01, 2017 at 11:43:32AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> As I noted on the mailing list, it's easier than I originally thought to
> create intentional collisions in the digested names.  Unfortunately it's
> not too easy to solve this, so for now just fix the comment to not lie.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Applied, thanks.

					- Ted
