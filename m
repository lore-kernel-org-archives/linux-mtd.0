Received: from [217.110.46.186] (helo=mail.berlin.imc-berlin.de)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q84M-00051E-5J
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 17:03:26 +0100
Received: from mailgate.berlin.imc-berlin.de (mailgate.berlin.imc-berlin.de
	[10.0.0.13])h5BG3ULT001969
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 18:03:30 +0200
Received: from imc-berlin.de (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailgate.berlin.imc-berlin.de (8.8.8/8.8.8) with ESMTP id SAA22939
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Jun 2003 18:03:59 +0200 (CEST)
	(envelope-from steven.scholz@imc-berlin.de)
Message-ID: <3EE752EE.8090902@imc-berlin.de>
Date: Wed, 11 Jun 2003 18:03:58 +0200
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Stopping the GC thread?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

in "JFFS - A pratical guide" 
(http://www.embeddedlinuxworks.com/articles/jffs_guide.html) I read

"For completeness, I should mention that you can suspend and re-start 
the GC thread on demand by sending it a signal. A SIGSTOP and a 
SIGCONT can do that respectively."

I would like to be able to stop the garbage collection thread from 
within my application when doing some time critical things.
Is it safe to just do a

~ # kill -s SIGSTOP `pidof jffs2_gcd_mtd0`

even if my root fs is on this JFFS2 partition?

(I just tried it now and it seems to work. But IIRC a while ago my 
system hung when I did something like that...)


Thanks,

Steven
