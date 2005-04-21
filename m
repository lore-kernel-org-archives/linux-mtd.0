Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DOdnW-0000bb-Ry
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2005 11:40:59 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DOdiD-0004vy-15
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2005 17:35:31 +0200
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Apr 2005 17:35:29 +0200
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Apr 2005 17:35:29 +0200
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Thu, 21 Apr 2005 15:34:12 +0000 (UTC)
Message-ID: <loom.20050421T171656-701@post.gmane.org>
References: <loom.20050413T142519-107@post.gmane.org>	<425E3174.4030308@inf.u-szeged.hu>	<Pine.LNX.4.58.0504141014400.3328@phoenix.infradead.org>
	<loom.20050420T165531-253@post.gmane.org>
	<4267B8EF.6000803@inf.u-szeged.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: Re: mounting jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
> Anyway, we are now working on a new boot time speed up technique. We 
> call it centralized summary. The "old" summary is erase block summary.
..................
> If you would like to test it I can send a patch. I would be also useful 
> for us, because we don't have real NAND device, so we cannot make real 
> measurements. (Forutnatelly we can use Artem's NAND simulator.)

Ferenc, I appreciate your help. Unfortunately I don't think the patch will
improve my situation since I need to handle un-clean umounts. e.g. power 
failures and still preserve reasonable mount time.

I did a few tests with yaffs1 and yaffs2. With yaffs1, 128 MByte NAND and 100
MBytes worth of files I am getting 18 s mount time. And after 18 s filesystem
seems to be fully operational (touch, ls -l, etc.) Treat data as 
preliminary since I just built yaffs1 yesterday ;-)
I also did write/read/verify/erase of total of 6.8 GBytes of data without any 
errors. Have not done any power fail testing yet.

Now, the bad news yaffs2 did not work for me - files would disapear or get
corrupted. I would need yaffs2 to handle devices with 2 kB page size.

Sergei Sharonov
