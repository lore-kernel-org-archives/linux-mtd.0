Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZuTWA-0006xM-QD
 for linux-mtd@lists.infradead.org; Thu, 05 Nov 2015 23:00:31 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com,
	alex@nextthing.co
Subject: [RFC] ubihealthd
Date: Thu,  5 Nov 2015 23:59:59 +0100
Message-Id: <1446764403-22742-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ubihealthd is a tiny C program which takes care of your NAND.
It will trigger re-reads and scrubbing such that read-disturb and
data retention will be addressed before data is lost.
Currently the policy is rather trivial. It re-reads every PEB within
a given time frame, same for scrubbing and if a PEB's read counter exceeds
a given threshold it will also trigger a re-read.

At ELCE some people asked why this is done in userspace.
The reason is that this is a classical example of kernel offers mechanism
and userspace the policy. Also ubihealthd is not mandatory.
Depending on your NAND it can help you increasing its lifetime.
But you won't lose data immediately if it does not run for a while.
It is something like smartd is for hard disks.
I did this also in kernel space and it was messy.

[PATCH 1/4] Add kernel style linked lists
[PATCH 2/4] Include new ioctls and struct in ubi-user.h
[PATCH 3/4] Initial implementation for ubihealthd.
[PATCH 4/4] Documentation for ubihealthd
