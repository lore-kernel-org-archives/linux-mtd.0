Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14pv1i-00078r-00
	for mtd-list@infradead.org; Wed, 18 Apr 2001 17:41:58 +0100
Received: from mail.utfors.se ([195.58.103.125])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14pv1h-00078i-00
	for mtd@infradead.org; Wed, 18 Apr 2001 17:41:57 +0100
Received: from Win1 (hidden-user@[212.105.56.242])
	by mail.utfors.se (8.8.8/8.8.8) with SMTP id SAA12643
	for <mtd@infradead.org>; Wed, 18 Apr 2001 18:41:10 +0200 (MET DST)
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: <mtd@infradead.org>
Subject: JFFS2 as root FS
Date: Wed, 18 Apr 2001 18:41:16 +0200
Message-ID: <001001c0c826$63b43200$0a01a8c0@Win1>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <13711.987580962@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi there


Has anybody managed to get a root FS with JFFS2 to work?

I followed the mtd howto and I have a root partition(with the necessary
files) and
all I get is: "Kernel panic: I have no root and I want to scream"
message.

first I tried to use "rdev zvmlinux /dev/mtdblock1", but
the kernel ignored that an did a NFS mount as usual. I then
specified on the kernel commad line: root=/dev/mtdblock1
and the I got the kernel panic above.

Any Ideas?

    Jocke



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
