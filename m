Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14defj-0002H1-00
	for mtd-list@infradead.org; Thu, 15 Mar 2001 20:48:35 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14defi-0002Gv-00
	for mtd@infradead.org; Thu, 15 Mar 2001 20:48:35 +0000
Received: from dwmw2 by passion.cambridge.redhat.com with local (Exim 3.16 #2)
	id 14defi-0006N7-00
	for mtd@infradead.org; Thu, 15 Mar 2001 20:48:34 +0000
From: David Woodhouse <dwmw2@redhat.com>
To: linux-kernel@vger.kernel.org, mtd@infradead.org
Reply-To: dwmw2@infradead.org
Subject: ANNOUNCE: Journalling Flash File System, v2. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 15 Mar 2001 18:03:24 +0000
Message-ID: <21916.984679404@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Well, it's been almost a week since the latest stupid bug was found in the 
JFFS2 code, so I suppose it's time to admit to the world that it exists.

JFFS2, developed by Red Hat, is a complete reimplementation of a 
journalling filesystem for FLASH devices, based on the original JFFS 
from Axis Communications AB. 

Improvements of JFFS2 over the original JFFS include:

	- Improved wear levelling and garbage collection performance.
	- Compression
	- Improved RAM footprint and response to system memory pressure.
	- Improved concurrency and support for suspending flash erases
	- Support for hard links.
	

You can get it from anonymous CVS:

cvs -d :pserver:anoncvs@cvs.infradead.org:/home/cvs login (password: anoncvs)
cvs -d :pserver:anoncvs@cvs.infradead.org:/home/cvs co mtd
    
The only platform currently supported is Linux 2.4. A port to eCos is 
likely to happen quite soon.

JFFS2 filesystem images of the current 'Familiar' distribution for the
Compaq iPAQ, along with appropriate kernels, are available at 
ftp://ftp.uk.linux.org/pub/people/dwmw2/familiar-0.3/

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
