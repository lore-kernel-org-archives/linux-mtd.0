Received: from law14-oe29.law14.hotmail.com ([64.4.20.86] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19gycA-0004qQ-Ef
	for <linux-mtd@lists.infradead.org>; Mon, 28 Jul 2003 04:23:58 +0100
From: "Vikram Mehta" <vm6580@hotmail.com>
To: "mtd" <linux-mtd@lists.infradead.org>
Date: Mon, 28 Jul 2003 08:57:15 -0700
MIME-Version: 1.0
Message-ID: <Law14-OE29aWNsvt8KB0000669b@hotmail.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: GC thread problem during mount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

Please help me here

IN mounts done successfully, the mount process stops after the message GC
thread sleeping . When However, the mount process goes further does the
problem arise.

IN mounts that still go on after the GC thread sleeps, I get a message
Kernel bug in exit.c line 465. The exception raised is in switch_to macro
used in schedule() which actually executes some assembly code to switch the
processes.

In mounts that go on after GC thread is sleeping, thread_should_wake() is
called again and then messages appear
Starting erase of pending block 0x00040000 etc.


Whay can you infer from this.

Vikram
