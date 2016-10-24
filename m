Received: from imap.thunk.org ([2600:3c02::f03c:91ff:fe96:be03])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1byfcO-0006qH-NH
 for linux-mtd@lists.infradead.org; Mon, 24 Oct 2016 13:48:50 +0000
Date: Mon, 24 Oct 2016 09:48:16 -0400
From: Theodore Ts'o <tytso@mit.edu>
To: Richard Weinberger <richard@nod.at>
Cc: Eric Biggers <ebiggers@google.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, jaegeuk@kernel.org,
 david@sigma-star.at, wd@denx.de, sbabic@denx.de, dengler@linutronix.de
Subject: Re: [PATCH 25/26] ubifs: Implement UBIFS_FLG_ENCRYPTION
Message-ID: <20161024134816.sihgrniryifo6n63@thunk.org>
References: <1477054121-10198-1-git-send-email-richard@nod.at>
 <1477054121-10198-26-git-send-email-richard@nod.at>
 <20161021183012.GC90712@google.com>
 <58235996-2da6-259c-a02c-9e7fcb499d62@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58235996-2da6-259c-a02c-9e7fcb499d62@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 24, 2016 at 08:59:26AM +0200, Richard Weinberger wrote:
> 
> So, on ext4 (f2fs too?) root has to enable to feature first before users
> can use it?
> IOW for ext4 the encryption flag means "file encryption is allowed", for UBIFS it
> means "at least one file got encrypted on this fs".

Historically there have been one or two feature flags which ext4 has
enabled automatically, behind the system administrator's back.  We've
since decided that's a bad thing to do, and so it's a file system
level policy not to do this.

An example of why this can cause problems is if a system administrator
boots a rescue CD that happens to use a newer kernel, and that newer
kernel (plus potentially an updated userspace on said rescue CD)
silently the feature flag to enable some feature (say, the first time
we have files larger than 2GB, for example), and then when the system
administrator books back into their RHEL or SLES kernel, they can no
longer mount the file system.

So ext4 has a policy now that we won't do that, since it's unfriendly
to system administrators.  That's a general rule, and not one which is
specific to encryption.  That way you can create a file system, and
for the most part, modulo some really old, ancient flags which
hopefully all Linux systems understand (I don't *think* there are any
RHEL 2.x systems out there still :-), if a feature flag is not
enabled, the kernel will return an error if you try to use some
feature which is not enabled, instead of silently enabling it behind
the user and/or sysadmin's back.

I believe xfs may have a similar policy, and for similar reasons.
(Actually, I'm not sure if xfs supports enabling features after the
file system has been created at all; certainly Red Hat has a
distro-level policy of not supporting features added post-mkfs,
although I don't know how much that is enforced at the open source
coding level.  At one point there were some grumbles that Red Hat
might want to disable some of tune2fs's features of enabling features
post-mkfs time, but I think they've settled for just laughing at users
who show up with bug reports after they converted a file system from
ext3 to ext4.  :-)

> I think I'll do what ext4 does to have common policies.

If you want to, feel free; but if there is good reason for Ubifs to
want to be more flexible, I think there is room for differences at
this level.

The specific reason why we do this probably doesn't matter so much on
embedded systems --- although I will note that many/most handset
manufacturers have a policy of not supporting any new features that
require new *kernel* fatures after the device has been released,
because they don't want to deal with potential upgrade problems and
device instabilities issues; users tend to get unhappy when their
phones get bricked after an upgrade.

Cheers,

						- Ted
