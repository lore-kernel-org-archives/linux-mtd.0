Received: from ash.lnxi.com ([207.88.130.242] helo=DLT.linuxnetworx.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16VOSV-0001Jc-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 Jan 2002 02:57:19 +0000
To: <linux-mtd@lists.infradead.org>
Subject: [RFC] changing module_init to subsys_initcall...
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 28 Jan 2002 20:08:22 -0700
Message-ID: <m34rl5yhuh.fsf@DLT.linuxnetworx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

In 2.5.3-pre4 I belive multiple priorities of initcalls were added
to the linux kernel.  Would anyone have a problem with changing
module_init(x) to subsys_initcall(x) in the core mtd modules?

I have had problems in the past where an mtd driver not under
drivers/mtd had the problem that it would not work when everything was
compiled into the kernel.  And this looks like any easy fix.

Eric
