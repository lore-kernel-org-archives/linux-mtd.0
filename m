Received: from host242-133.pool80206.interbusiness.it ([80.206.133.242]
	helo=dns.ctsgroup.it)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19xoyj-0006ho-Kd
	for <linux-mtd@lists.infradead.org>; Fri, 12 Sep 2003 15:32:53 +0100
Received: from Massimo (dyn225.ctsgroup.it [192.6.1.225])
	by dns.ctsgroup.it (8.11.6/8.11.6) with SMTP id h8CEWCU01692
	for <linux-mtd@lists.infradead.org>; Fri, 12 Sep 2003 16:32:12 +0200
Message-ID: <004501c3793a$d6662bb0$e10106c0@Massimo>
From: =?iso-8859-1?Q?Massimo_Cal=F2?= <m.calo@ctsgroup.it>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 12 Sep 2003 16:33:30 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: VFS: Unable to mount root fs on 00:00
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

 If I desable the blkmem(uncheck "<>ROM disk memory block device(blkmem)") ,
my system doesn't boot. I receive the following message :

>>         VFS: Cannot open root device "" or 00:00
>>         Please append a correct "root=" boot option
>>         Kernel panic: VFS: Unable to mount root fs on 00:00

Can you help me?

Thanks!

Massimo
