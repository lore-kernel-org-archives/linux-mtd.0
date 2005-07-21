Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DvXOt-0003sb-Rw
	for linux-mtd@lists.infradead.org; Thu, 21 Jul 2005 05:31:36 -0400
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1DvXOC-000122-JH
	for linux-mtd@lists.infradead.org; Thu, 21 Jul 2005 11:30:50 +0200
Received: from 81.255.233.236 ([81.255.233.236])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Jul 2005 11:30:48 +0200
Received: from stephane.fillod by 81.255.233.236 with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Jul 2005 11:30:48 +0200
To: linux-mtd@lists.infradead.org
From: Stephane Fillod <stephane.fillod@thomson.net>
Date: Thu, 21 Jul 2005 09:23:33 +0000 (UTC)
Message-ID: <loom.20050721T111743-505@post.gmane.org>
References: <dbl42b$hcn$1@sea.gmane.org>
	<1121867130.12903.15.camel@localhost.localdomain>
	<dblm4l$802$1@sea.gmane.org>
	<1121869156.12903.19.camel@localhost.localdomain>
	<dblne1$cgd$1@sea.gmane.org>
	<1121887042.20077.1.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: Re: JFFS2 garbage collector blocking for minutes after mount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-07-20 at 16:34 +0200, Martin Egholm Nielsen wrote:
> I'm not comfortable with profiling the kernel... It could be arranged, 
> but I rather see if the a recent CVS snapshot does it for me... 

Profiling the kernel? what about using OProfile?

-- 
Stephane
