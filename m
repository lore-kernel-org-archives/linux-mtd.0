Received: from [209.178.208.101] (helo=lserver.ddiworldwide.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Qtlx-0003S0-64
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jun 2003 19:59:37 +0100
From: Frank R Callaghan <f.callaghan@ieee.org>
To: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
Date: Fri, 13 Jun 2003 14:47:45 -0400
References: <OOEOKBMECIFAEPIMFOGIMEPICBAA.sgluckman@omnitech.com>
	<200306131411.07069.f.callaghan@ieee.org>
	<1055528889.3632.180.camel@passion.cambridge.redhat.com>
In-Reply-To: <1055528889.3632.180.camel@passion.cambridge.redhat.com>
MIME-Version: 1.0
Message-Id: <200306131447.45138.f.callaghan@ieee.org>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Re: Please Help, problem mounting jffs2
Reply-To: f.callaghan@ieee.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 13 June 2003 02:28 pm, David Woodhouse wrote:
> On Fri, 2003-06-13 at 19:11, Frank R Callaghan wrote:
> > On Friday 13 June 2003 01:39 pm, David Woodhouse wrote:
> > > Looks like it's waiting for the garbage collect thread. What happen=
ed
> > > to it? Can you put a printk into the very beginning of
> > > 'jffs2_garbage_collect_thread()' in background.c, and another print=
k
> > > after the daemonize() call.
> >
> > Like this:
> >
> > static int jffs2_garbage_collect_thread(void *_c)
> > {
> >         struct jffs2_sb_info *c =3D _c;
> >
> >         D1(printk(KERN_DEBUG "****jffs2_garbage_collect_thread
> > start...\n"));
> >
> > -----------------
> > No extra output !!!
> > -----------------
>
> Just like that... in which case for some reason kernel_thread() is not
> working. What architecture is it?
>

i486 ELAN(SC520)

> > > Also hit SysRq-T and see exactly where the mount process is waiting=
 --
> > > I suspect it's in jffs2_start_garbage_collect_thread().
> >
> > I'm running this on an embedded system and the console is via minicom
> > (ttyS1), SysRq-T doesn't seem to work !
>
> Hmmm. It may require that there's something in userspace trying to read
> from the port. There are also hacks around to enable sysrq by echoing
> letters to a /proc file. Doesn't really matter -- it's fairly obvious
> it's never actually making it into the kernel thread.

OK, this sounds bad !  Where can I go from here ?
I really need this flash working for the product to be viable !
Is this a kernel bug ? uclibc ? RTAI ?
Is there anyway to hack the code to get it working ?

Help !!!
