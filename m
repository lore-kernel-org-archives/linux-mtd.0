Received: from moutng.kundenserver.de ([212.227.126.188])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AlRbh-0005NK-39
	for linux-mtd@lists.infradead.org; Tue, 27 Jan 2004 11:42:13 +0000
Date: Tue, 27 Jan 2004 12:42:06 +0100 (MET)
From: Armin <armin@melware.de>
Sender: <armin@melware.de>
To: John Stirling <js@reciva.com>
In-Reply-To: <1075202627.20473.113.camel@dobblers.nexus.co.uk>
Message-ID: <Pine.LNX.4.31.0401271230320.5586-100000@phoenix.one.melware.de>
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

On 27 Jan 2004, John Stirling wrote:
> I get the same problems with a CVS snapshot about 4 weeks old. The
> errors/warnings are reported on boot up which is disconcerting, but it
> does seem to be working ok if you ignore the errors.

I'm not so sure. I did an ugly test by doing
 #cp file1 file2
and during this command I pushed the reset button.

After bootup and the expected error messages the file2 was
there in an expected size (about half of file1).

Now I tried to remove the "broken" file2, which worked, but
after umount/mount, the file2 was here again. So I was not
able to remove this file.

Armin
