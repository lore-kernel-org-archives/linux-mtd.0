Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EL2XN-0004Bv-IQ
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 13:49:50 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1EL2V4-0007No-VY
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 19:47:21 +0200
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 29 Sep 2005 19:47:18 +0200
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 29 Sep 2005 19:47:18 +0200
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Thu, 29 Sep 2005 17:45:08 +0000 (UTC)
Message-ID: <loom.20050929T193349-733@post.gmane.org>
References: <433A640D.6030200@cetrtapot.si> <433BA402.3040703@inf.u-szeged.hu>
	<20050929093433.GB18741@wohnheim.fh-wedel.de>
	<433BB979.7010904@inf.u-szeged.hu> <433BBB19.9060905@yandex.ru>
	<1128010237.6926.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: Re: Great jffs2 speedup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> CS does, in fact, go a long way toward making 256MB flash parts usable.

Plese define usable. Yes, it does make flash available for read operations
fast but the first time you try to write to it you will be blocked for, I'd
say, anywhere from 5 minutes to a few hours depending on how the files
were written and assuming full 256 MByte filesystem.

> The devices I am building use 256MB, 512MB, and 1024MB nand flash parts.
> We have been using Ferenc's CS patch for some time now and we are able
> to get sub 1 second mount times on 512+ MB filesystems.

Could you please provide time to first write for 256, 512 and 1024 MByte
full filesystems? I presume MB stands for MByte, not Mbit ;-)

> A big part of
> this performance is that I have a nand flash controller that interfaces
> with the nand part on my board. 

Good point.. Can you estimate speedup due to the hw controller?

> But nonetheless, jffs2 can be used
> successfully on very large nand parts. Ferenc's EBS and CS work are
> essential, IMHO, for getting there.

Most embedded systems cannot rely on proper shutdown. So, IMHO CS is of
limited use in this respect.

Sergei Sharonov
