Received: from main.gmane.org ([80.91.229.2])
	by pentafluge.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CQD36-0000Ly-LM
	for linux-mtd@lists.infradead.org; Fri, 05 Nov 2004 22:59:17 +0000
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1CQD35-0006ik-00
	for <linux-mtd@lists.infradead.org>; Fri, 05 Nov 2004 23:59:15 +0100
Received: from dsl081-242-215.sfo1.dsl.speakeasy.net ([64.81.242.215])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 05 Nov 2004 23:59:15 +0100
Received: from dave-gnus by dsl081-242-215.sfo1.dsl.speakeasy.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 05 Nov 2004 23:59:15 +0100
To: linux-mtd@lists.infradead.org
From: David Wuertele <dave-gnus@bfnet.com>
Date: Fri, 05 Nov 2004 14:59:11 -0800
Message-ID: <m3wtwznbr4.fsf@bfnet.com>
References: <m33bzonifa.fsf@bfnet.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: news <news@sea.gmane.org>
Subject: Re: in situ MTD upgrade from userspace (kernel, CRAMFS, YAFFS)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 1.  There are many other processes running at the time of the upgrade.
>     They are running out of CRAMFS.  As I overwrite the CRAMFS
>     partition, is it possible that my write could get corrupted?
>     Perhaps by crashing programs that inadvertently do weird syscalls?

Corollary question:

  As my own userspace process overwrites the CRAMFS block that
  contains that process's program, how can I ensure that the process
  doesn't get hosed until after it has a chance to reboot the system?
