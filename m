Received: from mailout.fastq.com ([204.62.193.66])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ZIR6-0000AQ-Bk
	for <linux-mtd@lists.infradead.org>; Sun, 06 Jul 2003 23:56:48 +0100
Received: from aquaman (foobar@russ.gothicfury.com [65.39.81.227])
	h66Mv1D72541	for <linux-mtd@lists.infradead.org>;
	Sun, 6 Jul 2003 15:57:02 -0700 (MST)
	(envelope-from Russ.Dill@asu.edu)
From: Russ Dill <Russ.Dill@asu.edu>
To: manningc2@actrix.gen.nz
In-Reply-To: <20030706222358.8B57143EF@blood.actrix.co.nz>
References: <000001c34351$aa810520$239efea9@who5>
	 <1057473735.2659.247.camel@localhost>
	 <20030706222358.8B57143EF@blood.actrix.co.nz>
Message-Id: <1057532291.2663.298.camel@localhost>
Mime-Version: 1.0
Date: 06 Jul 2003 15:58:11 -0700
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: Gregg C Levine <hansolofalcon@worldnet.att.net>
Subject: Re: File systems and Disk on Chips
Reply-To: Russ.Dill@asu.edu
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> >
> > Basically, you put a block filesystem on top of NFTL that grub
> > understands. Grub does not at this point understand YAFFS or JFFS2 on
> > NAND flash, but I'm sure there a lot of people who are looking for that
> > and it wouldn't be difficult to do.
> 
> There is a YAFFS bootloader in CVS. Integrating into any loader (eg. grub) 
> should not be a big effort. estimate less than a day.

you haven't touched much grub code, have you?

-- 
Russ Dill <Russ.Dill@asu.edu>
