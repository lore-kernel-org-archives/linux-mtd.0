Received: from zrtps0kp.nortelnetworks.com ([47.140.192.56])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C5TPj-0006Gf-WA
	for linux-mtd@lists.infradead.org; Thu, 09 Sep 2004 14:12:57 -0400
To: David Woodhouse <dwmw2@infradead.org>
References: <1093426720.3777.1480.camel@imladris.demon.co.uk>
	<wn5brgzh4ry.fsf@linhd-2.ca.nortel.com>
	<1093431210.3777.1535.camel@imladris.demon.co.uk>
From: "Linh Dang" <linhd@nortelnetworks.com>
Date: Thu, 09 Sep 2004 14:12:19 -0400
In-Reply-To: <1093431210.3777.1535.camel@imladris.demon.co.uk> (David
	Woodhouse's message of "Wed, 25 Aug 2004 11:53:30 +0100")
Message-ID: <wn5brgfia64.fsf_-_@linhd-2.ca.nortel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Linh Dang" <linhd@nortelnetworks.com>
Cc: linux-mtd@lists.infradead.org
Subject: Hi Latency in do_read_onechip (was Re: Bottom halves being disabled)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi David,

On our system, we have some slow AMD nor flash. The line

	map_copy_from(map, buf, adr, len);

in do_read_onechip (in cfi_cmdset_0002.c) is called while holding a
spin_lock (chip->mutex). This triggers 450usec non-preemptible periods
on our system.

1. Is there any plan to fix this?
2. Is it safe to replace the spin_lock with a semaphore?
3. while mtd has to lock softirq?

Thanx

-- 
Linh Dang
