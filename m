Received: from tomts12.bellnexxia.net ([209.226.175.56] helo=tomts12-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16BjLj-0002ef-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Dec 2001 21:13:03 +0000
Date: Wed, 5 Dec 2001 16:22:39 -0500 (EST)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: Yunus Shaikh <yshaikh@start-icon.com>
cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Console Messages
In-Reply-To: <004f01c17db9$a78900c0$c801a8c0@starticon>
Message-ID: <Pine.LNX.4.33.0112051617470.27391-100000@server.superbt.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Funny, it sounds like the MTD patch was supposed to suppress the kernel
messages on the console.

The following article
    http://www.linuxjournal.com/article.php?sid=2365

suggested to apply the following command to suppress the kernel messages:

    echo 2 > /proc/sys/kernel/printk

I believe one can change the klogd options to "-c 2" as well.

Ilguiz

On Wed, 5 Dec 2001, Yunus Shaikh wrote:

> After applying the mtd Patch the kernel messages on the console are still
> not suppressed
