Received: from imap.thunk.org ([2600:3c02::f03c:91ff:fe96:be03])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dOR9J-0000Ip-8p
 for linux-mtd@lists.infradead.org; Fri, 23 Jun 2017 16:09:35 +0000
Date: Fri, 23 Jun 2017 12:09:07 -0400
From: Theodore Ts'o <tytso@mit.edu>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Eric Biggers <ebiggers3@gmail.com>, linux-fscrypt@vger.kernel.org,
 Eric Biggers <ebiggers@google.com>, linux-f2fs-devel@lists.sourceforge.net,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Subject: Re: [PATCH 3/4] ubifs: don't bother checking for encryption key in
 ->mmap()
Message-ID: <20170623160907.ppwcqehvrehjtury@thunk.org>
References: <20170523003945.14279-1-ebiggers3@gmail.com>
 <20170523003945.14279-4-ebiggers3@gmail.com>
 <CAFLxGvxaiWFKH5L_BwPXGuG9PxA+0BkJ1qMvaDgAeVwBw+nCoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLxGvxaiWFKH5L_BwPXGuG9PxA+0BkJ1qMvaDgAeVwBw+nCoQ@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 23, 2017 at 04:14:20PM +0200, Richard Weinberger wrote:
> On Tue, May 23, 2017 at 2:39 AM, Eric Biggers <ebiggers3@gmail.com> wrote:
> > From: Eric Biggers <ebiggers@google.com>
> >
> > Since only an open file can be mmap'ed, and we only allow open()ing an
> > encrypted file when its key is available, there is no need to check for
> > the key again before permitting each mmap().
> >
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> Acked-by: Richard Weinberger <richard@nod.at>

There are some patches that were sent to linux-fscrypt (including this
one) that are specific to ubifs that don't appear to be in linux-next
as of this writing.

I can include them in the fscrypt tree (which I am updating somewhat
belatedly; sorry, crazy travel schedule has made me be late attending
to fscrypt), but it probably makes more sense for the change to go in
via the ubifs tree.  The f2fs version of the "don't bother checking
for encryption key" is already in linux-next, via the f2fs tree, for
example.

So I'm planning on NOT taking the ubifs-specific patches that are in
the linux-fscrypto patch queue; unless Richard, you want to
specifically ask me to do so.

Cheers,

						- Ted
