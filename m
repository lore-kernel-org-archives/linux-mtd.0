Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ISoO-0003WI-Cb
	for <linux-mtd@lists.infradead.org>; Wed, 21 May 2003 13:35:16 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: John Burch <jburch@vincisystems.com>
In-Reply-To: <000701c31f95$38ad1040$1200a8c0@JOHNB>
References: <000701c31f95$38ad1040$1200a8c0@JOHNB>
Message-Id: <1053520534.20074.2613.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 21 May 2003 13:35:35 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: =?ISO-8859-1?Q?=27J=F6rn?= Engel' <joern@wohnheim.fh-wedel.de>
Subject: RE: Mtd block access (jffs2 formatted) and mtd char
 access(unformatted) on different partitions of a single flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-05-21 at 13:33, John Burch wrote:
> When accessing "raw" flash via the char driver, how can I initiate a
> sector erase?  
See how it's done in util/erase.c: ioctl(...MEMERASE...)

> Also, does the mtd driver for AMD CFI devices handle
> AMD's ability to support erasure of multiple sectors simultaneously?

Probably not yet, but there's no reason why it shouldn't. Criticism in
'diff -u' form is preferred :)

> David has it right.  The raw "in-kernel" driver deals with flash
> directly on its own, not through mtd.

Then you lose :) If you have sane code which handles multiple concurrent
erases, we'd be happy to merge it so that you can use the mtd driver
without losing out on that feature ;)

-- 
dwmw2
