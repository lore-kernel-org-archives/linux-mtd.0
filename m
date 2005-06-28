Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DnLsF-0000tj-3v
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2005 15:36:00 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DnLhI-0004n9-PI
	for linux-mtd@lists.infradead.org; Tue, 28 Jun 2005 21:24:48 +0200
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2005 21:24:40 +0200
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 28 Jun 2005 21:24:40 +0200
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Tue, 28 Jun 2005 19:20:27 +0000 (UTC)
Message-ID: <loom.20050628T205336-2@post.gmane.org>
References: <200506271409.42449.charles.tilbury@comcast.net>
	<200506280941.14702.charles.tilbury@comcast.net>
	<1119983460.12240.22.camel@hades.cambridge.redhat.com>
	<200506281157.39708.charles.tilbury@comcast.net>
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
> How could one change the flush interval to around 100mS?  Or does that sound 
> like a stupid idea?

Just call sync/fsync as needed. Your application should know when to do it.
Secondly, I believe JFFS2 will flush write buffer no latter then 5 s after 
write (?). Can anybody comment on that?

Sergei
