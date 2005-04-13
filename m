Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DLjdj-0006sN-0L
	for linux-mtd@lists.infradead.org; Wed, 13 Apr 2005 11:18:51 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
In-Reply-To: <loom.20050413T160136-559@post.gmane.org>
References: <loom.20050413T142519-107@post.gmane.org>
	<1113400225.23175.9.camel@sauron.oktetlabs.ru>
	<loom.20050413T160136-559@post.gmane.org>
Content-Type: text/plain
Date: Wed, 13 Apr 2005 19:18:21 +0400
Message-Id: <1113405501.23175.27.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mounting jffs2
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-04-13 at 14:22 +0000, Sergei Sharonov wrote:
> # time umount /mnt/flash/
> 
> real    11m25.534s
> user    0m0.000s
> sys     0m0.250s
Try to change 

D1(printk(KERN_DEBUG "jffs2_garbage_collect_thread(): SIGKILL
received.\n"));

to

printk(KERN_DEBUG "jffs2_garbage_collect_thread(): SIGKILL
received.\n");

at background.c:116 and see whether GC thread receives SIGKILL on
unmount and when it receives it (just after or on 11 min).

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
