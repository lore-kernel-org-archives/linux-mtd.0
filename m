Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FHiww-0006F4-Nn
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2006 09:50:44 -0500
Message-ID: <44119218.9050208@yandex.ru>
Date: Fri, 10 Mar 2006 17:50:00 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: nikhils@cdac.in
References: <GKELLIPIEBJEKGFGNIFKGEHACAAA.nikhils@cdac.in>
In-Reply-To: <GKELLIPIEBJEKGFGNIFKGEHACAAA.nikhils@cdac.in>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: About JFFS2 garbage collector.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

NIkhil Shirodkar wrote:
> What I figured out one call jffs2_garbage_collect_pass() which initiates
> garbage collection when there is not enough space to write a file. I figured
> out few more instances when this got called, Let me know if this is the only
> call to trigger garbage collector or are there any more calls?
This is the only.

> Is it essential to call jffs2_garbage_collect_pass() repeatedly to get a
> free jeb, or if once the jffs2_garbage_collect_pass() is called, it ensures
> of making one jeb free. (barring the case when ic-->state of
> INO_STATE_READING is found and the GC returns success without achieving the
> desired)
One jffs2_garbage_collect_pass() is supposed to move one node (or zero 
in special cases as you has specified), so you have to loop to get full 
eraseblock (jeb) garbage collect-ed.

> I also wanted to find out _all_ other instances when the GC thread runs. Is
> there any way one can force the GC thread to run like the case when, you are
> not performing any I/O operations. This might be helpful to reduce the write
> latency of a nearly full filesystem.
jffs2_garbage_collect_pass() may be called by

1. GC thread
2. a writing process when there is no free space

1. is just an optimization and is run when you do not perform any I/O. 
There is a threshold of free space above which GC thread do not run. You 
can force it by sending a SIGHUP signal (causes one 
jffs2_garbage_collect_pass() invocation.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
