Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 196XZX-0005vA-5g
	for <linux-mtd@lists.infradead.org>; Fri, 18 Apr 2003 16:14:39 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HDJ00D5OOZRAF@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Fri, 18 Apr 2003 17:14:16 +0200 (MEST)
Date: Fri, 18 Apr 2003 18:14:06 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <001301c305bc$17068680$6b00a8c0@mobile>
To: Paul Wong <paul.wong@digitalview.com>, linux-mtd@lists.infradead.org,
 yaffs list <yaffs@toby-churchill.org>
Message-id: <200304181814.06776.tglx@linutronix.de>
MIME-version: 1.0
References: <001301c305bc$17068680$6b00a8c0@mobile>
Content-type: text/plain; charset=big5
Content-transfer-encoding: 7BIT
Subject: Re: using MEMWRITEOOB problem in NAND flash device
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 18 April 2003 17:06, Paul Wong wrote:
>  Hi All,
>      I want to restore the oob[5] using ioctl(..,MEMWRITEOOB,..) in NAND
>  flash device, but it is failure to write anything. Is any protected
>  condition in NAND.C?
You _CANNOT_ write a 0 bit to 1 on a FLASH chip. This works the other way 
round. If you want to restore your block, remove the santity check in erase 
function of nand.c.

Last answer to this

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
