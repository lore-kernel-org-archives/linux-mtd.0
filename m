Received: from [67.15.60.3] (helo=mail.aftek.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E674R-000867-St
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2005 09:38:09 -0400
Message-ID: <43068933.1080609@aftek.com>
Date: Sat, 20 Aug 2005 07:06:51 +0530
From: Ashwin Chaugule <ashwinc@aftek.com>
MIME-Version: 1.0
To: tglx@linutronix.de,  linux-mtd@lists.infradead.org
References: <430675EB.9030905@aftek.com>
	<1124457591.23647.382.camel@tglx.tec.linutronix.de>
In-Reply-To: <1124457591.23647.382.camel@tglx.tec.linutronix.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: is this a bug ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:

>Uurg. RTFM !
>
>There are at least two sane ways to do that without touching the kernel
>code.
>
>- Documentation/kernel-parameters.txt (hint: rootflags)
>  
>
In 2.6.12-2 my cmdline is ..

CONFIG_CMDLINE="root=/dev/mtdblock1 rootfstype=jffs2 init=/bin/sh console=ttyS0,38400 mem=32M"


Jffs2 mounts just fine. No rootflags changes anywhere !



Cheers,
Ashwin
