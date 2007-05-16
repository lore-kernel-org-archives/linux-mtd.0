Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HoMiA-00035M-PY
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 12:51:08 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HoMhq-0004M1-J5
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 18:50:30 +0200
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 May 2007 18:50:30 +0200
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 16 May 2007 18:50:30 +0200
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: Problems with ST NAND512W3A nand flash
Date: Wed, 16 May 2007 16:50:16 +0000 (UTC)
Message-ID: <loom.20070516T184549-325@post.gmane.org>
References: <464B17F3.9040804@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Savin Zlobec <savinz <at> users.sourceforge.net> writes:

> 
> Hi All!
> 
> I am working on a AT91RM9200 based board with ST NAND512W3A2B flash.
> Kernel version is 2.6.19.7 with patches from maxim.org.za/at91_26.html.
> Everything works perfectly, except for boot time NAND chip
> identification which fails every once in a while. NAND signature
> is 0x20 0x76, but sometimes I get 0x20 0x20. My first guess was
> timing problems, but I've double checked everything and all signals
> are inside the specs. I've also tested the chip with shorter and
> longer setup, hold and pulse times for read and write, but without
> any success. Trying different kernels didn't help either.
> 
> Any ideas and/or comments would be very much appreciated.
> 
> Thanks,
> savin

a) power supply tolerance; psu noise ?
b) is the second 0x20 a 'repeat' of the first ? in which case will an
extra read give you the required 0x76 ? [if chipid==mfrid reread chipid]
May be a chip problem - it does happen !

MikeW
