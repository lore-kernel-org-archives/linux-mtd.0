Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14tuhV-0000lj-00
	for mtd-list@infradead.org; Sun, 29 Apr 2001 18:09:37 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14tuhT-0000ld-00
	for mtd@infradead.org; Sun, 29 Apr 2001 18:09:36 +0100
Received: from dwmw2 (helo=redhat.com)
	by passion.cambridge.redhat.com with local-esmtp (Exim 3.16 #2)
	id 14tugr-0006JW-00
	for mtd@infradead.org; Sun, 29 Apr 2001 18:08:57 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: mtd@infradead.org
Subject: Administrivia: List changes
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 29 Apr 2001 18:08:57 +0100
Message-ID: <24273.988564137@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I've managed to get the new machine up and running, and I'll be switching 
the list over to mailman some time in the near future.

This will affect people doing automatic filtering of list mail into folders.

Instead of having an envelope sender <owner-mtd@infradead.org> it'll be
<linux-mtd-admin@lists.infradead.org>

Filtering on Return-path: or Sender: (depending on your local MTA) which 
matches ".*mtd.*@.*infradead.org" should match both old and new lists.

I'll transfer all current members to the new list and make the old address 
work, but the new list address will be <linux-mtd@lists.infradead.org>.

Don't start using that yet - this is just an advance warning to let people 
change procmail or other filter files.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
