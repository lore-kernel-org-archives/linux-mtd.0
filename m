Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18UN8g-0003fQ-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 Jan 2003 08:25:10 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H8400LG5RGG4K@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Fri, 03 Jan 2003 09:55:29 +0100 (MET)
Date: Fri, 03 Jan 2003 09:52:32 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: compile error when using MEMREADOOB in do_mounts.c.
In-reply-to: <000201c2b2fd$dc75c190$9000010a@paulwong>
To: Paul Wong <paul.wong@digitalview.com>, linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200301030952.32096.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=big5
Content-transfer-encoding: 7BIT
References: <000201c2b2fd$dc75c190$9000010a@paulwong>
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

On Friday 03 January 2003 08:56, Paul Wong wrote:
> Dear All,
>
>     I modified the init/do_mounts.c to want to skip the invalid block. and
> than make bzImage, that result say: undefined reference to 'ioctl'. What is
> the problem?
ioctl is part of userspace library. You can not use glibc functions inside the 
kernel.

What's the deeper sense of  this modification ? Bad block handling is done by 
the filesystem and the mtd drivers.

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
