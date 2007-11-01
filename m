Received: from mail.shareable.org ([81.29.64.88])
	by bombadil.infradead.org with esmtps (Exim 4.66 #1 (Red Hat Linux))
	id 1InOND-000343-Sq
	for linux-mtd@lists.infradead.org; Wed, 31 Oct 2007 20:57:34 -0400
Date: Thu, 1 Nov 2007 00:57:10 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
Subject: Re: UBI Used In Commercial Products ??
Message-ID: <20071101005710.GB21550@mail.shareable.org>
References: <B1EDF20A6EAAD74EA65E46F774F1784502C6D577@orsmsx413.amr.corp.intel.com>
	<loom.20071031T215155-403@post.gmane.org>
	<B1EDF20A6EAAD74EA65E46F774F1784502C6D843@orsmsx413.amr.corp.intel.com>
	<loom.20071031T224633-341@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <loom.20071031T224633-341@post.gmane.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sergei Sharonov wrote:
> 2 hours of mount time after I used ftp to transfer large file.

Wow!

> I really hope UBI+UBIFS will overcome this problem. Still there is a
> concern here since UBI scales linearly. Can somebody plz post UBI
> scan time for large flash array?

The only way to get sub-linear scaling is to designate a sub-linear
subset of eraseblocks which are read at scanning/mount time.

Doing that at the same time as wearing all eraseblocks equally is
quite tricky, and probably requires a phase tree and multi-headed
logging structure, like LogFS (I'm not sure if LogFS actually does
both, though).

Such a structure is not particularly simple, and will be present in
the best flash filesystems eventually.  So I wonder if UBI is really a
good place to have a second copy of those algorithms.

I like the idea of UBI, to abstract block allocation and wear tracking
from the filesystem, but it seems the sub-linear scan time requirement
is a tricky one to do without implementing a non-trivial
filesystem-like algorithm in UBI itself.

I'll be delighted to read that the problem's been solved, when it has
been solved, though :-)

-- Jamie
