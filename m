Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15JXK5-0004o2-00
	for <linux-mtd@lists.infradead.org>; Mon, 09 Jul 2001 10:27:21 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <7DF7BFDC95ECD411B4010090278A44CA0A3B8E@ATVX> 
References: <7DF7BFDC95ECD411B4010090278A44CA0A3B8E@ATVX> 
To: "Siders, Keith" <keith_siders@toshibatv.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: FTL and Endianity 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 09 Jul 2001 10:32:44 +0100
Message-ID: <1688.994671164@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

keith_siders@toshibatv.com said:
>  So since I'm using big-endian MIPS, does this effect JFFS2? That is,
> does FTL stand for Flash Translation Layer, or some such thing?  

JFFS2 is host-endian. It shouldn't affect you at all. You don't need to use 
FTL, JFFS works directly on the flash.

If you're making your JFFS2 filesystem images on a little-endian box for 
use on your target, make sure you use the appropriate arguments to 
mkfs.jffs2 to make it do the byteswapping.

--
dwmw2
