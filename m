Received: from desire.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A7f1S-0000pU-5j
	for <linux-mtd@lists.infradead.org>; Thu, 09 Oct 2003 18:56:22 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: "Stephan Linke" <Stephan.Linke@epygi.de>,
	"Eugeny Mints" <eugeny.mints@auriga.ru>
Date: Fri, 10 Oct 2003 07:01:00 +1300
References: <NGENJJFPMHGLPILEKKAMKEIBCDAA.Stephan.Linke@epygi.de>
In-Reply-To: <NGENJJFPMHGLPILEKKAMKEIBCDAA.Stephan.Linke@epygi.de>
MIME-Version: 1.0
Message-Id: <20031009175522.452BB15CB9@desire.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: NAND flash
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 10 October 2003 04:21, Stephan Linke wrote:
> Hi Eugeny,
>
> maybe some problem with the flash "ready" detection?

I do not think so since this is working fine with YAFFS which makes the same 
mtd calls as JFFS2.

Try using the newly announced JFFS2 stuff - that likely addresses some of the 
issues in previous JFFS2 releases.

-- Charles

>
> Stephan
>
> > -----Original Message-----
> > From: linux-mtd-bounces@lists.infradead.org
> > [mailto:linux-mtd-bounces@lists.infradead.org]On Behalf Of Eugeny Mints
> > Sent: Donnerstag, 9. Oktober 2003 17:04
> > To: linux-mtd@lists.infradead.org
> > Cc: Dmitry Pervushin
> > Subject: NAND flash
> >
> >
> > Hello,
> >
> > Could anybody help me to solve such a problem with JFFS2 and NAND flash:
> > - the NAND flash Toshiba TC58256AFTI
> > - kernel 2.4.22 with latest MTD and JFFS2
> > - handy-written miniport for the paticular flash chip
> >
> > The device works OK almost in any case, but when I try to execute  while
> > true; do dd if=/dev/zero of=/dev/mnt/foo count=1000; done after 10-15
> > minutes the system hangs; I cannot login from console or via telnet, but
> > it is still ping'able. I tried to use YAFFS, perform dd to device itself
> > instead of file on the filesystem on top of flash - no hangs were
> > observed.
> >
> > Could anybody help me, please?
> > --
> > cheers, dmitry pervushin
> >
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
