Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14dqyR-00056g-00
	for mtd-list@infradead.org; Fri, 16 Mar 2001 09:56:43 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14dqyP-00056a-00
	for mtd@infradead.org; Fri, 16 Mar 2001 09:56:42 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Cc: nico@cam.org, ebrower@usa.net
Subject: WARNING: changes to struct mtd_info.
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 16 Mar 2001 09:56:21 +0000
Message-ID: <449.984736581@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I'm about to change some of the 'unsigned long' types in the struct 
mtd_info to 'u32', to make the sparc64 ioctl conversion for 32-bit userland 
easier. Shout now if you object.

This shouldn't affect anyone on 32-bit platforms.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
