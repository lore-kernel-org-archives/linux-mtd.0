Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6eST-0008IF-3e
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 07:44:21 +0000
Received: by eyh6 with SMTP id 6so1708261eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 04 Apr 2011 00:44:19 -0700 (PDT)
Subject: Re: [PATCH] MTD: Retry Read/Write Transfer Buffer Allocations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Grant Erickson <marathon96@gmail.com>
In-Reply-To: <1301902050.2760.23.camel@localhost>
References: <1301705049-15593-1-git-send-email-marathon96@gmail.com>
	<1301902050.2760.23.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 04 Apr 2011 10:41:50 +0300
Message-ID: <1301902910.2760.31.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-04-04 at 10:27 +0300, Artem Bityutskiy wrote:
> An third, as I wrote in my answer to Jarkko, allocating large contiguous
> buffers is bad for performance: if the system memory is fragmented and
> there is no such large contiguous areas, the kernel will start writing
> back dirty FS data, killing FS caches, shrinking caches and buggers,
> probably even swapping out applications. We do not want MTD to cause
> this at all.

s/buggers/buffers/

> Probably we can mitigate this with kmalloc flags. Now, I'm not sure what
> flags are the optimal, but I'd do:
> 
> __GFP_NOWARN | __GFP_WAIT | __GFP_NORETRY

Of course I meant you should use special flags as long as you are
allocating more than 1 contiguous page. But the last PAGE_SIZE
allocation should be done with standard GFP_KERNEL flag.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
