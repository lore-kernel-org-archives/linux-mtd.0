Received: from mout.kundenserver.de ([217.72.192.75])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFiU2-0008KA-Hr
 for linux-mtd@lists.infradead.org; Wed, 22 Jun 2016 13:46:23 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: Deepa Dinamani <deepa.kernel@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 tglx@linutronix.de, torvalds@linux-foundation.org, tytso@mit.edu,
 viro@zeniv.linux.org.uk, y2038@lists.linaro.org,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 07/24] fs: ubifs: Replace CURRENT_TIME_SEC with
 current_time
Date: Wed, 22 Jun 2016 15:47:56 +0200
Message-ID: <5694616.oYyysJP9uD@wuerfel>
In-Reply-To: <1466382443-11063-8-git-send-email-deepa.kernel@gmail.com>
References: <1466382443-11063-1-git-send-email-deepa.kernel@gmail.com>
 <1466382443-11063-8-git-send-email-deepa.kernel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday, June 19, 2016 5:27:06 PM CEST Deepa Dinamani wrote:
> @@ -84,6 +84,8 @@ static int create_default_filesystem(struct ubifs_info *c)
>         int min_leb_cnt = UBIFS_MIN_LEB_CNT;
>         long long tmp64, main_bytes;
>         __le64 tmp_le64;
> +       __le32 tmp_le32;
> +       struct timespec ts;
>  
>         /* Some functions called from here depend on the @c->key_len filed */
>         c->key_len = UBIFS_SK_LEN;
> @@ -297,13 +299,17 @@ static int create_default_filesystem(struct ubifs_info *c)
>         ino->ch.node_type = UBIFS_INO_NODE;
>         ino->creat_sqnum = cpu_to_le64(++c->max_sqnum);
>         ino->nlink = cpu_to_le32(2);
> -       tmp_le64 = cpu_to_le64(CURRENT_TIME_SEC.tv_sec);
> +
> +       ktime_get_real_ts(&ts);
> +       ts = timespec_trunc(ts, DEFAULT_TIME_GRAN);
> +       tmp_le64 = cpu_to_le64(ts.tv_sec);
>         ino->atime_sec   = tmp_le64;
>         ino->ctime_sec   = tmp_le64;
>         ino->mtime_sec   = tmp_le64;
> -       ino->atime_nsec  = 0;
> -       ino->ctime_nsec  = 0;
> -       ino->mtime_nsec  = 0;
> +       tmp_le32 = cpu_to_le32(ts.tv_nsec);
> +       ino->atime_nsec  = tmp_le32;
> +       ino->ctime_nsec  = tmp_le32;
> +       ino->mtime_nsec  = tmp_le32;

This part of the patch seems independent of the rest, as you don't actually
use current_time() here, or assign the timespec to an inode.

I'd suggest either leaving this part out of the patch series for now,
or making it a separate patch that uses timespec64 directly.

	Arnd
