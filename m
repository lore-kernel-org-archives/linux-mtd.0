Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DlBiR-0001v7-UQ
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2005 16:20:58 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DlBaq-0004Lt-4o
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2005 22:13:10 +0200
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 22 Jun 2005 22:13:04 +0200
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 22 Jun 2005 22:13:04 +0200
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Wed, 22 Jun 2005 20:12:16 +0000 (UTC)
Message-ID: <loom.20050622T220015-23@post.gmane.org>
References: <BAY104-F36C99B1FBD33D805371E6784E80@phx.gbl>
	<200506222051.32784.vestby@alfanett.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: Re: boot to MTD-partitioned NAND from DOS w/loadlin?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
> It is technically possible to use pretty much any file system, 

Could you please explain how can "any" file system be used on top of mtd/nand?
As far as I understand at the very minimum the bad blocks would prevent that.
I believe there are no translation layers available for bare nand, only for
DOC.

> but for 
> writable filesystems you will quickly get into trouble without the wear 
> levelling  of jffs2/yaffs.

What about all these digital cameras running FAT on memory cards? Is any 
wear leveling happening in this case? (And yes, I know, it is better to 
have it).

Sergei
