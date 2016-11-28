Received: from mail-pg0-x22d.google.com ([2607:f8b0:400e:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBAk2-0006bi-W4
 for linux-mtd@lists.infradead.org; Mon, 28 Nov 2016 01:28:24 +0000
Received: by mail-pg0-x22d.google.com with SMTP id f188so50644440pgc.3
 for <linux-mtd@lists.infradead.org>; Sun, 27 Nov 2016 17:28:02 -0800 (PST)
Date: Sun, 27 Nov 2016 17:27:58 -0800
From: Eric Biggers <ebiggers@google.com>
To: Richard Weinberger <richard@nod.at>
Cc: Theodore Ts'o <tytso@mit.edu>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, jaegeuk@kernel.org,
 david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, mhalcrow@google.com, hch@infradead.org
Subject: Re: [PATCH 00/29] UBIFS File Encryption v1
Message-ID: <20161128012758.GA6813@google.com>
References: <1479072072-6844-1-git-send-email-richard@nod.at>
 <20161114030548.eils5al7ugfhlqwg@thunk.org>
 <34885683-a40f-eaff-b99d-b11fc68803f7@nod.at>
 <20161127175241.ojvqnla4zn5mkg63@thunk.org>
 <698c121c-5d44-1d6f-cab8-0cbaa61e5109@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <698c121c-5d44-1d6f-cab8-0cbaa61e5109@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 27, 2016 at 11:21:56PM +0100, Richard Weinberger wrote:
> Ted,
> 
> On 27.11.2016 18:52, Theodore Ts'o wrote:
> > On Fri, Nov 25, 2016 at 09:18:12AM +0100, Richard Weinberger wrote:
> >>
> >> Do you want us to address Eric's review comments on top of the fscrypt
> >> branch or shall we rebase?
> >> I'd suggest the former.
> > 
> > Yes, let's address them on top of the existing fscrypt branch.  I
> > don't consider any of his comments super-serious --- they were mostly
> > documentation or comments level changes unless I missed something.
> 
> Okay. Then I'll queue UBIFS encryption for the v4.10 merge window.
> Just to be sure, I base my UBIFS next tree on your fscrypt tree such that
> it will build fine and Linus won't see same commits with a different sha1?
> Usually I'm a lucky maintainer and not have to deal with dependencies
> between pull requests. :-)
> 
> Thanks,
> //richard

Shouldn't the branch be rebased to remove the CONFIG_VMAP_STACK fixes which are
already in Linus' tree?

	fscrypto: don't use on-stack buffer for key derivation
	fscrypto: don't use on-stack buffer for filename encryption

Otherwise we'll end up with duplicate commits.

Eric
