Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HJdPU-0005vj-9R
	for linux-mtd@lists.infradead.org; Tue, 20 Feb 2007 17:24:48 -0500
Subject: RE: Why is PEB not erased before writing???
From: Thomas Gleixner <tglx@linutronix.de>
To: Gavin Lambert <gavinl@compacsort.com>
In-Reply-To: <037a01c75538$eb2a3590$0502a8c0@gavinlpc>
References: <037a01c75538$eb2a3590$0502a8c0@gavinlpc>
Content-Type: text/plain
Date: Tue, 20 Feb 2007 23:29:21 +0100
Message-Id: <1172010561.25076.11.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-02-21 at 10:48 +1300, Gavin Lambert wrote:
> Quoth Thomas Gleixner [tglx@linutronix.de]:
> > On Tue, 2007-02-20 at 16:41 +0530, Brijesh Singh wrote:
> >> Yes I did enable this CONFIG_MTD_UBI_USERSPACE_IO  option.We can't
> >> write the device if this flag is not enabled.UBI treats the device as
> >> readonly. This  is the usual way to write UBI device,I guess.
> > 
> > No. It is not. It is a _DEBUG_ option. UBI has an update mechanism.
> > See documentation. 
> 
> Perhaps it needs to be named better then :)

1. It is only available, when you enable CONFIG_MTD_UBI_DEBUG

2. From the help text of CONFIG_MTD_UBI_USERSPACE_IO:
"By default, users cannot directly write and erase individual
eraseblocks of dynamic volumes (the update operation must be used
instead). This option enables this capability - this is often useful for
debugging."

Better names are not really preventing PEBKAC scenarios.

	tglx
