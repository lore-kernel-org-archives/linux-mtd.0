Received: from 82-168-191-45-bbxl.xdsl.tiscali.nl ([82.168.191.45]
	helo=levin.pad.mess.org)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CWAgg-0006u3-FA
	for linux-mtd@lists.infradead.org; Mon, 22 Nov 2004 04:40:47 -0500
Received: from sean by levin.pad.mess.org with local (Exim 3.36 #1 (Debian))
	id 1CWAgZ-0001Ha-00
	for <linux-mtd@lists.infradead.org>; Mon, 22 Nov 2004 10:40:39 +0100
Date: Mon, 22 Nov 2004 10:40:39 +0100
From: Sean Young <sean@mess.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20041122094039.GA4919@levin.pad.mess.org>
References: <200411221211.12394.skorinkod@mosk.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200411221211.12394.skorinkod@mosk.ru>
Subject: Re: mkfs.ext3 - segmentation fault
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 22, 2004 at 12:11:12PM +0300, Dmitry Skorinko wrote:
> 2.6.8-1 + mtd snapshot (about 2 week ago)
> 
> #modprobe inftl
> #modprobe diskonchip

-snip-

> EIP is at mtd_erase_callback+0x6/0x3b [mtdpart]

inftl is not setting the mtd member of struct erase_info. None of the
ftl's seem to be doing this but I do not have a current cvs handy so it
might be fixed.


Sean
