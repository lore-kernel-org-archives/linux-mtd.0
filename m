Received: from anchor-post-35.mail.demon.net ([194.217.242.85])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BNUAH-0001pT-6c
	for linux-mtd@lists.infradead.org; Tue, 11 May 2004 11:07:09 +0100
From: "Simon Haynes" <simon@baydel.com>
To: linux-mtd@lists.infradead.org,
              tglx@linutronix.de
Date: Tue, 11 May 2004 10:47:18 +0100
MIME-Version: 1.0
Message-ID: <40A0AF36.7429.C00B3@localhost>
In-reply-to: <200405111053.00541.tglx@linutronix.de>
References: <D9A158B823BE@baydel.com>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: Re: New NAND interface
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11 May 2004 at 10:53, Thomas Gleixner wrote:

> On Monday 10 May 2004 18:35, Simon Haynes wrote:
> > On Monday 10 May 2004 4:32 pm, Thomas Gleixner wrote:
> > > On Monday 10 May 2004 16:04, Simon Haynes wrote:
> > > > I explained, recently, on #mtd, that jffs2 was generating bad
> > > > crc
> > support it and I do regard it as, incomplete, for gereral use.
> 
> In general I try to support every known NAND driver client. I would be
> interested to look into the SSFDC code also to help to fix it so it
> can be included in the source base.
> 

Thomas, 

I will email you the code, if you don't want it just junk it. I had a look at the YAFFS 
stuff last night. As I understand it I could just replace my calls to mtd->read and 
mtd->write with the ecc versions. I would then specify NULL for oob_buf and set 
oobinfo->useecc to MTD_NANDECC_OFF. 

Then I could put the NAND driver back to normal.


Thanks

Simon. 
__________________________

Simon Haynes - Baydel 
Phone : 44 (0) 1372 378811
Email : simon@baydel.com
__________________________
