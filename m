Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DEGYs-0008H3-4z
	for linux-mtd@lists.infradead.org; Wed, 23 Mar 2005 19:50:58 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Aras Vaichas <arasv@magellan-technology.com>
In-Reply-To: <42420354.5000407@magellan-technology.com>
References: <42420354.5000407@magellan-technology.com>
Content-Type: text/plain
Date: Thu, 24 Mar 2005 01:50:51 +0100
Message-Id: <1111625452.4010.175.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD-LIST <linux-mtd@lists.infradead.org>
Subject: Re: flashcp problem when called via execlp
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-03-24 at 11:01 +1100, Aras Vaichas wrote:
> Hello,
> 
> I'm calling "flashcp" from a utility in order to write a file to a NOR flash 
> device. When I call flashcp from my utility, it doesn't work properly.
> 
> In my utility I create a temporary file, fill it with data and then I call 
> flashcp via execlp like so:
> 
> execlp( "flashcp", "flashcp", filenamep, MTDFILE, (char *)0 );

I doubt, that flashcp executes different when executed via execlp.

> $ flashcp uenv_Zdp5Bp /dev/mtd/2 && hexdump /dev/mtd/2

Is the file created by your utility ? If not, then your file creation is
broken.

tglx
