Received: from mx1.redhat.com ([66.187.233.31])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HKCMF-0007ZQ-CT
	for linux-mtd@lists.infradead.org; Thu, 22 Feb 2007 06:43:33 -0500
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20070221163839.b4f5e3b5.akpm@linux-foundation.org> 
References: <20070221163839.b4f5e3b5.akpm@linux-foundation.org>
	<20070220195049.26186.69393.stgit@warthog.cambridge.redhat.com>
	<20070220195106.26186.41931.stgit@warthog.cambridge.redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 4/4] NOMMU: Make it possible for RomFS to use MTD devices
	directly
Date: Thu, 22 Feb 2007 11:43:00 +0000
Message-ID: <32148.1172144580@redhat.com>
Sender: dhowells@redhat.com
Cc: dwmw2@infradead.org, torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	uclinux-dev@uclinux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew Morton <akpm@linux-foundation.org> wrote:

> > +		brelse(bh);
> 
> A little fyi: brelse() is rather old-fashioned, and has a usually unneeded
> test for non-null bh in it.  In situations where we know that the pointer is 
> valid, let's please use put_bh().

That's what was in the old romfs.  I can make the change, though.

Hmmm... brelse() isn't quite equivalent to put_bh(), but the difference seems
just to be the message you get if you over-release a buffer head - and the
resulting refcount on the BH if that happens.

> Anyway, I'll assume that dwmw2 will be handling this patch series.

I assume so.

David
