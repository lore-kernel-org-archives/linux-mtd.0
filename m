Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AJ6tm-0002fW-Qd
	for <linux-mtd@lists.infradead.org>; Mon, 10 Nov 2003 07:55:48 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Chris Ellec <cellec@celerity.net>
In-Reply-To: <3FAAF44B.8020804@celerity.net>
References: <3FAAF44B.8020804@celerity.net>
Message-Id: <1068450843.14962.2.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Mon, 10 Nov 2003 07:54:04 +0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: gerg@snapgear.com
cc: linux-mtd@lists.infradead.org
Subject: Re: INFTL report
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-11-06 at 17:24 -0800, Chris Ellec wrote:
> $ modprobe -a doc200 inftl mtdchar mtdblock
> $ modprobe -a  docprobe
> 
> produced the attached /var/log/messages and also those lines that were 
> not in the log file;
> 
> INFTL: corrupt block 7140 in chain 7140, chain length 0, erase mark 0x0?
> INFTL: formatting chain at block 7140
> INFTL: error while formatting block 7140
> 
> repeated for a few more addresses.

Er, that could be because, as far as I can tell, our INFTL code doesn't
actually look at the Bad Block Table at all. I suspect those are bad
blocks and we should be ignoring them.

We _really_ need to look at handling the BBT properly on these devices.
 
-- 
dwmw2
