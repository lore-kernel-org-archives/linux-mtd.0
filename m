Received: from host61-50.pool80105.interbusiness.it ([80.105.50.61]
	helo=linuxbw2.bwlocal.it)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FLFIr-0000AE-Pi
	for linux-mtd@lists.infradead.org; Mon, 20 Mar 2006 02:59:54 -0500
Received: from igortr (igortr.bwlocal.it [192.168.0.14])
	by linuxbw2.bwlocal.it (8.12.1/8.12.1) with ESMTP id k2K7L5LH012211
	for <linux-mtd@lists.infradead.org>; Mon, 20 Mar 2006 08:21:06 +0100
From: igor.trevisan@bluewind.it
To: linux-mtd@lists.infradead.org
Date: Mon, 20 Mar 2006 08:23:14 +0100
MIME-Version: 1.0
Message-ID: <441E6672.21754.1C9B25@localhost>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: jffs2 fs overload
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'm defining the flash partitions content for my target
and I need a rewritable flash area.
So I formatted and mounted a flash partition as jffs2.
What I noted is that, on a 1MByte flash area I loose
about 600K immediately. If I use the command df I see
that only 30less than 400k are really available.
Is it possible that this is the normal overload if a 
format my flash partition with jffs2?
Or am I doing something wtong?
Is there any good guide or document that can help me
building a jffs2 RW flash partition?
Please forgive me if I couldn't be very clear! If needed to help me 
better I can try to give more information and details about my problem.
Thanks in advance,
Igor.
-- 
--- BlueWind 
--- Embedded Systems Design 
--- Borgo Pieve 55c interno c
--- 31033 Castelfranco V.to (TV)
--- Tel.: +39 0423 723431 Fax.: +39 0423 744738
--- mailto: igor.trevisan@bluewind.it
--- http://www.bluewind.it
------------------------------------------------------------------
