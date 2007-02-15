Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HHigV-0003E4-CS
	for linux-mtd@lists.infradead.org; Thu, 15 Feb 2007 10:38:15 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HHigP-0003Gw-8u
	for linux-mtd@lists.infradead.org; Thu, 15 Feb 2007 16:38:05 +0100
Received: from ASt-Lambert-152-1-42-242.w82-124.abo.wanadoo.fr
	([82.124.168.242]) by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 15 Feb 2007 16:38:05 +0100
Received: from matthieu.castet by
	ASt-Lambert-152-1-42-242.w82-124.abo.wanadoo.fr with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 15 Feb 2007 16:38:05 +0100
To: linux-mtd@lists.infradead.org
From: Matthieu CASTET <matthieu.castet@parrot.fr>
Subject: Re: 2.6.20 : BUG in =?utf-8?b?bmFuZF9kb19yZWFkX29vYg==?=
	=?utf-8?b?d2l0aAlNVERfT09CX1BMQUNF?= ?
Date: Thu, 15 Feb 2007 15:37:54 +0000 (UTC)
Message-ID: <loom.20070215T163517-47@post.gmane.org>
References: <loom.20070209T155657-545@post.gmane.org>
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

Matthieu CASTET <matthieu.castet <at> parrot.fr> writes:

> 
> Hi,
> 
> 2.6.20 nand mtd seems to read wrongly oob in MTD_OOB_PLACE.
> If I dump a page with uboot I get [1] and if I dump it with nanddump I get [2].
> As you could can see OOB doesn't match. Moreover the 2 snd 8 bytes OOB data
> given by nanddump are the 1st 8 bytes OOB of the next page.
> 
> If we look in nand_base.c, we saw that in case of MTD_OOB_PLACE, the len of oob
> is set to chip->ecc.layout->oobavail. This seems wrong as user expect to be
> mtd->oobsize.
> 
> Does this bug is know ?
> 
Any news on that ?

I needed to patch nand_do_read_oob to use jffs2 with 2.6.20 [1].


Matthieu
[1]
if (ops->mode == MTD_OOB_RAW || ops->mode == MTD_OOB_PLACE)
                len = mtd->oobsize;
        else
                len = chip->ecc.layout->oobavail;
