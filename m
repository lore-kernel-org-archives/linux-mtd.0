Received: from hex.linuxgrrls.org ([212.18.228.73] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Zw6v-0007EC-00
	for <linux-mtd@lists.infradead.org>; Sun, 10 Feb 2002 15:41:49 +0000
Date: Sun, 10 Feb 2002 15:51:42 +0000 (GMT)
From: kira brown <kira@hex.linuxgrrls.org>
To: Derek Ross <dross@iders.ca>
Cc: David Woodhouse <dwmw2@infradead.org>,
	<linux-mtd@lists.infradead.org>
Subject: Re: Is realtime logging possible?
In-Reply-To: <002501c1b17b$80b65010$87657bc8@athlon>
Message-ID: <Pine.LNX.4.33.0202101550590.6009-100000@hex.linuxgrrls.org>
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


On Sat, 9 Feb 2002, Derek Ross wrote:

> Is it possible for a filesystem to coexist with
> low-level reading, writing and erasing?  Maybe by
> specifying in advance which sectors are forbidden
> to the filesystem.

or in other words, by partitioning the flash, which is supported by the
MTD stuff.

k.
