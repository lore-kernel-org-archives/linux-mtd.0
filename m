Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13N278-0005JJ-00
	for mtd-list@infradead.org; Fri, 11 Aug 2000 00:51:54 +0100
Received: from [206.57.94.212] (helo=devel.ftel.com)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13N276-0005JD-00
	for mtd@infradead.org; Fri, 11 Aug 2000 00:51:53 +0100
Message-Id: <200008102356.QAA02347@devel.ftel.com>
Date: Thu, 10 Aug 2000 16:56:41 -0700 (MST)
To: dwmw2@redhat.com
Cc: sigurdur@ifi.uio.no, mtd@infradead.org
From: Mike Kilburn <mkilburn@ftel.net>
Subject: Re[2]: Has MTD production quality support for DOC2000?
In-Reply-To: <5585.965911459@cygnus.co.uk>
MIME-Version: 1.0
Content-Type: text/plain
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse <dwmw2@redhat.com> wrote:
> 
> Linking the M-Systems drivers into your kernel will place _you_ in violation
> of the GPL and you may be sued, so why not help out with the MTD drivers?
> 

Also, last I checked, the M-Systems driver disables interrupts for quite
a long time while writing to the device. This makes it unusable in
a real-time embedded system. Switch to a SanDisk if you can.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
