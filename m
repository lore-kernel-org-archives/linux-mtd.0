Received: from mailbox1.avalonworks.net ([216.58.97.66])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AORF9-00038G-VF
	for <linux-mtd@lists.infradead.org>; Tue, 25 Nov 2003 00:39:52 +0000
Received: from localhost (i216-58-64-146.igs.net [216.58.64.146])
	hAP0cHDG073298	for <linux-mtd@lists.infradead.org>;
	Mon, 24 Nov 2003 19:38:17 -0500 (EST)
	(envelope-from ilatypov@infradead.org)
Received: from ilgiz by localhost with local (Exim 4.24)
	id 1AORDe-0000Sj-12
	for linux-mtd@lists.infradead.org; Mon, 24 Nov 2003 19:38:18 -0500
Date: Mon, 24 Nov 2003 19:38:17 -0500
From: Ilguiz Latypov <ilatypov@infradead.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20031125003817.GA1762@ei.homeip.net>
References: <20031124213552.5357c92a.lanas@t-online.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031124213552.5357c92a.lanas@t-online.de>
Sender: Ilguiz Latypov <ilatypov@infradead.org>
Content-Type: text/plain; charset=us-ascii
Subject: Re: DoC newbie
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, Nov 24, 2003 at 09:35:52PM +0100, lanas wrote:
>   What I did up to now is to get the device recognized as /dev/ntfla. 

LILO would need disk I/O int 0x13 emulation.  Such layer is offered by
M-Sys.  I don't know if the source code for it is open.

There is a nice description of dwmw2's open source NFTL patch to GRUB
and further enhancements at

  http://www.lakeshoremicro.com/diskonchip-grub-howto.html

I saw messages on JFFS2 on NAND driver development in the MTD mailing
list archives.

-- 
Ilguiz
