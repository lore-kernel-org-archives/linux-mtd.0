Received: from www19.your-server.de ([213.133.104.19])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I3D3n-0000Y0-LW
	for linux-mtd@lists.infradead.org; Tue, 26 Jun 2007 11:34:34 -0400
From: Uli Luckas <u.luckas@road.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] jffs2_gcd_mtd3, Stopping kernel threads timed out
Date: Tue, 26 Jun 2007 17:34:24 +0200
References: <200706141509.50621.u.luckas@road.de>
	<200706261506.28737.u.luckas@road.de>
	<1182863977.19501.4.camel@weaponx.rchland.ibm.com>
In-Reply-To: <1182863977.19501.4.camel@weaponx.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200706261734.25107.u.luckas@road.de>
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, 26. June 2007, Josh Boyer wrote:
> On Tue, 2007-06-26 at 15:06 +0200, Uli Luckas wrote:
> > On Tuesday, 19. June 2007, Uli Luckas wrote:
> > > Hi,
> > > is there anything in the way of apllying this patch?
> >
> > Please, can someone tell me what it takes to get a jffs2 bug fix into t=
he
> > kernel? Or even reviewed? This patch should even get into 2.6.22. Am I
> > doing something wrong here?
>
> You aren't doing anything wrong. =A0David is away on business.
>
does that mean, we won't get any fixes applied, before David is back? And d=
oes=20
anyone know, when he will be back?

> The one thing I would hesitate with about your patch is that you've now
> broken the existing behavior of the thread in regards to SIGHUP. =A0You
> used to be able to send the threads a SIGHUP and it would do a single
> pass. =A0With your patch, it won't do that unless the thresholds are
> right. =A0Being able to send SIGHUP to force a GC pass is a pretty useful
> thing for debugging, etc.
>
thanks Josh, alot for reviewing the patch. Following your advise, I force G=
C=20
now, if SIGHUP was received.
The patch still introduces a change in sematics though for all other signal=
s=20
(except SIGKILL). But I feel, the new behavior is more what one would expec=
t.=20
In case, the old behavior is desired, it is simple enough to set force_gc i=
n=20
the coresponding branches.

regards,
Uli

Signed-off-by: Uli Luckas <u.luckas@road.de>

diff --git a/fs/jffs2/background.c b/fs/jffs2/background.c
index 888f236..1843786 100644
=2D-- a/fs/jffs2/background.c
+++ b/fs/jffs2/background.c
@@ -71,6 +71,7 @@ void jffs2_stop_garbage_collect_thread(struct jffs2_sb_in=
fo *c)
=20
 static int jffs2_garbage_collect_thread(void *_c)
 {
+	int force_gc;
 	struct jffs2_sb_info *c =3D _c;
=20
 	daemonize("jffs2_gcd_mtd%d", c->mtd->index);
@@ -96,9 +97,6 @@ static int jffs2_garbage_collect_thread(void *_c)
 			schedule();
 		}
=20
=2D		if (try_to_freeze())
=2D			continue;
=2D
 		/* This thread is purely an optimisation. But if it runs when
 		   other things could be running, it actually makes things a
 		   lot worse. Use yield() and put it at the back of the runqueue
@@ -109,10 +107,14 @@ static int jffs2_garbage_collect_thread(void *_c)
=20
 		/* Put_super will send a SIGKILL and then wait on the sem.
 		 */
+		force_gc =3D 0;
 		while (signal_pending(current)) {
 			siginfo_t info;
 			unsigned long signr;
=20
+			if (try_to_freeze())
+				continue;
+
 			signr =3D dequeue_signal_lock(current, &current->blocked, &info);
=20
 			switch(signr) {
@@ -128,6 +130,7 @@ static int jffs2_garbage_collect_thread(void *_c)
=20
 			case SIGHUP:
 				D1(printk(KERN_DEBUG "jffs2_garbage_collect_thread(): SIGHUP received.=
\n"));
+				force_gc =3D 1;
 				break;
 			default:
 				D1(printk(KERN_DEBUG "jffs2_garbage_collect_thread(): signal %ld recei=
ved\n", signr));
@@ -137,7 +140,8 @@ static int jffs2_garbage_collect_thread(void *_c)
 		disallow_signal(SIGHUP);
=20
 		D1(printk(KERN_DEBUG "jffs2_garbage_collect_thread(): pass\n"));
=2D		if (jffs2_garbage_collect_pass(c) =3D=3D -ENOSPC) {
+		if ((force_gc || jffs2_thread_should_wake(c))
+		     && jffs2_garbage_collect_pass(c) =3D=3D -ENOSPC) {
 			printk(KERN_NOTICE "No space for garbage collection. Aborting GC thread=
\n");
 			goto die;
 		}

=2D-=20

=2D------ ROAD ...the handyPC Company - - -  ) ) )

Uli Luckas
Software Development

ROAD GmbH
Bennigsenstr. 14 | 12159 Berlin | Germany
fon: +49 (30) 230069 - 64 | fax: +49 (30) 230069 - 69
url: www.road.de

Amtsgericht Charlottenburg: HRB 96688 B
Managing directors: Hans-Peter Constien, Hubertus von Streit
