Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HTwqB-0000F3-8T
	for linux-mtd@lists.infradead.org; Wed, 21 Mar 2007 05:10:45 -0400
Subject: Re: jffs2_gcd_mtd0 invoked oom-killer
From: Thomas Gleixner <tglx@linutronix.de>
To: Igor Marnat <marny@rambler.ru>
In-Reply-To: <1055017593.20070321111428@rambler.ru>
References: <16125243125.20070312152801@rambler.ru>
	<1173705053.5493.28.camel@sauron> <41978953.20070319084552@rambler.ru>
	<1174288746.13341.490.camel@localhost.localdomain>
	<9323738734.20070319144832@rambler.ru>
	<1174323006.13341.504.camel@localhost.localdomain>
	<1055017593.20070321111428@rambler.ru>
Content-Type: text/plain
Date: Wed, 21 Mar 2007 10:17:52 +0100
Message-Id: <1174468672.10840.4.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-03-21 at 11:14 +0300, Igor Marnat wrote:
> Hello Thomas,
> 
> TG> Interrestingly enough are the node CRCs of some of the nodes intact, so
> TG> the corruption must have happened before writing to flash.
> 
> Loop "while (valid_ref)" (those that become infinite) in jffs2_get_inode_nodes also contains crc
> checking of nodes. They are checked in order of proceeding.
> 
> It doesn't complain about nodes' crc, so it seems
> that crc are ok. So I don't think that crc checking of chain of nodes
> helps here.

Can you please set JFFS2_DEBUG_LEVEL to 2 and log the output to a serial
console, bzip2 the result and upload it somewhere ?

Beware: it's slow and huge!

Thanks,

	tglx
