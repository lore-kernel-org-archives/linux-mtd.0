Received: from imap.thunk.org ([2600:3c02::f03c:91ff:fe96:be03])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e5dEE-0007GP-QI
 for linux-mtd@lists.infradead.org; Fri, 20 Oct 2017 19:45:13 +0000
Date: Fri, 20 Oct 2017 15:44:45 -0400
From: Theodore Ts'o <tytso@mit.edu>
To: Eric Biggers <ebiggers3@gmail.com>
Cc: linux-fscrypt@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, Eric Biggers <ebiggers@google.com>
Subject: Re: [PATCH v2 00/11] fscrypt: add some higher-level helper functions
Message-ID: <20171020194445.dirxpfu2nk2n7a6b@thunk.org>
References: <20171009191544.43656-1-ebiggers3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171009191544.43656-1-ebiggers3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 09, 2017 at 12:15:33PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> This series prepares to reduce code duplication among ext4, f2fs, and
> ubifs by introducing a S_ENCRYPTED inode flag (so we don't have to call
> back into the filesystem to test the filesystem-specific inode flag),
> then introducing new helper functions that are called at the beginning
> of the open, link, rename, lookup, and setattr operations.
> 
> In the future we maybe should even call these new helpers from the VFS
> so that each individual filesystem doesn't have to do it.  But that's
> not possible currently because fs/crypto/ can be built as a module.
> 
> The patches to switch the filesystems over to use the helper functions
> were included in v1 of this patchset.  They are not included now since
> I'm planning to get them picked up by the individual filesystem
> maintainers after this goes in.

Thanks, I've applied these patches plus the ones for ext4 on the
fscrypt.git tree.

The only concern I have is that in fscrypt_file_name() the warning
prints just the inode numbers, but not the block device (it replaced
an ext4_warning() call which automatically printed the block device).
I'll add a patch to fix that up in the next day or two.

     	   	    	     	- Ted
