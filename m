Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15uAH9-0005ly-00
	for <linux-mtd@lists.infradead.org>; Thu, 18 Oct 2001 11:19:44 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Question/suggestion 
Date: Thu, 18 Oct 2001 12:27:54 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLEEKAEPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <2124.1003399750@redhat.com>
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

> joakim.tjernlund@lumentis.se said:
> > > There's no real reason for it to do so - can you get a backtrace
> > > (SysRq-T) and find out what it's waiting for? That should be fixable.
> 
> > OK, here it is:
> 
> > root@localhost:~# umount /jffs2/ 
> > SysRq: Show State
> 
> Why are there no call traces in that?  

Don't know. This is the output I get after enabling SysReq in kernel and
sending a BREAK-t on the serial port. I am using MV's HHL 2.0.0 kernel for a MPC860

 Jocke

> --
> dwmw2
> 
> 
