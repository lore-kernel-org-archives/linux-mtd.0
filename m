Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17plMP-00085n-00
	for <linux-mtd@lists.infradead.org>; Fri, 13 Sep 2002 08:59:29 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <002d01c25ad8$5a39d310$80d1a8c0@synso.com.tw> 
References: <002d01c25ad8$5a39d310$80d1a8c0@synso.com.tw> 
To: "Steve Tsai" <startec@ms11.hinet.net>
Cc: jffs-dev@axis.com
Subject: Re: About GC 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 13 Sep 2002 08:58:46 +0100
Message-ID: <11218.1031903926@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

(redirected to jffs list)

startec@ms11.hinet.net said:
> The recent CVS code has a great improvement at mounting time. It's
> great. I test it with the 32Mbytes NAND flash and the mounting time
> reduce to 10 seconds(the original time is 50 seconds). After mounting,
> I found that the GC thread will take the most CPU time(99.9)  in my
> system for a while. How can I make jffs2_garbage_collection_pass to
> reduce CPU time?

I just realised that the long mail I just composed on GC performance isn't 
actually related to your question :) But I'm going to send it anyway. First 
though, I'll answer the question.

Aside from GC, the GC thread is now _also_ going through the flash doing all
the CRC checks that the scan code used to do. The main difference is that
you don't have to wait for it. You can even write to the file system before 
it's finished -- you just can't do any GC. So as long as the GC thread was 
staying ahead of you making enough space before you rebooted, you'll be 
able to do some writing before you catch up to it again afterwards.

While it's doing that, it _should_ be being fairly nice and yielding
to other processes which want the CPU. Perhaps the code in 
jffs2_get_inode_nodes() doesn't do that, come to think of it -- sticking a 
cond_resched() in there can't go amiss. 

If you want to get an app running really quickly after boot, mount the 
rootfs readonly, and the GC thread won't start. Then you can get your app 
started and remount read/write, and the GC thread will start up. Or mount 
read/write and send the GC thread a SIGSTOP till you want it to go on. 

I suspect just identifying the places where it needs a cond_resched() would 
probably be sufficient though.

--
dwmw2
