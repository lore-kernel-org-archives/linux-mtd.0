Received: from [203.63.104.245] (helo=cobalttech.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A6dQx-0000f3-Fx
	for <linux-mtd@lists.infradead.org>; Mon, 06 Oct 2003 23:02:27 +0100
Date: Tue, 7 Oct 2003 08:00:51 +1000 (EST)
From: Michael McLellan <mikey@bur.st>
To: Slim <slimaffi@yahoo.com>
In-Reply-To: <20031006213435.38037.qmail@web9906.mail.yahoo.com>
Message-ID: <Pine.LNX.4.53.0310070758050.1614@slop.cobalttech.com>
References: <20031006213435.38037.qmail@web9906.mail.yahoo.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: linux-mtd@lists.infradead.org
Subject: Re: redhat 9, doc 2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 6 Oct 2003, Slim wrote:
>
> I've tried now to boot the hard disk based kernel to allow editing to
> try the above, but the doc-grub always loads despite changing the boot
> device in the bios setup.  Now I can't boot from the hard drive unless I
> disable all access to the doc.  Any workaround?

When you get to the grub shell you can do something like:

root (hd0)
chainloader +1
boot

This will make grub start booting from the first sector of hd0, which is
probably where your harddisk is.

This is where I'm up to, I cannot get grub to recognise the DoC, the only
devices I have avalible is (fd0) and (hd0) :(

Mikey.
