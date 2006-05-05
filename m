Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1Fbvgx-0005Xz-LQ
	for linux-mtd@lists.infradead.org; Fri, 05 May 2006 04:29:43 -0400
Message-ID: <445B0CF1.8020400@arcom.com>
Date: Fri, 05 May 2006 09:29:37 +0100
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: Dan Merillat <harik.attar@gmail.com>
References: <c0c067900605031926w730bc9a3sed5c7eee03585b2b@mail.gmail.com>
In-Reply-To: <c0c067900605031926w730bc9a3sed5c7eee03585b2b@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: CFI Extended (Intel P30) problems on an ARM PXA255
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dan Merillat wrote:
> I originally sent this to the linux-arm list, but it's looking more
> and more like either a MTD issue, or a hardware issue with our board.
> 
> We have a custom PXA255 board, based on the generic Intel reference
> design.  Nothing very
> complex at all.   RAM, Strataflash (P30), JTAG and a serial port is
> all I have active at this point.
> 
> Everything works correctly, until I try to write to the filesystem. As
> soon as I do, I start getting JFFS corruption notices.  It's fairly
> obvious what's wrong: All reads are returning 0x0080, the 'Ok' status
> bit.   I can break in the jtag, write a reset to the flash, and
> continue, and new reads work properly, until I write again (or the
> original write retries).

Perhaps the cache invalidating operation in the MTD map driver you're
using is wrong?

> I thought it might be a memory timing issue, but I pulled the timing
> register (MSC0) and applied the faster timings to u-boot, and it can
> still read and write the flash properly.    System speed and memory
> speed are also the same (200mhz/100mhz) for both u-boot and linux.

If you suspect memory timings may be an issue I would advise slowing the
timings under Linux to the lowest possible.  The experiment you describe
here changes two variables (the software and the timings) which is not
good practice.

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/
