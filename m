Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 181RFy-0007HJ-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2002 13:57:06 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <00bf01c27443$37238220$b30210ac@gv.com.tw> 
References: <00bf01c27443$37238220$b30210ac@gv.com.tw>  <000e01c27400$f0766c30$80d1a8c0@synso.com.tw> <32372.1034663283@passion.cambridge.redhat.com> 
To: "??" <kevin@gv.com.tw>
Cc: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: Re: [power-saving issue] 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 15 Oct 2002 13:56:42 +0100
Message-ID: <10482.1034686602@passion.cambridge.redhat.com>
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

kevin@gv.com.tw said:
>  we want to stop gc thread manually when system goto suspend mode,
> can we simply call "jffs2_stop_garbage_collect_thread()"? and how to
> get its param: "struct jffs2_sb_info *c"

Send it a SIGSTOP from userspace, then a SIGCONT when you want it to wake 
up. Or send it a SIGKILL to kill it permanently (until the next remount).

> btw, i think gc thread wakeup only if its necessary not regularly,
> right?

Correct.

--
dwmw2
