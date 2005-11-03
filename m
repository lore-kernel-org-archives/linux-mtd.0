Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EXi1z-00067R-Tg
	for linux-mtd@lists.infradead.org; Thu, 03 Nov 2005 11:33:42 -0500
Message-ID: <436A3BBD.5040405@yandex.ru>
Date: Thu, 03 Nov 2005 19:33:01 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Bernhard Priewasser <priewasser@gmail.com>
References: <436A3949.1000001@gmail.com>
In-Reply-To: <436A3949.1000001@gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: GC operation
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bernhard Priewasser wrote:
> When and how is GC called?
 From the GC thread and when there is no (or few) free space to write. 
In the latter case the writing process is blocked and waits until GC has 
freed some space.

> (or jffs2_garbage_collect_trigger() or SIGHUP) proceed only one node at 
> a time?  For each node / for each block / ..... some loop?
jffs2_garbage_collect_pass() moves one node at a time.

> Ah, another one: Are blocks on the erase_pending_list erased beside the 
> GC cycles?
They are erased later, yes.

> Hm, sorry for the annoying questions, but garbage collection can be an 
> ugly and confusing thing if one is not used to it :-)
Brr, didn't get it.. GC may be ugly if what?

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
