Received: from zcars04e.nortelnetworks.com ([47.129.242.56])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BzvL1-00026E-IF
	for linux-mtd@lists.infradead.org; Wed, 25 Aug 2004 06:49:08 -0400
To: "David Woodhouse" <dwmw2@infradead.org>
References: <1093426720.3777.1480.camel@imladris.demon.co.uk>
From: "Linh Dang" <linhd@nortelnetworks.com>
Date: Wed, 25 Aug 2004 06:48:49 -0400
In-Reply-To: <1093426720.3777.1480.camel@imladris.demon.co.uk> (David
	Woodhouse's message of "Wed, 25 Aug 2004 05:38:40 -0400")
Message-ID: <wn5brgzh4ry.fsf@linhd-2.ca.nortel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org
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

> On Tue, 2004-08-24 at 22:36 -0400, Linh Dang wrote:
>> Is it safe to convert those spin_locks to mutexes?
>
> A spinlock is a mutex. Do you mean convert to semaphores?

yes

> Why?

reduce latency with preemptable kernel. I've tried that. In my test I
hammered jffs2 pretty hard (for typical flash usage, no kernel
compilation here) and everything still seemed ok.

--
Linh Dang
