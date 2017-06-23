Received: from imap.thunk.org ([2600:3c02::f03c:91ff:fe96:be03])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dOYHu-0001ko-HJ
 for linux-mtd@lists.infradead.org; Fri, 23 Jun 2017 23:46:56 +0000
Date: Fri, 23 Jun 2017 19:46:27 -0400
From: Theodore Ts'o <tytso@mit.edu>
To: Eric Biggers <ebiggers3@gmail.com>
Cc: linux-fscrypt@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, Eric Biggers <ebiggers@google.com>
Subject: Re: [PATCH 1/4] ext4: don't bother checking for encryption key in
 ->mmap()
Message-ID: <20170623234627.ok4ge3lldrieknq4@thunk.org>
References: <20170523003945.14279-1-ebiggers3@gmail.com>
 <20170523003945.14279-2-ebiggers3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170523003945.14279-2-ebiggers3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 22, 2017 at 05:39:42PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Since only an open file can be mmap'ed, and we only allow open()ing an
> encrypted file when its key is available, there is no need to check for
> the key again before permitting each mmap().
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Thanks, applied.

					- Ted
