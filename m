Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15uDpE-00067Q-00
	for <linux-mtd@lists.infradead.org>; Thu, 18 Oct 2001 15:07:08 +0100
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Question/suggestion 
Date: Thu, 18 Oct 2001 16:15:27 +0200
Message-ID: <IGEFJKJNHJDCBKALBJLLIEKDEPAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <5445.1003401512@redhat.com>
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

hmm, this is somewhat difficult. I don't have sources handy for umount, nor is umount
compiled with debug turned on.

Any pointers on how to get backtrace working?

 Jocke
> 
> joakim.tjernlund@lumentis.se said:
> >  Don't know. This is the output I get after enabling SysReq in kernel
> > and sending a BREAK-t on the serial port. I am using MV's HHL 2.0.0
> > kernel for a MPC860 
> 
> Hmmm. OK, try working out where the umount process is sleeping. Where's 
> 0x0FF8CA54?
> 
> --
> dwmw2
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
