Received: from [152.101.51.1] (helo=janus.hk.panelx.com)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 196joV-0007r9-BB
	for <linux-mtd@lists.infradead.org>; Sat, 19 Apr 2003 05:18:55 +0100
Message-ID: <005001c3062a$c366c070$9000010a@paulwong>
From: "Paul Wong" <paul.wong@digitalview.com>
To: <tglx@linutronix.de>,
	<linux-mtd@lists.infradead.org>,
	"yaffs list" <yaffs@toby-churchill.org>
References: <001301c305bc$17068680$6b00a8c0@mobile>
	<200304181814.06776.tglx@linutronix.de>
Date: Sat, 19 Apr 2003 12:18:41 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: 7bit
Subject: Re: using MEMWRITEOOB problem in NAND flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks. I got it.

Paul
----- Original Message -----
From: "Thomas Gleixner" <tglx@linutronix.de>
To: "Paul Wong" <paul.wong@digitalview.com>;
<linux-mtd@lists.infradead.org>; "yaffs list" <yaffs@toby-churchill.org>
Sent: Saturday, April 19, 2003 12:14 AM
Subject: Re: using MEMWRITEOOB problem in NAND flash device


> On Friday 18 April 2003 17:06, Paul Wong wrote:
> >  Hi All,
> >      I want to restore the oob[5] using ioctl(..,MEMWRITEOOB,..) in NAND
> >  flash device, but it is failure to write anything. Is any protected
> >  condition in NAND.C?
> You _CANNOT_ write a 0 bit to 1 on a FLASH chip. This works the other way
> round. If you want to restore your block, remove the santity check in
erase
> function of nand.c.
>
> Last answer to this
>
> --
> Thomas
> ________________________________________________________________________
> linutronix - competence in embedded & realtime linux
> http://www.linutronix.de
> mail: tglx@linutronix.de
>
>
> --------------------------------------------------------------------------
-------------
> This mailing list is hosted by Toby Churchill open software
(www.toby-churchill.org).
> If mailing list membership is no longer wanted you can remove yourself
from the list by
> sending an email to yaffs-request@toby-churchill.org with the text
"unsubscribe"
> (without the quotes) as the subject.
>
>
