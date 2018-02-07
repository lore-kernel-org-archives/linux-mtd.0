Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ejPPJ-0004MB-17
 for linux-mtd@lists.infradead.org; Wed, 07 Feb 2018 13:05:06 +0000
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Subject: Re: [LSF/MM TOPIC] fs-verity: file system-level integrity protection
From: David Gstir <david@sigma-star.at>
In-Reply-To: <20180125191152.GA11197@thunk.org>
Date: Wed, 7 Feb 2018 14:04:36 +0100
Cc: lsf-pc@lists.linux-foundation.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 linux-mtd@lists.infradead.org
Content-Transfer-Encoding: 7bit
Message-Id: <17162EE0-D181-4C74-8F9B-610170117CC4@sigma-star.at>
References: <20180125191152.GA11197@thunk.org>
To: Theodore Ts'o <tytso@mit.edu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[CC-ing linux-mtd]

> On 25.01.2018, at 20:11, Theodore Ts'o <tytso@mit.edu> wrote:
> 
> I'd like to talk about a proposal to implement and upstream something
> that we've been calling fs-verity, which is something like dm-verity,
> but implemnted on a per-file basis.  It will be implemnted much like
> fs/crypto, in that most of the code will be in a generic layer, with
> minimal modifications needed in the file system layer.
> 
> The merkle tree will be located after file's normal data, and then
> after the package manager sets the verity bit, i_size will be updated
> so that the fs-verity header and merkle tree will be "hidden" from
> userspace and the file will become immutable.
> 
> How does this differ from IMA's file integrity?
> 
> *) The pages are verified as they are read, so pages are verified as
> they are read the storage device; this avoids a large latency hit when
> the file is first opened or referenced.
> 
> *) The design and code are done by file system developers, so it
> doesn't have the locking problems of the IMA code.

This sounds interesting! We recently sent a proposal to add file
authentication to UBIFS [1]. Although it does not cover the exact
same use case, the concept is similar so that it could implement
the same VFS/fs-verity API.

It would be great to get some input on this.

Thanks,
David

[1] https://marc.info/?l=linux-fsdevel&m=151620293206369&w=2
