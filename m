Received: from rezznor.smb.utfors.se ([195.58.112.22])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17c7T7-0006sh-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 17:46:01 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: "Dave Ellis" <DGE@sixnetio.com>,
	<linux-mtd@lists.infradead.org>
Subject: RE: Disk blocks for long periods 
Date: Tue, 6 Aug 2002 18:45:59 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLAEIIFFAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <30768.1028636087@redhat.com>
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

> 
> spin_lock_bh() should not disable interrupts, only bottom-halves. It was 
> used to protect against timers, because we intend(ed) to have the erase 
> completion done from a timer. At the moment there's no real need to use 
> anything but spin_lock().

Can the JFFS2 layer also use spin_lock() instead of spin_lock_bh()?
Shold we try not to disable bottom-halves or does it not matter?

BTW,
     I just did a test, ran this some 20 times:
     #> time cp tstfile tmp1 & time cp file tmp2 & time cp file tmp3 &
     sometimes I removed the tmp1,tmp2 and tmp3 files before running it.

     if I rm the files first it takes 10 seconds to complete and if I don't
     it takes 20 seconds. It's a bit much I think.

I have set kupdate to run every .5 second   
tstfile is 581K

 Jocke



> 
> 
> --
> dwmw2
> 
> 
> 
