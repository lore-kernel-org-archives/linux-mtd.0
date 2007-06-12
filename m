Received: from www19.your-server.de ([213.133.104.19])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hy5F3-0008E9-Tx
	for linux-mtd@lists.infradead.org; Tue, 12 Jun 2007 08:13:02 -0400
Received: from [84.189.53.43] (helo=ulitu.handy-pc.constin-design.de)
	by www19.your-server.de with esmtpa (Exim 4.50) id 1Hy5Ek-0004iB-9w
	for linux-mtd@lists.infradead.org; Tue, 12 Jun 2007 14:12:39 +0200
From: Uli Luckas <u.luckas@road-gmbh.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] jffs2_gcd_mtd3, Stopping kernel threads timed out
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_12obG+VQ7mLAbca"
Message-Id: <200706121412.37034.u.luckas@road-gmbh.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Tue, 12 Jun 2007 12:13:07 -0000

--Boundary-00=_12obG+VQ7mLAbca
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi
We experience the following problem when our board tries to suspend:

Jun  7 18:32:21 constin kernel: [ 2085.350000] Stopping tasks ... 
Jun  7 18:32:21 constin kernel: [ 2105.410000] Stopping kernel threads timed 
out after 20 seconds (1 tasks refusing to freeze):
Jun  7 18:32:21 constin kernel: [ 2105.410000]  jffs2_gcd_mtd3
Jun  7 18:32:21 constin kernel: [ 2105.410000] Restarting tasks ... <4> 
Strange, jffs2_gcd_mtd3 not stopped
Jun  7 18:32:21 constin kernel: [ 2105.440000] done.

The problem seems to happen, when suspend kicks in, after the call to 
try_to_freeze and before the while loop in jffs2_garbage_collect_thread.

The pending freeze will cause signal_pending to return true until the 
attempted suspend is over and thereby the while loop won't terminate until 
the suspend times out.

This patch will call try_to_freeze from within the while loop and adds an 
extra check for jffs2_thread_should_wake before we actually do the GC to 
avoid calling jffs2_garbage_collect_pass at every wakeup.

If there are no objections, please apply and push to mainline.

Signed-off-by: Uli Luckas <u.luckas@road.de>


--Boundary-00=_12obG+VQ7mLAbca
Content-Type: text/x-csrc; charset="iso-8859-1"; name="freeze_gc_thread.c"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="freeze_gc_thread.c"

diff --git a/fs/jffs2/background.c b/fs/jffs2/background.c
index 888f236..43a2fc8 100644
=2D-- a/fs/jffs2/background.c
+++ b/fs/jffs2/background.c
@@ -96,9 +96,6 @@ static int jffs2_garbage_collect_thread(void *_c)
 			schedule();
 		}
=20
=2D		if (try_to_freeze())
=2D			continue;
=2D
 		/* This thread is purely an optimisation. But if it runs when
 		   other things could be running, it actually makes things a
 		   lot worse. Use yield() and put it at the back of the runqueue
@@ -113,6 +110,9 @@ static int jffs2_garbage_collect_thread(void *_c)
 			siginfo_t info;
 			unsigned long signr;
=20
+			if (try_to_freeze())
+				continue;
+
 			signr =3D dequeue_signal_lock(current, &current->blocked, &info);
=20
 			switch(signr) {
@@ -137,7 +137,7 @@ static int jffs2_garbage_collect_thread(void *_c)
 		disallow_signal(SIGHUP);
=20
 		D1(printk(KERN_DEBUG "jffs2_garbage_collect_thread(): pass\n"));
=2D		if (jffs2_garbage_collect_pass(c) =3D=3D -ENOSPC) {
+		if (jffs2_thread_should_wake(c) && jffs2_garbage_collect_pass(c) =3D=3D =
=2DENOSPC) {
 			printk(KERN_NOTICE "No space for garbage collection. Aborting GC thread=
\n");
 			goto die;
 		}

--Boundary-00=_12obG+VQ7mLAbca--
