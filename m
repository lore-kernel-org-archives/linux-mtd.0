Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173lCv-0005tG-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 May 2002 23:07:17 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.WNT.4.44.0205031453060.1528-100000@tangert-2k.pc.atl.ciena.com> 
References: <Pine.WNT.4.44.0205031453060.1528-100000@tangert-2k.pc.atl.ciena.com> 
To: jm1@angert.net
Cc: linux-mtd@lists.infradead.org
Subject: Re: Eep. Child "ncp.cfg" (ino #344) of dir ino #88 doesn't exist! 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 03 May 2002 23:07:15 +0100
Message-ID: <23795.1020463635@redhat.com>
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

jm1@angert.net said:
> Today we rebooted it with the latest MTD CVS code (as of 5/2/02) and
> got:

> Eep. Child "ncp.cfg" (ino #344) of dir ino #88 doesn't exist!

> in the syslog.

OK, that looks like filesystem corruption of some kind - you have a 
directory entry for inode #344, but the inode itself doesn't exist.

Does it printk any other clues as to why that happened? Nodes with a bad 
CRC, perhaps?

> I am unable to delete the bad entry from the dir inode:

> # perl -e "unlink 'ncp.cfg';" 
> # ls -la 
> ls: ./ncp.cfg: Input/output

That's very odd. Can you print the return code (and errno) of the unlink() 
syscall? That really ought to work.

Can you compile with CONFIG_JFFS2_FS_DEBUG=1, set /proc/sys/kernel/printk 
to 9 and log the kernel's output during mount and unlink attempts?

I assume the old kernel is showing the same behaviour if you reboot back to 
it?



--
dwmw2
