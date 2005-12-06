Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EjaJf-0006Zu-To
	for linux-mtd@lists.infradead.org; Tue, 06 Dec 2005 05:45:01 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <439569AC.8080409@ru.mvista.com>
References: <438FF22A.2060203@ru.mvista.com>
	<1133865021.16302.37.camel@tglx.tec.linutronix.de>
	<439569AC.8080409@ru.mvista.com>
Content-Type: text/plain
Date: Tue, 06 Dec 2005 11:51:01 +0100
Message-Id: <1133866261.16302.49.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd/utils: sync with MTD ioctl interface rework to get
	rid of MEMGETOOBSEL/MEMSETOOBSEL
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-12-06 at 13:36 +0300, Vitaly Wool wrote:
> >2. Your current approach prevents me to
> >- dump the raw flash content including OOB data
> >- write a nand image with given oob data
> >
> >This is essential for troubleshooting and must still be possible
> >somehow.
> >
> Lemme disagree with you here. Raw OOB content-related stuff is not IMHO 
> the thing to debug from userland.
> Suggest prinitng out the raw OOB contents for MTD_DEBUG_LEVEL3 instead.

Uuurg. Do you really want do analyse 20MB crappy formatted printk
output?

We want output from live systems without requesting the user to
recompile the kernel and setup capturing scenarios. 

We tracked down problems in the past by asking for a simple

nanddump /dev/mtdX >file.dmp

and I really want to keep it that way. Its simple, proven and people can
handle it.

	tglx
