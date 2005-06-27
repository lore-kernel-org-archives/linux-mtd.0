Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Dn1jn-0004Kv-EN
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2005 18:05:58 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Dn1cV-00048S-Jc
	for linux-mtd@lists.infradead.org; Mon, 27 Jun 2005 23:58:29 +0200
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 27 Jun 2005 23:58:23 +0200
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 27 Jun 2005 23:58:23 +0200
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Mon, 27 Jun 2005 21:57:20 +0000 (UTC)
Message-ID: <loom.20050627T234825-377@post.gmane.org>
References: <200506271409.42449.charles.tilbury@comcast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: Re: NAND flash question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Charles,
> I am using an ST Micro 64M byte x 8 bit flash part and JFFS2.  It mostly works 
> except that when the board reboots, JFFS2 reports CRC error messages when the 
> partition mounts again.  The strange part is that there does not seem to be 
> any data corruption or lost data.  Also, I do not see any error messages 
> while reading and writing.  However, the CRC errors seem to accumulate over 
> time.  Is there some way to prevent this from happening?  Repair it?  Should 
> I just ignore it?


In my experience these "errors" occur if you switch of the power without
proper shutdown. They are not errors really, just notes from JFFS2 that
some write was interrupted by power cycle or reset and the node written is
invalid. It is annoying but harmless. I believe they eventually go away
after the block is reclaimed by GC.

Sergei
