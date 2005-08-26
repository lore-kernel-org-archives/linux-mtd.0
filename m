Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E8c2H-0002H5-Eb
	for linux-mtd@lists.infradead.org; Fri, 26 Aug 2005 07:06:38 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Adil Hafeez <adilhafeez80@gmail.com>
In-Reply-To: <82e4189c05082603546248689a@mail.gmail.com>
References: <82e4189c05082603546248689a@mail.gmail.com>
Content-Type: text/plain
Date: Fri, 26 Aug 2005 13:07:02 +0200
Message-Id: <1125054422.20120.153.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Flash erase wait time
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-08-26 at 15:54 +0500, Adil Hafeez wrote:
> Was it really required to double check the polarity bit, or there are
> some timeout timer issues with my mips port ?

1. We have no idea, which version of cfi_cmset_0002.c you are using.
Please provide the $Id string on top of the file. The kernel version and
the applied patches on top of this kernel.

2. If you send patches, read linux/Documentation/SubmittingPatches first

3 . From your patch:

file: /home/embedded/linux-2.4.20_palmchip/drivers/mtd/chips/cfi_cmdset_0002.c,v

Please read
http://www.linux-mtd.infradead.org/source.html#kernelversions

tglx
