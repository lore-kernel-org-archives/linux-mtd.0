Received: from snifit.smb.utfors.se ([195.58.112.20])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18YN7L-0000Sz-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Jan 2003 09:12:19 +0000
Received: from LUMENTIS02 ([212.105.56.242])
 by snifit.smb.utfors.se (iPlanet Messaging Server 5.2 Patch 1 (built Aug 19
 2002)) with SMTP id <0H8P00092700LY@snifit.smb.utfors.se> for
 linux-mtd@lists.infradead.org; Tue, 14 Jan 2003 10:43:12 +0100 (MET)
Date: Tue, 14 Jan 2003 10:43:12 +0100
From: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
Subject: RE: Display Unchecked space...
In-reply-to: <IGEFJKJNHJDCBKALBJLLEEFCFJAA.joakim.tjernlund@lumentis.se>
To: Steve Tsai <startec@ms11.hinet.net>,
 Linux MTD mailing list <linux-mtd@lists.infradead.org>
Reply-to: joakim.tjernlund@lumentis.se
Message-id: <IGEFJKJNHJDCBKALBJLLEEFDFJAA.joakim.tjernlund@lumentis.se>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
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
> 
> Hi Steve 
> 
> I got the same yesterday. I am using the preempt patch and the cfi_cmdset0001.c
> driver. I guessing it's a locking problem, but now I not that sure anymore, I
> don't think uClinux can do preempt? What's your CVS version of jffs2/write.c

I meant jffs2/nodelist.c, not jffs2/write.c.
 
> and cfi_cmdset0001.c(if you use that driver)?
> 
> Can you repeat it?
> 
>  Jocke 
> > 
> > 
> > Hi,
> > 
> > I download the latest cvs code and build it in uClinux. After running
> > two days, I got "kernel BUG at gc.c:136! Checked all inodes but still
> > 0x6a0 bytes of unchecked space?" and it will continue display the
> > message and halt the system. I set CONFIG_JFFS2_FS_DEBUG=1, but I did
> > not get any useful messages. Does anyone can tell me why the kernel BUG
> > will display? Could I solve the system halt, even "unchecked space"
> > occurs? Thanks.
> > 
> > Steve Tsai
> > 
> > 
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> > 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
