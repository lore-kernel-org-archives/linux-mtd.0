Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkCRH-0005zY-Et
 for linux-mtd@lists.infradead.org; Wed, 14 Sep 2016 15:49:32 +0000
Date: Wed, 14 Sep 2016 17:48:58 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Artem Bityutskiy
 <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] ubifs: use dirty_writeback_interval value for wbuf
 timer
Message-ID: <20160914174858.2bc8ff2e@bbrezillon>
In-Reply-To: <20160914102435.22312-3-zajec5@gmail.com>
References: <20160914102435.22312-2-zajec5@gmail.com>
 <20160914102435.22312-3-zajec5@gmail.com>
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

On Wed, 14 Sep 2016 12:24:35 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> Right now wbuf timer has hardcoded timeouts and there is no place for
> manual adjustments. Some projects / cases many need that though. Few
> file systems allow doing that by respecting dirty_writeback_interval
> that can be set using sysctl (dirty_writeback_centisecs).
>=20
> Lowering dirty_writeback_interval could be some way of dealing with user
> space apps lacking proper fsyncs. This is definitely *not* a perfect
> solution but we don't have ideal (user space) world. There were already
> advanced discussions on this matter, mostly when ext4 was introduced and
> it wasn't behaving as ext3. Anyway, the final decision was to add some
> hacks to the ext4, as trying to fix whole user space or adding new API
> was pointless.
>=20
> We can't (and shouldn't?) just follow ext4. We can't e.g. sync on close
> as this would cause too many commits and flash wearing. On the other
> hand we still should allow some trade-off between -o sync and default
> wbuf timeout. Respecting dirty_writeback_interval should allow some sane
> cutomizations if used warily.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
>  fs/ubifs/io.c    | 7 ++-----
>  fs/ubifs/ubifs.h | 4 ----
>  2 files changed, 2 insertions(+), 9 deletions(-)
>=20
> diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
> index 4d6ce4a..aced6ee 100644
> --- a/fs/ubifs/io.c
> +++ b/fs/ubifs/io.c
> @@ -452,11 +452,8 @@ static enum hrtimer_restart wbuf_timer_callback_nolo=
ck(struct hrtimer *timer)
>   */
>  static void new_wbuf_timer_nolock(struct ubifs_wbuf *wbuf)
>  {
> -	ktime_t softlimit =3D ktime_set(WBUF_TIMEOUT_SOFTLIMIT, 0);
> -	unsigned long long delta;
> -
> -	delta =3D WBUF_TIMEOUT_HARDLIMIT - WBUF_TIMEOUT_SOFTLIMIT;
> -	delta *=3D 1000000000ULL;
> +	ktime_t softlimit =3D ms_to_ktime(dirty_writeback_interval * 10);
> +	unsigned long long delta =3D dirty_writeback_interval; /* 10% delta */

dirty_writeback_interval is expressed in centiseconds, and delta is in
nanoseconds.

I think you miss

	delta *=3D 10000000ULL;

> =20
>  	ubifs_assert(!hrtimer_active(&wbuf->timer));
>  	ubifs_assert(delta <=3D ULONG_MAX);
> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
> index 11bc8fa..26e6340 100644
> --- a/fs/ubifs/ubifs.h
> +++ b/fs/ubifs/ubifs.h
> @@ -83,10 +83,6 @@
>   */
>  #define BGT_NAME_PATTERN "ubifs_bgt%d_%d"
> =20
> -/* Write-buffer synchronization timeout interval in seconds */
> -#define WBUF_TIMEOUT_SOFTLIMIT 3
> -#define WBUF_TIMEOUT_HARDLIMIT 5
> -
>  /* Maximum possible inode number (only 32-bit inodes are supported now) =
*/
>  #define MAX_INUM 0xFFFFFFFF
> =20
