Received: from e1.ny.us.ibm.com ([32.97.182.141])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L9L5N-0004ub-SI
	for linux-mtd@lists.infradead.org; Sun, 07 Dec 2008 14:58:18 +0000
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e1.ny.us.ibm.com (8.13.1/8.13.1) with ESMTP id mB7EvfvB025303
	for <linux-mtd@lists.infradead.org>; Sun, 7 Dec 2008 09:57:41 -0500
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	mB7EwGSd153590
	for <linux-mtd@lists.infradead.org>; Sun, 7 Dec 2008 09:58:16 -0500
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	mB7EwGpR025131
	for <linux-mtd@lists.infradead.org>; Sun, 7 Dec 2008 09:58:16 -0500
Received: from zod.rchland.ibm.com (sig-9-65-59-95.mts.ibm.com [9.65.59.95])
	by d01av01.pok.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	mB7EwFCg025113
	for <linux-mtd@lists.infradead.org>; Sun, 7 Dec 2008 09:58:16 -0500
Date: Sun, 7 Dec 2008 09:58:11 -0500
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: linux-mtd@lists.infradead.org
Subject: UBI/DVB ioctl conflict?
Message-ID: <20081207095811.13b51cca@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I received a bug report where someone noticed that the UBI ioctls can
conflict with the dvb subsystem.  Looking it over, it seems that both
subsystems use 'o' as the magic, and do have a set of somewhat
conflicting sequence numbers as the secondary arg.

Is this a problem?

josh
