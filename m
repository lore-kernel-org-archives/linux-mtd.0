Received: from imap.thunk.org ([2600:3c02::f03c:91ff:fe96:be03])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBA3O-0003eJ-Sy
 for linux-mtd@lists.infradead.org; Mon, 28 Nov 2016 00:44:19 +0000
Date: Sun, 27 Nov 2016 19:43:26 -0500
From: Theodore Ts'o <tytso@mit.edu>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dedekind1@gmail.com,
 adrian.hunter@intel.com, jaegeuk@kernel.org, david@sigma-star.at,
 wd@denx.de, sbabic@denx.de, dengler@linutronix.de,
 ebiggers@google.com, mhalcrow@google.com, hch@infradead.org
Subject: Re: [PATCH 00/29] UBIFS File Encryption v1
Message-ID: <20161128004326.f34bt5lsuonv7uvu@thunk.org>
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
> 
> Okay. Then I'll queue UBIFS encryption for the v4.10 merge window.
> Just to be sure, I base my UBIFS next tree on your fscrypt tree such that
> it will build fine and Linus won't see same commits with a different sha1?

Yep, if you pull down the dev branch from ext4.git, and run the
command:

git log --merges ext4/origin^..ext4/dev

you should see:

commit 6da22013bb7907b33c87968c25034b409a6161a2
Merge: a2f6d9c4c081 a6e089128617
Author: Theodore Ts'o <tytso@mit.edu>
Date:   Sun Nov 13 22:02:22 2016 -0500

    Merge branch 'fscrypt' into origin

commit a2f6d9c4c081ec2a02529b8af2c04f3e557a3a3e
Merge: bc33b0ca11e3 9484ab1bf446
Author: Theodore Ts'o <tytso@mit.edu>
Date:   Sun Nov 13 22:02:15 2016 -0500

    Merge branch 'dax-4.10-iomap-pmd' into origin

Cheers,

						- Ted
