Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZfUQ-0005Fs-00
	for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2002 23:29:14 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <25812.1028036746@www34.gmx.net> 
References: <25812.1028036746@www34.gmx.net>  <Pine.LNX.4.44.0207291211590.20751-100000@server.superbt.com> 
To: Frank Oltmanns <frank.oltmanns.ml@gmx.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Compiling Grub for DOC2000 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 30 Jul 2002 23:29:11 +0100
Message-ID: <14743.1028068151@redhat.com>
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

frank.oltmanns.ml@gmx.de said:
> NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
> ######################################
> # I get this far when I use DoC as the root-fs  #
> ######################################
> Looking up port of RPC 100003/2 on 192.168.1.99
> Looking up port of RPC 100005/1 on 192.168.1.99

Remove the bogus invalidate_device() from the mtdblock_release() function 
in drivers/mtd/mtdblock.c.

--
dwmw2
