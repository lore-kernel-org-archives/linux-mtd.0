Received: from imap.thunk.org ([2600:3c02::f03c:91ff:fe96:be03])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBY9f-0002cs-VE
 for linux-mtd@lists.infradead.org; Tue, 29 Nov 2016 02:28:25 +0000
Date: Mon, 28 Nov 2016 21:27:33 -0500
From: Theodore Ts'o <tytso@mit.edu>
To: Eric Biggers <ebiggers@google.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, jaegeuk@kernel.org,
 david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, mhalcrow@google.com, hch@infradead.org
Subject: Re: [PATCH 00/29] UBIFS File Encryption v1
Message-ID: <20161129022733.pfougb5hyw6wzdwo@thunk.org>
References: <1479072072-6844-1-git-send-email-richard@nod.at>
 <20161114030548.eils5al7ugfhlqwg@thunk.org>
 <34885683-a40f-eaff-b99d-b11fc68803f7@nod.at>
 <20161127175241.ojvqnla4zn5mkg63@thunk.org>
 <698c121c-5d44-1d6f-cab8-0cbaa61e5109@nod.at>
 <20161128012758.GA6813@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161128012758.GA6813@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 27, 2016 at 05:27:58PM -0800, Eric Biggers wrote:
> 
> Shouldn't the branch be rebased to remove the CONFIG_VMAP_STACK fixes which are
> already in Linus' tree?
> 
> 	fscrypto: don't use on-stack buffer for key derivation
> 	fscrypto: don't use on-stack buffer for filename encryption
> 
> Otherwise we'll end up with duplicate commits.

Given that the ubifs folks are depending on the existing branch,
having duplicate commits is considered an acceptable tradeoff to not
rebasing a published commit that other trees are depending on.

I tell people that the ext4.git dev branch is a rewinding branch, so
people shouldn't be building other trees on top of it unless they are
willing to deal with the fact that it can be rebased.  However, i
didn't give that warning for the fscrypt branch, so I'd much rather
not rewind/rebase it.

						- Ted
