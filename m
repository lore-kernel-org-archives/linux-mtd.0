Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 196U5M-0005Gm-Pu
	for <linux-mtd@lists.infradead.org>; Fri, 18 Apr 2003 12:31:16 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
	21 2002)) with SMTP id <0HDJ00AICENHSR@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Fri, 18 Apr 2003 13:30:54 +0200 (MEST)
Date: Fri, 18 Apr 2003 14:30:44 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <E196Twi-0005At-5Z@pentafluge.infradead.org>
To: lhl <lhl@phy.ccnu.edu.cn>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Message-id: <200304181430.44647.tglx@linutronix.de>
MIME-version: 1.0
References: <E196Twi-0005At-5Z@pentafluge.infradead.org>
Content-type: text/plain; charset=gb2312
Content-transfer-encoding: 7BIT
Subject: Re: Does jffs2 still not work for DiskOnChip?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 18 April 2003 13:37, lhl wrote:
> what should I do to make jffs2 on DOC2000?
Write a chip driver for the generic nand driver.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
