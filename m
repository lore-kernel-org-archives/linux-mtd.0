Received: from web50806.mail.re2.yahoo.com ([206.190.38.115])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JdgeV-00010H-Sf
	for linux-mtd@lists.infradead.org; Mon, 24 Mar 2008 06:59:28 +0000
Date: Sun, 23 Mar 2008 23:59:26 -0700 (PDT)
From: Mangesh Edake <m_edake@yahoo.com>
Subject: Re: JFFS2 as rootfs on DataFlash
To: michael <trimarchi@gandalf.sssup.it>
In-Reply-To: <47C3C90B.9070605@gandalf.sssup.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <260119.30787.qm@web50806.mail.re2.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Very sorry for getting late to inform you that my
problem got solved.
Actually, flash_eraseall /dev/mtd1 has done the trick.
Now I can mount the JFFS2 as a rootfs, and that works
simply fine.

Thanks Michael, Ricard and the list members for the
help.

--
Thanks and Regards,
Mangesh Edake.


--- michael <trimarchi@gandalf.sssup.it> wrote:

> flash_eraseall /dev/mtd1
> 
> Regards
> Michael
> 
> 



      ____________________________________________________________________________________
Never miss a thing.  Make Yahoo your home page. 
http://www.yahoo.com/r/hs
