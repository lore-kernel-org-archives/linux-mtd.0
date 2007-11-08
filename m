Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1Iq5Nb-0000BO-Sy
	for linux-mtd@lists.infradead.org; Thu, 08 Nov 2007 06:17:06 -0500
Date: Thu, 8 Nov 2007 11:22:40 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH 1/8] MTD: add physical address to point() api -- core
	changes
Message-ID: <20071108102239.GB18903@lazybastard.org>
References: <6934efce0711071913n4bdb74dbvbcf38c704b132e60@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6934efce0711071913n4bdb74dbvbcf38c704b132e60@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 7 November 2007 19:13:12 -0800, Jared Hulbert wrote:
> 
> Adding the ability to get a physical address from point() in addition
> to virtual address.  This physical address will be required for axfs
> and cramfs with XIP.

In principle this patchset looks good.  Three things I noticed:
- The hunk pointed out.
- Mails are word-wrapped.  If you cannot fix gmail you can resend them
  with mutt on lazybastard.org.
- For merge patches should be combined to a single one.  Git bisect
  would become unhappy otherwise.  For review the split patchset is
  nice.

Jörn

-- 
Premature optimization is the root of all evil.
-- Donald Knuth
