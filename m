Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EcQkz-0006Rp-RZ
	for linux-mtd@lists.infradead.org; Wed, 16 Nov 2005 12:08:18 -0500
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR003.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IQ2005MX4WFQYD0@VL-MO-MR003.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 16 Nov 2005 12:07:27 -0500 (EST)
Date: Wed, 16 Nov 2005 12:07:27 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <4D6E93075B31154298572E6B73CA849D02DBCC11@noida-mail.bbnet.ad>
To: Achin Gupta <achin.gupta@conexant.com>
Message-id: <Pine.LNX.4.64.0511161206200.14287@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <4D6E93075B31154298572E6B73CA849D02DBCC11@noida-mail.bbnet.ad>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Crash while accessing Intel 28F128 flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 16 Nov 2005, Achin Gupta wrote:

> Hi, 
> I am consistently getting a crash in the "mtd_close" routine whenever I
> try performing any read/write operation on an Intel NOR flash chip on my
> harwdare. I have been trying to run utilities like "flash_info",
> "mtd_debug", "flash_erase" & all of them crash with the following stack
> backtrace :-

What kernel version?

What MTd version?

What additional modifications to your kernel if any?


Nicolas
