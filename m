Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 143oTU-00082E-00
	for mtd-list@infradead.org; Wed, 06 Dec 2000 23:59:48 +0000
Received: from rf-mail1.echostar.com ([205.172.144.40] helo=rf-exch2.echostar.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 143oTT-000827-00
	for mtd@infradead.org; Wed, 06 Dec 2000 23:59:47 +0000
Message-ID: <3A2ED2CA.14522213@echostar.com>
Date: Wed, 06 Dec 2000 16:59:06 -0700
From: "Ian S. Nelson" <ian.nelson@echostar.com>
Reply-To: ian.nelson@echostar.com
MIME-Version: 1.0
To: "mtd@infradead.org" <mtd@infradead.org>
Subject: CFI Physical Mapped working?
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I've been trying to get either the CFI AMD or CFI Physical Mapping to
work with no luck.  Are there any tricks to making it work?  It doesn't
look like any of that code is ever called.  I can load the modules but
nothing ever happens.  I've put some printks in the init_module function
and nothing ever prints.

I'm running with the code in  the 2.4.0test10 tree,  I'm going to try
the CVS code here shortly though.

Also, what are the differences between the physical mapped interface and
CFI?  I'm using an AMD 2MB flash, it's the low power one AM29LV160, I
believe is the part number.  AMD says it's CFI compliant so I'm hoping
it works.    I can read it in physical memory as it is now so I know
that it is visible that way, if nothing else.  I'm working on a National
Semi based product, it has a MediaGX1 and the CS5530A in it if that
makes any difference, I'm under the impression that it shouldn't.  I'm
using their "Centaurus"  test board but I have custom "pizza boards"
too,  the Centaurus is a bit tricky as it has a 256K flash, a 2MB flash
and a 5 or 8 MB DoC and there is a chip select that determines which one
you're running, if that makes any difference.

thanks,
Ian



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
