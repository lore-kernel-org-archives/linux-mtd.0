Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14s1qP-000702-00
	for mtd-list@infradead.org; Tue, 24 Apr 2001 13:23:01 +0100
Received: from mail.utfors.se ([195.58.103.125])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14s1qO-0006zw-00
	for mtd@infradead.org; Tue, 24 Apr 2001 13:23:00 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "'Vipin Malik'" <vipin.malik@daniel.com>, <mtd@infradead.org>
Subject: RE: JFFS2 as root FS
Date: Tue, 24 Apr 2001 14:22:10 +0200
Message-ID: <001401c0ccb9$30483af0$0a01a8c0@Win1>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <3AE43929.3695C91D@daniel.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi again

Now that my JFFS2 FS mounts properly&speedy(less than 5 seconds) I try
to use it as a root FS and I got this:

....
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
VFS: Mounted root (jffs2 filesystem) readonly.
Freeing unused kernel memory: 48k init
INIT: version 2.77 booting
INIT: cannot execute "/etc/rc.sysinit"

The /etc/rc.sysinit file is there and executable, so why won't init execute
it?

        Jocke



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
