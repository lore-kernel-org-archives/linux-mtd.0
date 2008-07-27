Received: from mx03.mailboxcop.com ([206.125.223.73])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KNBEZ-0001vr-Dt
	for linux-mtd@lists.infradead.org; Sun, 27 Jul 2008 18:44:43 +0000
Received: from secure3.apollohosting.com (secure3.apollohosting.com
	[206.125.215.253])
	by mx03.mailboxcop.com (8.13.8/8.13.8) with ESMTP id m6RIifHb020000
	for <linux-mtd@lists.infradead.org>; Sun, 27 Jul 2008 13:44:41 -0500
Message-ID: <20080727134441.fv7uxpkeq28s8cc0@webmail.mistralsolutions.com>
Date: Sun, 27 Jul 2008 13:44:41 -0500
From: suresh@mistralsolutions.com
To: linux-mtd@lists.infradead.org
Subject: JFFS2 Garbage Collection Issue
MIME-Version: 1.0
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am running a stress test which keeps writing to the flash on every  
reboot (around 15 MB each time). After running the test for 2 days, I  
see that the garbage collection takes a long time to complete (almost  
65 seconds).

I disabled the garbage collection from running during bootup (and the  
stress test is stopped). When I see the free space on the JFFS2  
partition its much more than what it should be (we expect it to be  
around 17 MB, but its 35 MB). When the JFFS2 garbage collection is  
started again it comes down to 17MB. Again after a reboot its back at  
35 MB (garbage collection is stopped at reboot and stress test is now  
not running).

Why does the JFFS2 NOT remember the garbage collection it did the  
previous time? This is affecting the application start up time in out  
case.

I am using JFFS2 in 2.6.16-rc3 on OMAP5912

Thanks in advance,

Best Regards,
Suresh
