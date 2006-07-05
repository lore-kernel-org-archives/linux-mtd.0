Received: from ctb-mesg9.saix.net ([196.25.240.89])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fy742-0008NO-Do
	for linux-mtd@lists.infradead.org; Wed, 05 Jul 2006 09:05:36 -0400
Received: from kreon-mail.kreon.co.za (dsl-145-145-240.telkomadsl.co.za
	[165.145.145.240])
	by ctb-mesg9.saix.net (Postfix) with ESMTP id 6AEE6334C
	for <linux-mtd@lists.infradead.org>;
	Wed,  5 Jul 2006 13:57:17 +0200 (SAST)
Received: from [192.168.0.102] ([192.168.0.102])
	by kreon-mail.kreon.co.za (8.13.4/8.13.4/SuSE Linux 0.7) with ESMTP id
	k65C11fi017499
	for <linux-mtd@lists.infradead.org>; Wed, 5 Jul 2006 14:01:04 +0200
From: Kobus Wolvaardt <kobus@kreon.co.za>
To: linux-mtd@lists.infradead.org
Subject: doc 2.6 kernel crashes
Date: Wed, 5 Jul 2006 14:03:21 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200607051403.21643.kobus@kreon.co.za>
Reply-To: kobus@kreon.co.za
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am getting random crashes on my 2.6.11 and 2.6.15 kernel when diskonchip 
2000 support is enabled, without it there is no crashes. How do I verify what 
causes the crashes? any ideas? and pointers to docs that'll help?

I'm a bit at a loss as to what to do. I have a crappy driver that isnt 
supported beyond 2.6.15 kernel that's preventing me from trying the latest 
and greatest 2.6.17. Can it be that by enabling unstable code in the kernel 
setup that some other unstable driver is included and that it is not the doc 
driver's fault? Or if it is the doc drivers fault how do I help to find and 
fix the bug?

Thanks,
Kobus




















 

-- 
This message was scanned for viruses by MailScanner and Sophos.
