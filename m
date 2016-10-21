Received: from imap.thunk.org ([2600:3c02::f03c:91ff:fe96:be03])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxiOx-0008SA-1M
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 22:35:00 +0000
Date: Fri, 21 Oct 2016 18:34:25 -0400
From: Theodore Ts'o <tytso@mit.edu>
To: Eric Biggers <ebiggers@google.com>
Cc: Michael Halcrow <mhalcrow@google.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, jaegeuk@kernel.org,
 david@sigma-star.at, wd@denx.de, sbabic@denx.de,
 dengler@linutronix.de, alexcope@google.com
Subject: Re: [PATCH 26/26] ubifs: Raise write version to 5
Message-ID: <20161021223425.sqtjey2xov7fqjh3@thunk.org>
References: <1477054121-10198-1-git-send-email-richard@nod.at>
 <1477054121-10198-27-git-send-email-richard@nod.at>
 <20161021173154.GB17121@google.com>
 <20161021174758.wz7xrulokicuhlht@thunk.org>
 <20161021181931.GA90712@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161021181931.GA90712@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 21, 2016 at 11:19:31AM -0700, Eric Biggers wrote:
> 
> I don't think it's reasonable to require require changes to filesystems whenever
> someone introduces a new encryption mode --- contents, filenames, or both.
> Filesystems need to be able to handle unsupported encryption modes in some way
> that makes sense.  Currently, when it sees an unsupported encryption mode
> fscrypto will behave as if the encryption key is not available and will also
> print a one-time warning to the kernel log.  This happens when a file is
> accessed, not when the filesystem is mounted.  As far as I can tell, ext4, f2fs,
> and ubifs would all behave this way because this code is shared.  I think this
> is probably the most realistic behavior.

I tend to agree, but file systems may choose some alternate approach
if they want to "fail fast" (e.g., at mount time).  I wouldn't want to
do that for ext4, but if ubifs (or some other file system) wants do
something more draconian, they can be afraid to do that.  Failing
that, some kind of one-time warning makes sense.

What I would like to do though is to is to have a callback so that
code in fs/crypto can call a file system specific notification
routine.  e.g., for ext4, we would probably want to be able to call
ext4_warning() and ext4_error() from fs/crypto, and other file systems
might want to have a different set of notification routines.

This way we can print a message like

kernel: EXT4-fs warning (device sdb1): fscrypto_xxx: foo bar baz

and if we later on have a way of sending file system specific warnings
or errors through some kind of IPC mechanism, such as netlink or some
future kdbus scheme, we can send the warning and error messages out
the same way we send other filesystem specific error messages.

	      	      	     	       	      - Ted

P.S.  BTW, we actually _do_ have something hacked together inside the
Google production kernel which pipes ext4_error() messages to a
netlink socket, so that monitoring systems don't have scrape dmesg or
/var/log/messages.

If anyone inside or outside google is interested in that
functionality, I can make the code available.  There's nothing
sensitive or Google specific in it; it's just that unfortunately,
getting that code cleaned up and upstreamed has just never made it
"above the fold" on the priority list, the engineer who originally
implemented it is no longer on the team --- and I never had the time
to cleanup work to get the code to upstream quality myself.
