From: tino.keitel@innominate.com (Tino Keitel)
Date: Thu, 6 Mar 2003 10:49:42 +0100
Subject: what CVS tag for kernel 2.4.19
In-Reply-To: <200303052349.33463.tglx@linutronix.de>
References: <20030305145935.GA20555@tkeitel001.bln.gelonet.local> <200303052349.33463.tglx@linutronix.de>
Message-ID: <20030306094941.GA2166@tkeitel001.bln.gelonet.local>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wed, Mar 05, 2003 at 23:49:33 +0100, Thomas Gleixner wrote:
> On Wednesday 05 March 2003 15:59, Tino Keitel wrote:
> > Hi folks,
> >=20
> > what CVS tag should I use to get a CVS working with a stock 2.4.19
> > kernel + shared zlib patch? And what am I doing wrong? I tried
> > jffs2-2_4-branch, NPHASE2_FINAL_BETA and HEAD but always got errors.
> >
> > jffs2-2_4-branch:
> > background.c:115: arguments given to macro =12ecalc_sigpending'
> > background.c:166: arguments given to macro =12ecalc_sigpending'
> >
> > NPHASE2_FINAL_BETA:
> > scan.c: In function 'jffs2_scan_medium':
> > scan.c:84: too many arguments to function
> > scan.c:241: too many arguments to function
> >=20
> > HEAD:
> > In file included from /usr/linux/include/linux/fs.h:704,
> >                  from /usr/linux/include/linux/capability.h:17,
> >                  from /usr/linux/include/linux/binfmts.h:5,
> >                  from /usr/linux/include/linux/sched.h:9,
> >                  from /usr/linux/include/linux/mm.h:4,
> >                  from /usr/linux/include/linux/slab.h:14,
> >                  from /usr/linux/include/linux/proc_fs.h:5,
> >                  from init/main.c:15:
> > /usr/linux/include/linux/jffs2_fs_sb.h:8: linux/workqueue.h: No such
> > file or directory
> >=20
> > In all cases, I used patchin.sh and copied the jffs2 source and header
> > files into the linux source tree.
>=20
> At least HEAD will work even on a vanilla 2.4.19 kernel. The zlib-stuff i=
s=20
> handled by patchin.sh.
> Could you please=20
> 1. get a vanilla 2.4.19 kernel
> 2. configure it
> 3. use patchin.sh
> 4. do not copy anything around
> 5. make
> 6. report results

Success.

--=20
tino.keitel at innominate.com
dipl.-inf.                        Innominate Security Technologies AG
software engineer                                   networking people
tel: +49.30.6392-3308                      http://www.innominate.com/
