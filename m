Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LfEt6-0006jh-8y
	for linux-mtd@lists.infradead.org; Thu, 05 Mar 2009 14:49:32 +0000
Subject: Re: [PATCH 1/3] [MTD] Flex-OneNAND support
From: Artem Bityutskiy <dedekind@infradead.org>
To: Adrian Hunter <adrian.hunter@nokia.com>
In-Reply-To: <49AFD5EA.5010502@nokia.com>
References: <20090303063605.GA30258@july>
	<20090303124948.dda294e5.akpm@linux-foundation.org>
	<49AE6907.1080702@nokia.com>
	<20090304085055.c9de6cbb.akpm@linux-foundation.org>
	<49AFD5EA.5010502@nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 05 Mar 2009 16:46:58 +0200
Message-Id: <1236264418.4261.91.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Rohit Hagargundgi <h.rohit@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-03-05 at 15:38 +0200, Adrian Hunter wrote:
> > My point is: for what purpose was EUNCLEAN created by whoever created
> > it and, given that, is its use by MTD appropriate?  Because it does
> > appear that this gets returned all the way to userspace sometimes.
> 
> I have had a look at the use of EUCLEAN and found the following:
> 	1. It does not seem to be defined in POSIX
> 	2. It may have been used by unix variants to indicate an
> attempt to mount a file system whose superblock was not marked
> as clean.
> 	3. In Linux, it is used almost exclusively by MTD, with
> one exception in smbfs, from which it is tempting to conclude that
> smbfs (at least) is using it incorrectly.  There is one web page
> http://www.wlug.org.nz/EUCLEAN where the author suggests ENOMEDIUM
> might be a better choice.
> 
> Can you point me to where EUCLEAN is returned to userspace?  I took
> a quick look and couldn't see it.

But for us, EUCLEAN looks like a good name :-) Probably this is why
tglx choose this error code.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
