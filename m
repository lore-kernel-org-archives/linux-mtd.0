Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QtGz-00039W-RW
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jun 2003 19:27:37 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: f.callaghan@ieee.org
In-Reply-To: <200306131411.07069.f.callaghan@ieee.org>
References: <OOEOKBMECIFAEPIMFOGIMEPICBAA.sgluckman@omnitech.com>
	 <200306131258.58729.f.callaghan@ieee.org>
	 <1055525947.3632.163.camel@passion.cambridge.redhat.com>
	 <200306131411.07069.f.callaghan@ieee.org>
Message-Id: <1055528889.3632.180.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 13 Jun 2003 19:28:09 +0100
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

On Fri, 2003-06-13 at 19:11, Frank R Callaghan wrote:
> On Friday 13 June 2003 01:39 pm, David Woodhouse wrote:
> > Looks like it's waiting for the garbage collect thread. What happened to
> > it? Can you put a printk into the very beginning of
> > 'jffs2_garbage_collect_thread()' in background.c, and another printk
> > after the daemonize() call.
> 
> Like this:
> 
> static int jffs2_garbage_collect_thread(void *_c)
> {
>         struct jffs2_sb_info *c = _c;
> 
>         D1(printk(KERN_DEBUG "****jffs2_garbage_collect_thread start...\n"));
> 
> -----------------
> No extra output !!!
> -----------------

Just like that... in which case for some reason kernel_thread() is not
working. What architecture is it?

> >
> > Also hit SysRq-T and see exactly where the mount process is waiting -- I
> > suspect it's in jffs2_start_garbage_collect_thread().
> 
> I'm running this on an embedded system and the console is via minicom (ttyS1), 
> SysRq-T doesn't seem to work !

Hmmm. It may require that there's something in userspace trying to read
from the port. There are also hacks around to enable sysrq by echoing
letters to a /proc file. Doesn't really matter -- it's fairly obvious
it's never actually making it into the kernel thread.

-- 
dwmw2
