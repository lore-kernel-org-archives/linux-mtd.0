Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kv6b2-0004Xn-Lw
	for linux-mtd@lists.infradead.org; Wed, 29 Oct 2008 08:40:09 +0000
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1Kv6aw-0004GY-U9
	for linux-mtd@lists.infradead.org; Wed, 29 Oct 2008 08:40:02 +0000
Received: from 194.95.133.35 ([194.95.133.35])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2008 08:40:02 +0000
Received: from andre.puschmann by 194.95.133.35 with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2008 08:40:02 +0000
To: linux-mtd@lists.infradead.org
From: Andre Puschmann <andre.puschmann@imms.de>
Subject: flash read performance
Date: Tue, 28 Oct 2008 11:14:05 +0100
Message-ID: <ge6old$oo3$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi list,

I am currently trying to improve the flash read performance of my 
platform. It's a gumstix verdex board with a pxa270 running at 400MHz. 
My flash is a 16MB NOR Intel StrataFlash P30 (128P30T) and it's 
operating in the _normal_ asynchronous mode. In my opinion the read 
performance is very poor, only around 1.2 to 1.4 MB/s depending on the 
blocksize. I think it should be possible to get much higher transfer rates.

In Linux, I ran my tests with dd like this (copy 10MB):
time dd if=/dev/mtd5 of=/dev/null bs=16k count=640
640+0 records in
640+0 records out
real    0m 7.17s
user    0m 0.00s
sys     0m 7.17s


Running top in another console brings up, that the CPU load is very high
during copy. I am not sure if the system is doing some sort of busy 
waiting or something like that? However, it should be possible to do a 
copy without having such a high load.

Mem: 17684K used, 45144K free, 0K shrd, 0K buff, 11164K cached
CPU:   0% usr 100% sys   0% nice   0% idle   0% io   0% irq   0% softirq
Load average: 0.10 0.17 0.09
  PID  PPID USER     STAT   VSZ %MEM %CPU COMMAND
  259   258 root     R     1100   2%  95% dd if /dev/mtd5 of /dev/null 
bs 16k co


I guess a number of people are using a similar/comparable setup. So some
kind of user benchmark would be nice.
I am sure this needs some more investigation, but any comment/hint is 
more than welcome.

Best regards,
Andre
