Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19PKE2-0004p8-Uq
	for <linux-mtd@lists.infradead.org>; Mon, 09 Jun 2003 11:50:07 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HG7008NJNFNTX@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Mon, 09 Jun 2003 12:50:12 +0200 (MEST)
Date: Mon, 09 Jun 2003 13:48:28 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <01d201c32bdb$dde1c9a0$190410ac@gv.com.tw>
To: kevin tseng <kevin@gv.com.tw>, linux-mtd@lists.infradead.org
Message-id: <200306091348.28687.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <01d201c32bdb$dde1c9a0$190410ac@gv.com.tw>
Content-type: text/plain; charset=windows-1252
Content-transfer-encoding: 7BIT
Subject: Re: : jffs2 on nandflash which larger than 64MBytes
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 06 June 2003 05:29, kevin tseng wrote:
> it seems that jffs2+nand on flash>64MBytes is buggy.
> can this be fixed?_?
> thanks in advanced!:)

I have it wroking with 128MB here. Which version of MTD/JFFS2 are you using ?

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
