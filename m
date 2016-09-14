Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkC72-0000f1-RU
 for linux-mtd@lists.infradead.org; Wed, 14 Sep 2016 15:28:38 +0000
Date: Wed, 14 Sep 2016 17:28:04 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org, Adrian Hunter
 <adrian.hunter@intel.com>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/2] ubifs: drop softlimit and delta fields from struct
 ubifs_wbuf
Message-ID: <20160914172804.00299d52@bbrezillon>
In-Reply-To: <20160914172428.3893ff2f@bbrezillon>
References: <20160914102435.22312-2-zajec5@gmail.com>
 <20160914172428.3893ff2f@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 14 Sep 2016 17:24:28 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Wed, 14 Sep 2016 12:24:34 +0200
> Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
>=20
> > From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >=20
> > Values of these fields are set during init and never modified. They are
> > used (read) in a single function only. There isn't really any reason to
> > keep them in a struct. It only makes struct just a bit bigger without
> > any clear gain.
> >=20
> > Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> > ---
> >  fs/ubifs/io.c    | 18 ++++++++++--------
> >  fs/ubifs/ubifs.h |  5 -----
> >  2 files changed, 10 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
> > index 97be412..4d6ce4a 100644
> > --- a/fs/ubifs/io.c
> > +++ b/fs/ubifs/io.c
> > @@ -452,16 +452,22 @@ static enum hrtimer_restart wbuf_timer_callback_n=
olock(struct hrtimer *timer)
> >   */
> >  static void new_wbuf_timer_nolock(struct ubifs_wbuf *wbuf)
> >  {
> > +	ktime_t softlimit =3D ktime_set(WBUF_TIMEOUT_SOFTLIMIT, 0);
> > +	unsigned long long delta;
> > +
> > +	delta =3D WBUF_TIMEOUT_HARDLIMIT - WBUF_TIMEOUT_SOFTLIMIT;
> > +	delta *=3D 1000000000ULL;
> > +
> >  	ubifs_assert(!hrtimer_active(&wbuf->timer));
> > +	ubifs_assert(delta <=3D ULONG_MAX); =20
>=20
> Hm, do we really want to recalculate delta each time we reschedule the
> wbuf timer?
>=20
> How about making the softlimit and delta variables static and
> initializing them once?

Nevermind. I just read patch 2, and these delta and softlimit values
have to be recalculated to account for dirty_writeback_interval changes.

>=20
> > =20
> >  	if (wbuf->no_timer)
> >  		return;
> >  	dbg_io("set timer for jhead %s, %llu-%llu millisecs",
> >  	       dbg_jhead(wbuf->jhead),
> > -	       div_u64(ktime_to_ns(wbuf->softlimit), USEC_PER_SEC),
> > -	       div_u64(ktime_to_ns(wbuf->softlimit) + wbuf->delta,
> > -		       USEC_PER_SEC));
> > -	hrtimer_start_range_ns(&wbuf->timer, wbuf->softlimit, wbuf->delta,
> > +	       div_u64(ktime_to_ns(softlimit), USEC_PER_SEC),
> > +	       div_u64(ktime_to_ns(softlimit) + delta, USEC_PER_SEC));
> > +	hrtimer_start_range_ns(&wbuf->timer, softlimit, delta,
> >  			       HRTIMER_MODE_REL);
> >  }
> > =20
> > @@ -1059,10 +1065,6 @@ int ubifs_wbuf_init(struct ubifs_info *c, struct=
 ubifs_wbuf *wbuf)
> > =20
> >  	hrtimer_init(&wbuf->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> >  	wbuf->timer.function =3D wbuf_timer_callback_nolock;
> > -	wbuf->softlimit =3D ktime_set(WBUF_TIMEOUT_SOFTLIMIT, 0);
> > -	wbuf->delta =3D WBUF_TIMEOUT_HARDLIMIT - WBUF_TIMEOUT_SOFTLIMIT;
> > -	wbuf->delta *=3D 1000000000ULL;
> > -	ubifs_assert(wbuf->delta <=3D ULONG_MAX);
> >  	return 0;
> >  }
> > =20
> > diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
> > index 4617d45..11bc8fa 100644
> > --- a/fs/ubifs/ubifs.h
> > +++ b/fs/ubifs/ubifs.h
> > @@ -644,9 +644,6 @@ typedef int (*ubifs_lpt_scan_callback)(struct ubifs=
_info *c,
> >   * @io_mutex: serializes write-buffer I/O
> >   * @lock: serializes @buf, @lnum, @offs, @avail, @used, @next_ino and =
@inodes
> >   *        fields
> > - * @softlimit: soft write-buffer timeout interval
> > - * @delta: hard and soft timeouts delta (the timer expire interval is =
@softlimit
> > - *         and @softlimit + @delta)
> >   * @timer: write-buffer timer
> >   * @no_timer: non-zero if this write-buffer does not have a timer
> >   * @need_sync: non-zero if the timer expired and the wbuf needs sync'i=
ng
> > @@ -675,8 +672,6 @@ struct ubifs_wbuf {
> >  	int (*sync_callback)(struct ubifs_info *c, int lnum, int free, int pa=
d);
> >  	struct mutex io_mutex;
> >  	spinlock_t lock;
> > -	ktime_t softlimit;
> > -	unsigned long long delta;
> >  	struct hrtimer timer;
> >  	unsigned int no_timer:1;
> >  	unsigned int need_sync:1; =20
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
