Received: from zcars04e.nortelnetworks.com ([47.129.242.56])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BzneL-0000zE-Hn
	for linux-mtd@lists.infradead.org; Tue, 24 Aug 2004 22:36:34 -0400
Received: from zcard303.ca.nortel.com (zcard303.ca.nortel.com [47.129.242.59])
	by zcars04e.nortelnetworks.com (Switch-2.2.6/Switch-2.2.0) with
	ESMTP id i7P2aT511501 for <linux-mtd@lists.infradead.org>;
	Tue, 24 Aug 2004 22:36:29 -0400 (EDT)
Received: from linhd by linhd-2.ca.nortel.com with local (Exim 3.36 #1
	(Debian)) id 1BzneH-0007FV-00
	for <linux-mtd@lists.infradead.org>; Tue, 24 Aug 2004 22:36:29 -0400
To: linux-mtd@lists.infradead.org
References: <20040824120929.1377.qmail@web52204.mail.yahoo.com>
	<1093350246.14552.12435.camel@hades.cambridge.redhat.com>
From: Linh Dang <linhd@nortelnetworks.com>
Date: Tue, 24 Aug 2004 22:36:28 -0400
In-Reply-To: <1093350246.14552.12435.camel@hades.cambridge.redhat.com> (David
	Woodhouse's message of "Tue, 24 Aug 2004 13:24:06 +0100")
Message-ID: <wn5n00kgd03.fsf@linhd-2.ca.nortel.com>
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

> On Tue, 2004-08-24 at 05:09 -0700, Ed Co wrote:
>> Hi All,
>>
>> In the NOR driver code, the spin locks are acquired
>> everywhere with bottom halves disabled using the
>> spin_lock_bh() API. My doubt is why are the bottom
>> halves disabled? (Doesn't that add to the real time
>> latency on the system!)
>>
>> Hoping someone would clear the doubt
>
> Because we intend the erase completion to be asynchronous, hence we
> lock against the timers which may one day check for it. There's no
> real reason we couldn't switch to spin_lock() for now.

Is it safe to convert those spin_locks to mutexes?

-- 
Linh Dang
