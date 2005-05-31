Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dd5nJ-0005jO-FK
	for linux-mtd@lists.infradead.org; Tue, 31 May 2005 08:24:30 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Clemens Koller <clemens.koller@anagramm.de>
In-Reply-To: <429C5347.1080208@anagramm.de>
References: <429C5347.1080208@anagramm.de>
Content-Type: text/plain
Date: Tue, 31 May 2005 14:25:07 +0200
Message-Id: <1117542307.14566.79.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Oops on rmmod mtdblock module while in dev dir.
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-05-31 at 14:06 +0200, Clemens Koller wrote:
> Unfortunately, when I try to rmmod mtdblock while I am cd'd into
> /dev/mtdblock, I get a little Oops like this:

>  c12dfcc0 TRAP: 0700    Tainted: P
-------------------------^^^^^^^^^^

Please read linux/Documentation/oops-tracing.txt section Tainted kernels

> May 31 13:43:20 ecam kernel: NIP [c0090d20] sysfs_remove_dir+0x28/0x184

Thats not a problem of mtd. Its a problem of sysfs/devfs

tglx
