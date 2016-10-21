Received: from imap.thunk.org ([2600:3c02::f03c:91ff:fe96:be03])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxbYF-0006Cs-Rt
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 15:16:09 +0000
Date: Fri, 21 Oct 2016 11:14:45 -0400
From: Theodore Ts'o <tytso@mit.edu>
To: Christoph Hellwig <hch@infradead.org>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, jaegeuk@kernel.org,
 david@sigma-star.at, wd@denx.de, sbabic@denx.de, dengler@linutronix.de
Subject: Re: [PATCH 01/26] fscrypto: Add buffer operations
Message-ID: <20161021151445.xcqzggh27nzdqmuh@thunk.org>
References: <1477054121-10198-1-git-send-email-richard@nod.at>
 <1477054121-10198-2-git-send-email-richard@nod.at>
 <20161021130558.GA2411@infradead.org>
 <9c80d1d0-0237-606f-91ce-a004c3694aa5@nod.at>
 <20161021132400.GA28880@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161021132400.GA28880@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 21, 2016 at 06:24:00AM -0700, Christoph Hellwig wrote:
> > Another reason why I did the buffer functions is because fscrypt_encrypt_page()
> > always allocates a bounce page as temporary memory. For ext4 this is needed,
> > for UBIFS not.
> > UBIFS has already a construction buffer, especially since it also does compression.
> 
> We should defintively find a way to avoid that, but it's a separate
> issue from adding another API just to pass buffers.

Hmm, one approach we could use is to avoid allocating a bounce page if
the passed-in plaintext_page has the PageSlab flag set.  That would
work for ubifs, but if there are file systems that are using
get_free_page() for their particular construction buffer. it wouldn't
work for them.

Perhaps more importantly, are you planning on making compression +
encryption work?  Some security purists will say that compression +
encryption will leak some information about the plaintext (which is
technically true, but it's much like the people who don't want make it
easy to discard + encrypt, which Linus recently railed against).  So
my take is that as long as users understand that there are minor
leakage issues with compression + encryption, we should let them do
that --- and that would be an argument for supporting buffer
operations, and only requiring that the buffer size must be a multiple
of the underlying encryption block size.

						- Ted
