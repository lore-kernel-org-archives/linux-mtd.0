Received: from [209.178.208.101] (helo=lserver.ddiworldwide.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QtCX-00033M-OD
	for <linux-mtd@lists.infradead.org>; Fri, 13 Jun 2003 19:23:02 +0100
From: Frank R Callaghan <f.callaghan@ieee.org>
To: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
Date: Fri, 13 Jun 2003 14:11:07 -0400
References: <OOEOKBMECIFAEPIMFOGIMEPICBAA.sgluckman@omnitech.com>
	<200306131258.58729.f.callaghan@ieee.org>
	<1055525947.3632.163.camel@passion.cambridge.redhat.com>
In-Reply-To: <1055525947.3632.163.camel@passion.cambridge.redhat.com>
MIME-Version: 1.0
Message-Id: <200306131411.07069.f.callaghan@ieee.org>
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

On Friday 13 June 2003 01:39 pm, David Woodhouse wrote:
> Looks like it's waiting for the garbage collect thread. What happened t=
o
> it? Can you put a printk into the very beginning of
> 'jffs2_garbage_collect_thread()' in background.c, and another printk
> after the daemonize() call.

Like this:

static int jffs2_garbage_collect_thread(void *_c)
{
        struct jffs2_sb_info *c =3D _c;

        D1(printk(KERN_DEBUG "****jffs2_garbage_collect_thread start...\n=
"));

        daemonize("jffs2_gcd_mtd%d", c->mtd->index);

        D1(printk(KERN_DEBUG "****jffs2_garbage_collect_thread after=20
daemonize()...\n"));

        c->gc_task =3D current;
        up(&c->gc_thread_start);

-----------------
No extra output !!!
-----------------

>
> Also hit SysRq-T and see exactly where the mount process is waiting -- =
I
> suspect it's in jffs2_start_garbage_collect_thread().

I'm running this on an embedded system and the console is via minicom (tt=
yS1),=20
SysRq-T doesn't seem to work !

If I have to I can bodge up some H/W to allow a real console (only as a l=
ast=20
resort) ;)

TIA,
	Frank.
