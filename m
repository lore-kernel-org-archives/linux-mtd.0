Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14rZeT-0002WX-00
	for mtd-list@infradead.org; Mon, 23 Apr 2001 07:16:49 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "'David Schleef'" <ds@schleef.org>
Cc: "'David Woodhouse'" <dwmw2@infradead.org>, <mtd@infradead.org>
Subject: RE: JFFS2 as root FS
Date: Mon, 23 Apr 2001 08:15:36 +0200
Message-ID: <000e01c0cbbc$d0368ce0$0a01a8c0@Win1>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20010422185223.A7345@stm.lbl.gov>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Thanks!

I will give it a spin during the week.

 Jocke

-----Original Message-----
From: owner-mtd@infradead.org [mailto:owner-mtd@infradead.org]On Behalf
Of David Schleef
I just checked it in, along with a man page describing the various
options as I understand them.  I also wrote a little shell script
that creates a test filesystem and compares it to a reference
filesystem.  The reference filesystems were created on i386 and
powerpc hosts before I made the endianness changes.  The limit
of my testing is creating a BE JFFS2 filesystem on an i386 and
comparing it to the reference filesystem -- they were identical,
so I called the operation a success.  I'll check in the test
script in the next couple days.




dave...



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
