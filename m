Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ee5FD-00046R-IQ
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2005 01:33:42 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: yogesh@ureach.com
In-Reply-To: <200511210459.XAA17689@www23.ureach.com>
References: <200511210459.XAA17689@www23.ureach.com>
Content-Type: text/plain
Date: Mon, 21 Nov 2005 07:38:26 +0100
Message-Id: <1132555106.32542.83.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd erase
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2005-11-20 at 23:59 -0500, yogesh shivabasappa wrote:
> Hi,
> 
> Im using intelP30 nor flash(CFI)  in our custom board , im
> registering the flash as mtd  character device. We dont have
> partitions on  it ,  Now i'm writting a util program to perform
> read,write and erase.
> 
> beform performing ioctl ERASE we need to call ioctl MEMGETINFO
> or MEMGETREGIONINFO. Here im confusing between these two ioctls.
> my understaing is, for region erase we need to call
> MEMGETREIONINFO and MEMGETINFO is for non-region-erase .
> 
> can anyone tell me how these two ioctls are differ and which one
> can be used for perfect erase.
> 
> I will appreciate any tips

MTDsource/utils/flash_erase and MTDsource/utils/flash_eraseall are the
utilities you are looking for.

	tglx
