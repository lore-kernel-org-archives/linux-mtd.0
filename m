Received: from phoenix.infradead.org ([2001:8b0:10b:1:2c0:f0ff:fe31:e18])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D9Q0N-0002uQ-19
	for linux-mtd@lists.infradead.org; Thu, 10 Mar 2005 10:55:19 -0500
Date: Thu, 10 Mar 2005 15:54:55 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Konstantin Kletschke <lists@ku-gbr.de>
In-Reply-To: <20050310152212.GB4910@synertronixx3>
Message-ID: <Pine.LNX.4.58.0503101554220.5450@phoenix.infradead.org>
References: <20050309131453.GA2497@synertronixx3>
	<Pine.LNX.4.58.0503101314570.4649@phoenix.infradead.org>
	<20050310152212.GB4910@synertronixx3>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 with sync burst mode
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 10 Mar 2005, Konstantin Kletschke wrote:
> The image is dumped from another embedded system running fine
> with this image, it was halted and then dumped with the bootloader onto
> PC. Its no difference if this image is then flashed or dd'ed

OK, why does this mean JFFS2 is guilty of this? Why don't you suspect your 
drivers? Why don't you suspect that you flashed your (say, correct) image 
incorrectly?

> Well if I figure out how to do this and what to do to test I will try.
Just configure your kernel properly: switch on the "Test driver using RAM" 
(MTD_MTDRAM) option in your kernel configuration. Type "modprobe mtdram" 
if you have configured it as the kernel module.

If you do this your JFFS2 will work over emulated 4MiB in-RAM flash and 
this will help you to exclude driver problems.

HTH, Artem.

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
