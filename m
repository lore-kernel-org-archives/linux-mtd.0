Received: from dsl-210-15-250-78.nsw.netspace.net.au ([210.15.250.78]
	helo=mail.magtech.com.au)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Daqck-0006Rf-9m
	for linux-mtd@lists.infradead.org; Wed, 25 May 2005 03:48:21 -0400
Received: from mail.magtech.com.au (localhost [127.0.0.1])
	by localhost.magtech.com.au (Postfix) with ESMTP id 0AE9162D7E9
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 May 2005 17:48:02 +1000 (EST)
Received: from [192.168.65.196] (unknown [192.168.65.196])
	by mail.magtech.com.au (Postfix) with ESMTP id 420CD62D7E9
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 May 2005 17:48:01 +1000 (EST)
Message-ID: <42942DB0.2010801@magellan-technology.com>
Date: Wed, 25 May 2005 17:48:00 +1000
From: Aras Vaichas <arasv@magellan-technology.com>
MIME-Version: 1.0
To: MTD-LIST <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: how to write to an entire NOR Flash at once
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I need to remotely upgrade some old systems:

from:
* Kernel 2.2, NOR Flash, kernel and applications spread over several MTD
parititions using JFFS1, custom bootloader

to:
* Kernel 2.6, adding u-boot and using JFFS2 instead of JFFS1. I have the new
system up and running with no problems. The MTD partition map will change
radically from the old one.

The old systems have an upgrade mechanism in place where by TFTP'ing a file
into a directory and then rebooting will cause that file to be unpacked and
placed into the application directory and then executed. Therefore I can run
any script or file that I wish to on these systems and it will be run as root.

What I am thinking of doing is to take a copy of the entire NOR flash from the
new system and copy it into the NOR Flash on the old system and reboot. Since
the MTD parititions won't be aligned between the old and new system, I will
need to write the entire NOR Flash in one go - at which point the system will
lose its brains and will need to be reset and hopefully start a new life as a
2.6 system.

What is the best way to do this? Do I need to write a 2.2 kernel module that
will allow me raw access to the NOR Flash or can I do this from userspace?

regards,

Aras Vaichas
