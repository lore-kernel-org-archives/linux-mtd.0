Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BzuEt-0001rC-Lp
	for linux-mtd@lists.infradead.org; Wed, 25 Aug 2004 05:38:44 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: Linh Dang <linhd@nortelnetworks.com>
In-Reply-To: <wn5n00kgd03.fsf@linhd-2.ca.nortel.com>
References: <20040824120929.1377.qmail@web52204.mail.yahoo.com>
	<1093350246.14552.12435.camel@hades.cambridge.redhat.com>
	<wn5n00kgd03.fsf@linhd-2.ca.nortel.com>
Content-Type: text/plain
Message-Id: <1093426720.3777.1480.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Wed, 25 Aug 2004 10:38:40 +0100
Content-Transfer-Encoding: 7bit
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

On Tue, 2004-08-24 at 22:36 -0400, Linh Dang wrote:
> Is it safe to convert those spin_locks to mutexes?

A spinlock is a mutex. Do you mean convert to semaphores? Why? 

-- 
dwmw2
