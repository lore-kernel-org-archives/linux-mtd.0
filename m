Received: from law14-oe49.law14.hotmail.com ([64.4.20.21] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19evKl-0003uq-Tc
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jul 2003 12:29:32 +0100
From: "Vikram Mehta" <vm6580@hotmail.com>
To: "mtd" <linux-mtd@lists.infradead.org>
Date: Tue, 22 Jul 2003 17:02:36 -0700
MIME-Version: 1.0
Message-ID: <Law14-OE49bFP9qM5Jy00011206@hotmail.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Garbage Collection thread questions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Folks,

I am trying to solve the problem of  mount-crashing-the-system problem.

1.) The GC thread written in background.c is primarily a optimization.

So can I avoid using it for the time being.
I am almost certain that GC is the  problem for my mount crashing the system

2.) Kernel_thread used in background.c makes a new thread  .. right?
But I have read that in uClinux, parent and child thread have the same
stack. ( Correct me if I am wrong anywhere)
So if the stack space is the same, will not one thread curropt the return
addresses etc of hte other thread.

So iun uClinux , how do I make sure this does not happen. I am getting
little confused here


Hep me here

Vikram Mehta
