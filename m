Received: from moutng.kundenserver.de ([212.227.126.171])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AlV5e-0007aq-PV
	for linux-mtd@lists.infradead.org; Tue, 27 Jan 2004 15:25:22 +0000
Date: Tue, 27 Jan 2004 16:25:15 +0100 (MET)
From: Armin <armin@melware.de>
Sender: <armin@melware.de>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1075209322.1633.50.camel@hades.cambridge.redhat.com>
Message-ID: <Pine.LNX.4.31.0401271621070.6742-100000@phoenix.one.melware.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: linux-mtd@lists.infradead.org
Subject: Re: fix jffs2 data errors ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 27 Jan 2004, David Woodhouse wrote:
> On Tue, 2004-01-27 at 12:42 +0100, Armin wrote:
> > Now I tried to remove the "broken" file2, which worked, but
> > after umount/mount, the file2 was here again. So I was not
> > able to remove this file.
>
> If this is reproduceable, please do so with CONFIG_JFFS2_FS_DEBUG=1,
> logging all messages over a serial console. Show the output (you may
> need to boot with 'debug' on the command line) while the file system is
> mounted, the offending file unlinked, and then capture the output while
> the file system is mounted a second time. If possible, take snapshots of
> the flash before each mount attempt.

I just updated my kernel with your latest changes in cvs and it looks very
good.

I cannot reproduce the problem any more, so it seems to work
with Howards fix!

Thanks for the quick help.

Armin
