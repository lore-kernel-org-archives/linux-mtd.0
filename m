Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QsVX-0002lX-OD
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jun 2003 18:38:35 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: f.callaghan@ieee.org
In-Reply-To: <200306131258.58729.f.callaghan@ieee.org>
References: <OOEOKBMECIFAEPIMFOGIMEPICBAA.sgluckman@omnitech.com>
	 <200306131153.42657.f.callaghan@ieee.org>
	 <1055521884.3632.158.camel@passion.cambridge.redhat.com>
	 <200306131258.58729.f.callaghan@ieee.org>
Message-Id: <1055525947.3632.163.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 13 Jun 2003 18:39:07 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Please Help, problem mounting jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Looks like it's waiting for the garbage collect thread. What happened to
it? Can you put a printk into the very beginning of
'jffs2_garbage_collect_thread()' in background.c, and another printk
after the daemonize() call. 

Also hit SysRq-T and see exactly where the mount process is waiting -- I
suspect it's in jffs2_start_garbage_collect_thread().

-- 
dwmw2
