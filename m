Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19KHBN-0005iL-Sb
	for <linux-mtd@lists.infradead.org>; Mon, 26 May 2003 13:34:29 +0100
Date: Mon, 26 May 2003 14:35:00 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20030526123500.GA12485@wohnheim.fh-wedel.de>
References: <001101c32078$7de79840$740486da@w0a3t0>
	<20030522195708.GB11240@wohnheim.fh-wedel.de>
	<004101c3214d$223c9560$740486da@w0a3t0>
	<20030526094050.GA30361@wohnheim.fh-wedel.de>
	<1053942836.17182.83.camel@imladris.demon.co.uk>
	<20030526101918.GA11734@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030526101918.GA11734@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: matsunaga <matsunaga_kazuhisa@yahoo.co.jp>
cc: linux-mtd@lists.infradead.org
Subject: Re: vmalloc for zlib workspace
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A workmate of mine had another good point.  The mutex and workspace
could be two arrays instead, with one member per CPU.  That way, we
don't need a CONFIG_TINY option and the code scales automatically from
small embedded to multi-gigabyte SMP.

I'll work on a patch...

Jörn

-- 
It's just what we asked for, but not what we want!
-- anonymous
