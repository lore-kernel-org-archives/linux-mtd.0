Received: from moutng.kundenserver.de ([212.227.126.183])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1915j9-0002un-38
	for <linux-mtd@lists.infradead.org>; Thu, 03 Apr 2003 15:30:03 +0100
Received: from [212.227.126.162] (helo=mrelayng.kundenserver.de)
	by moutng.kundenserver.de with esmtp (Exim 3.35 #1)
	id 1915j9-0002mq-00
	for linux-mtd@lists.infradead.org; Thu, 03 Apr 2003 16:30:03 +0200
Received: from [217.227.92.20] (helo=comm.esd-electronics.com)
	by mrelayng.kundenserver.de with asmtp (Exim 3.35 #1)
	id 1915j9-0003xz-00
	for linux-mtd@lists.infradead.org; Thu, 03 Apr 2003 16:30:03 +0200
From: "Stefan Roese" <stefan.roese@esd-electronics.com>
To: "Thayne Harbaugh" <tharbaugh@lnxi.com>
Date: Thu, 3 Apr 2003 16:23:20 +0200
Message-ID: <EFEAIMDCOOOHIEPHDNFJMEHHFEAA.stefan.roese@esd-electronics.com>
MIME-Version: 1.0
In-reply-to: <1049230283.25992.114.camel@tubarao>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Wacky JEDEC probes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thayne!

> Your diff indicates that MTD_UADDR_0x0AAA_0x0554 is for word mode and
> MTD_UADDR_0x0555_0x02AA is for byte mode.
>
> The AMD data sheet for AM29LV160D
> (http://www.amd.com/us-en/assets/content_type/white_papers_and_tec
> h_docs/22358B.pdf)
> in table 9 - Am29LV160D command defenitions (page 24) indicates that the
> unlock addresses for word mode are 0x0555 and 0x02AA while the unlock
> addresses for byte mode are 0x0AAA and 0x0555.
>
> Why the difference?  Are the data sheets in error?

I just looked into the datasheet and you seem to be right. I have never used
this flash in byte mode, but the "older" 8bit flash's (AM29F040...) are
using the addresses 0x0555 and 0x02aa as unlock addresses as well. This
seems to work on the AM29LVxxx devices since its implemented this way.

Error in datasheet? I don't really think so. Now I am confused...

Best regards,
Stefan.
