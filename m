Received: from zcars04f.nortelnetworks.com ([47.129.242.57])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BzxAh-0002WV-PQ
	for linux-mtd@lists.infradead.org; Wed, 25 Aug 2004 08:46:37 -0400
Received: from zcard303.ca.nortel.com (zcard303.ca.nortel.com [47.129.242.59])
	by zcars04f.nortelnetworks.com (Switch-2.2.6/Switch-2.2.0) with
	ESMTP id i7PCkWe24760 for <linux-mtd@lists.infradead.org>;
	Wed, 25 Aug 2004 08:46:32 -0400 (EDT)
Received: from linhd by linhd-2.ca.nortel.com with local (Exim 3.36 #1
	(Debian)) id 1BzxAe-000110-00
	for <linux-mtd@lists.infradead.org>; Wed, 25 Aug 2004 08:46:32 -0400
To: linux-mtd@lists.infradead.org
References: <1093426720.3777.1480.camel@imladris.demon.co.uk>
	<wn5brgzh4ry.fsf@linhd-2.ca.nortel.com>
	<1093431210.3777.1535.camel@imladris.demon.co.uk>
From: Linh Dang <linhd@nortelnetworks.com>
Date: Wed, 25 Aug 2004 08:46:32 -0400
In-Reply-To: <1093431210.3777.1535.camel@imladris.demon.co.uk> (David
	Woodhouse's message of "Wed, 25 Aug 2004 11:53:30 +0100")
Message-ID: <wn54qmrgzbr.fsf@linhd-2.ca.nortel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Linh Dang" <linhd@nortelnetworks.com>
Subject: Re: Bottom halves being disabled
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse <dwmw2@infradead.org> wrote:

> On Wed, 2004-08-25 at 06:48 -0400, Linh Dang wrote:
>> reduce latency with preemptable kernel. I've tried that. In my test
>> I hammered jffs2 pretty hard (for typical flash usage, no kernel
>> compilation here) and everything still seemed ok.
>
> Show numbers.

On my card (AMD Am29LV640 NOR flash), preemption was often disabled
for 450usecs in cfi_cmdset_002.c's do_read_onechip().

using semaphore instead of spin_lock, preemption would NOT be disabled
at all!

Btw, JFFS2 is great!

-- 
Linh Dang
