Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAh9T-0000t8-MA
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 18:24:57 +0000
Date: Tue, 16 May 2017 15:24:18 -0300
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Darren Hart <dvhart@infradead.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho
 Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan
 Corbet <corbet@lwn.net>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org, Peter Zijlstra
 <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner
 <tglx@linutronix.de>
Subject: Re: [PATCH v2 04/53] mutex, futex: adjust kernel-doc markups to
 generate ReST
Message-ID: <20170516152418.6f68b2af@vela.lan>
In-Reply-To: <20170516173540.GA28967@fury>
References: <cover.1494935649.git.mchehab@s-opensource.com>
 <7b4ff1adb57ad96d8f12a05d8c661a3d8c4d2be1.1494935649.git.mchehab@s-opensource.com>
 <20170516173540.GA28967@fury>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Em Tue, 16 May 2017 10:35:40 -0700
Darren Hart <dvhart@infradead.org> escreveu:

> On Tue, May 16, 2017 at 09:15:56AM -0300, Mauro Carvalho Chehab wrote:
> > There are a few issues on some kernel-doc markups that was
> > causing troubles with kernel-doc output on ReST format:
> >=20
> > ./kernel/futex.c:492: WARNING: Inline emphasis start-string without end=
-string.
> > ./kernel/futex.c:1264: WARNING: Block quote ends without a blank line; =
unexpected unindent.
> > ./kernel/futex.c:1721: WARNING: Block quote ends without a blank line; =
unexpected unindent.
> > ./kernel/futex.c:2338: WARNING: Block quote ends without a blank line; =
unexpected unindent.
> > ./kernel/futex.c:2426: WARNING: Block quote ends without a blank line; =
unexpected unindent.
> > ./kernel/futex.c:2899: WARNING: Block quote ends without a blank line; =
unexpected unindent.
> > ./kernel/futex.c:2972: WARNING: Block quote ends without a blank line; =
unexpected unindent.
> >=20
> > Fix them.
> >=20
> > No functional changes.
> >=20
> > Acked-by: Darren Hart (VMware) <dvhart@infradead.org>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
> > --- =20
>=20
>=20
> What was the difference from v1? Quick scan didn't reveal anything obviou=
s to
> me... (context left intact in case you want to point it out inline), but =
just a
> "Changes since v1" below the --- is always appreciated - even it it's "no
> changes, new commit log".

=46rom v1, the .. note:: got removed. That's pretty much the same version
found on one of my replies + the addition of the warnings it produces
without the patch.

Regards,
Mauro

>=20
>=20
> >  include/linux/mutex.h  |  6 +++---
> >  kernel/futex.c         | 40 ++++++++++++++++++++--------------------
> >  kernel/locking/mutex.c |  6 +++---
> >  3 files changed, 26 insertions(+), 26 deletions(-)
> >=20
> > diff --git a/include/linux/mutex.h b/include/linux/mutex.h
> > index 1127fe31645d..ffcba1f337da 100644
> > --- a/include/linux/mutex.h
> > +++ b/include/linux/mutex.h
> > @@ -214,9 +214,9 @@ enum mutex_trylock_recursive_enum {
> >   * raisins, and once those are gone this will be removed.
> >   *
> >   * Returns:
> > - *  MUTEX_TRYLOCK_FAILED    - trylock failed,
> > - *  MUTEX_TRYLOCK_SUCCESS   - lock acquired,
> > - *  MUTEX_TRYLOCK_RECURSIVE - we already owned the lock.
> > + *  - MUTEX_TRYLOCK_FAILED    - trylock failed,
> > + *  - MUTEX_TRYLOCK_SUCCESS   - lock acquired,
> > + *  - MUTEX_TRYLOCK_RECURSIVE - we already owned the lock.
> >   */
> >  static inline /* __deprecated */ __must_check enum mutex_trylock_recur=
sive_enum
> >  mutex_trylock_recursive(struct mutex *lock)
> > diff --git a/kernel/futex.c b/kernel/futex.c
> > index 357348a6cf6b..b8ae87d227da 100644
> > --- a/kernel/futex.c
> > +++ b/kernel/futex.c
> > @@ -488,7 +488,7 @@ static void drop_futex_key_refs(union futex_key *ke=
y)
> >   *
> >   * Return: a negative error code or 0
> >   *
> > - * The key words are stored in *key on success.
> > + * The key words are stored in @key on success.
> >   *
> >   * For shared mappings, it's (page->index, file_inode(vma->vm_file),
> >   * offset_within_page).  For private mappings, it's (uaddr, current->m=
m).
> > @@ -1259,9 +1259,9 @@ static int lock_pi_update_atomic(u32 __user *uadd=
r, u32 uval, u32 newval)
> >   * @set_waiters:	force setting the FUTEX_WAITERS bit (1) or not (0)
> >   *
> >   * Return:
> > - *  0 - ready to wait;
> > - *  1 - acquired the lock;
> > - * <0 - error
> > + *  -  0 - ready to wait;
> > + *  -  1 - acquired the lock;
> > + *  - <0 - error
> >   *
> >   * The hb->lock and futex_key refs shall be held by the caller.
> >   */
> > @@ -1717,9 +1717,9 @@ void requeue_pi_wake_futex(struct futex_q *q, uni=
on futex_key *key,
> >   * hb1 and hb2 must be held by the caller.
> >   *
> >   * Return:
> > - *  0 - failed to acquire the lock atomically;
> > - * >0 - acquired the lock, return value is vpid of the top_waiter
> > - * <0 - error
> > + *  -  0 - failed to acquire the lock atomically;
> > + *  - >0 - acquired the lock, return value is vpid of the top_waiter
> > + *  - <0 - error
> >   */
> >  static int futex_proxy_trylock_atomic(u32 __user *pifutex,
> >  				 struct futex_hash_bucket *hb1,
> > @@ -1785,8 +1785,8 @@ static int futex_proxy_trylock_atomic(u32 __user =
*pifutex,
> >   * uaddr2 atomically on behalf of the top waiter.
> >   *
> >   * Return:
> > - * >=3D0 - on success, the number of tasks requeued or woken;
> > - *  <0 - on error
> > + *  - >=3D0 - on success, the number of tasks requeued or woken;
> > + *  -  <0 - on error
> >   */
> >  static int futex_requeue(u32 __user *uaddr1, unsigned int flags,
> >  			 u32 __user *uaddr2, int nr_wake, int nr_requeue,
> > @@ -2142,8 +2142,8 @@ static inline void queue_me(struct futex_q *q, st=
ruct futex_hash_bucket *hb)
> >   * be paired with exactly one earlier call to queue_me().
> >   *
> >   * Return:
> > - *   1 - if the futex_q was still queued (and we removed unqueued it);
> > - *   0 - if the futex_q was already removed by the waking thread
> > + *  - 1 - if the futex_q was still queued (and we removed unqueued it);
> > + *  - 0 - if the futex_q was already removed by the waking thread
> >   */
> >  static int unqueue_me(struct futex_q *q)
> >  {
> > @@ -2333,9 +2333,9 @@ static long futex_wait_restart(struct restart_blo=
ck *restart);
> >   * acquire the lock. Must be called with the hb lock held.
> >   *
> >   * Return:
> > - *  1 - success, lock taken;
> > - *  0 - success, lock not taken;
> > - * <0 - on error (-EFAULT)
> > + *  -  1 - success, lock taken;
> > + *  -  0 - success, lock not taken;
> > + *  - <0 - on error (-EFAULT)
> >   */
> >  static int fixup_owner(u32 __user *uaddr, struct futex_q *q, int locke=
d)
> >  {
> > @@ -2422,8 +2422,8 @@ static void futex_wait_queue_me(struct futex_hash=
_bucket *hb, struct futex_q *q,
> >   * with no q.key reference on failure.
> >   *
> >   * Return:
> > - *  0 - uaddr contains val and hb has been locked;
> > - * <1 - -EFAULT or -EWOULDBLOCK (uaddr does not contain val) and hb is=
 unlocked
> > + *  -  0 - uaddr contains val and hb has been locked;
> > + *  - <1 - -EFAULT or -EWOULDBLOCK (uaddr does not contain val) and hb=
 is unlocked
> >   */
> >  static int futex_wait_setup(u32 __user *uaddr, u32 val, unsigned int f=
lags,
> >  			   struct futex_q *q, struct futex_hash_bucket **hb)
> > @@ -2895,8 +2895,8 @@ static int futex_unlock_pi(u32 __user *uaddr, uns=
igned int flags)
> >   * called with the hb lock held.
> >   *
> >   * Return:
> > - *  0 =3D no early wakeup detected;
> > - * <0 =3D -ETIMEDOUT or -ERESTARTNOINTR
> > + *  -  0 =3D no early wakeup detected;
> > + *  - <0 =3D -ETIMEDOUT or -ERESTARTNOINTR
> >   */
> >  static inline
> >  int handle_early_requeue_pi_wakeup(struct futex_hash_bucket *hb,
> > @@ -2968,8 +2968,8 @@ int handle_early_requeue_pi_wakeup(struct futex_h=
ash_bucket *hb,
> >   * If 4 or 7, we cleanup and return with -ETIMEDOUT.
> >   *
> >   * Return:
> > - *  0 - On success;
> > - * <0 - On error
> > + *  -  0 - On success;
> > + *  - <0 - On error
> >   */
> >  static int futex_wait_requeue_pi(u32 __user *uaddr, unsigned int flags,
> >  				 u32 val, ktime_t *abs_time, u32 bitset,
> > diff --git a/kernel/locking/mutex.c b/kernel/locking/mutex.c
> > index 198527a62149..858a07590e39 100644
> > --- a/kernel/locking/mutex.c
> > +++ b/kernel/locking/mutex.c
> > @@ -227,9 +227,9 @@ static void __sched __mutex_lock_slowpath(struct mu=
tex *lock);
> >   * (or statically defined) before it can be locked. memset()-ing
> >   * the mutex to 0 is not allowed.
> >   *
> > - * ( The CONFIG_DEBUG_MUTEXES .config option turns on debugging
> > - *   checks that will enforce the restrictions and will also do
> > - *   deadlock debugging. )
> > + * (The CONFIG_DEBUG_MUTEXES .config option turns on debugging
> > + * checks that will enforce the restrictions and will also do
> > + * deadlock debugging)
> >   *
> >   * This function is similar to (but not equivalent to) down().
> >   */
> > --=20
> > 2.9.3
> >=20
> >  =20
>=20




Cheers,
Mauro
