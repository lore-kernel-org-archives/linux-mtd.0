Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cu6Gl-0006gf-RY
	for linux-mtd@lists.infradead.org; Thu, 27 Jan 2005 04:49:00 -0500
Message-ID: <41F8B903.8050301@arcom.com>
Date: Thu, 27 Jan 2005 09:48:51 +0000
From: David Vrabel <dvrabel@arcom.com>
MIME-Version: 1.0
To: Kasturi Raghunath <kasturi@utstar.com>
References: <DJEELHNCJDICCAIMLCCCCEIOEGAA.kasturi@utstar.com>
In-Reply-To: <DJEELHNCJDICCAIMLCCCCEIOEGAA.kasturi@utstar.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd list <linux-mtd@lists.infradead.org>
Subject: Re: do_write_buffer(): software timeout
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kasturi Raghunath wrote:
> Hi
>   I am running 2.4.18 linux on my 8270 board with AMD29LV128ML flash chip. I
> have patched May 27 2004 snapshot into my linux OS. JFFS2 and the MTD driver
> works fine when there is no load on the CPU. But when I start sending wire
> speed traffic on the ethernet port and simultaneously download a file to the
> flash I get following error:
> MTD do_write_buffer(): software timeout

It's possible that the ethernet driver is disabling interrupts too much 
and ticks are getting lost.  This can cause timeouts to expire too soon 
(particularly with the short 1 jiffy timeout in the do_write_buffer() code).

I posted a patch to this list a while back to work around this issue. 
You could see if it fixes the problem.

http://lists.infradead.org/pipermail/linux-mtd/2004-December/011048.html

David Vrabel
-- 
David Vrabel, Design Engineer

Arcom, Clifton Road           Tel: +44 (0)1223 411200 ext. 3233
Cambridge CB1 7EA, UK         Web: http://www.arcom.com/
