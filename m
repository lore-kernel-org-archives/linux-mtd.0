Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 188guJ-0005yF-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Nov 2002 13:04:43 +0000
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H52004C60D9P8@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Mon, 04 Nov 2002 14:34:21 +0100 (MET)
Date: Mon, 04 Nov 2002 14:32:16 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: how to handle the invalid block of the NAND flash?
In-reply-to: <000f01c283ec$cf3a7330$9000010a@paulwong>
To: Paul Wong <paul.wong@digitalview.com>, linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200211041432.16552.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=big5
Content-transfer-encoding: 7BIT
References: <000f01c283ec$cf3a7330$9000010a@paulwong>
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

On Monday 04 November 2002 11:27, Paul Wong wrote:
> Hi! all,
>     I know that the NAND flash memory is not guaranteed to be good in all
> block. Has the MTD/NAND driver handle this condition? If not, how to
> implement this?
>
The NAND driver itself does not handle bad blocks, except that it denies the 
request to erase a bad block. The bad block management has to be done in the 
filesystem layer. There are two NAND aware filesystems: JFFS2 and YAFFS.
See also http://www.linux-mtd.infradead.org/tech/nand.html

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
