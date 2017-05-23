Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dD2oM-0007qm-Kb
 for linux-mtd@lists.infradead.org; Tue, 23 May 2017 05:56:52 +0000
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH 0/4] fscrypt: remove checks for encryption key after file
 open
From: David Gstir <david@sigma-star.at>
In-Reply-To: <20170523003945.14279-1-ebiggers3@gmail.com>
Date: Tue, 23 May 2017 07:56:25 +0200
Cc: linux-fscrypt@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 Eric Biggers <ebiggers@google.com>
Content-Transfer-Encoding: 7bit
Message-Id: <DA1CA888-856E-44A7-ABED-90F39D14C720@sigma-star.at>
References: <20170523003945.14279-1-ebiggers3@gmail.com>
To: Eric Biggers <ebiggers3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Eric,

> On 23 May 2017, at 02:39, Eric Biggers <ebiggers3@gmail.com> wrote:
> 
> From: Eric Biggers <ebiggers@google.com>
> 
> This series removes checks for a regular file's encryption key that occur
> after we've already opened the file.  We're guaranteed to already have
> the key in such places, since we require it in ->open().  open() fails
> with ENOKEY otherwise, and a file descriptor is never made available.
> 
> This pertains to regular files only.  (Directories can be opened with or
> without their key.)
> 
> Eric Biggers (4):
>  ext4: don't bother checking for encryption key in ->mmap()
>  f2fs: don't bother checking for encryption key in ->mmap()
>  ubifs: don't bother checking for encryption key in ->mmap()
>  f2fs: don't bother checking for encryption key in ->write_iter()
> 
> fs/ext4/file.c  |  7 -------
> fs/f2fs/file.c  | 13 -------------
> fs/ubifs/file.c |  9 ---------
> 3 files changed, 29 deletions(-)

The whole series looks good to me. So feel free to add my
Reviewed-by: David Gstir <david@sigma-star.at>

David
