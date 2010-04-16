Received: from fg-out-1718.google.com ([72.14.220.156])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O2qvq-0005wD-7F
	for linux-mtd@lists.infradead.org; Fri, 16 Apr 2010 19:10:27 +0000
Received: by fg-out-1718.google.com with SMTP id e21so445173fga.0
	for <linux-mtd@lists.infradead.org>;
	Fri, 16 Apr 2010 12:10:23 -0700 (PDT)
Subject: Re: [PATCH] ubifs: add update vfs super block infomation when
	remount to  ro mode
From: Artem Bityutskiy <dedekind1@gmail.com>
To: ZhangJieJing <kzjeef@gmail.com>
In-Reply-To: <i2ncf7b913c1004152036t3b23af53h339b16092ecdd812@mail.gmail.com>
References: <i2ncf7b913c1004152036t3b23af53h339b16092ecdd812@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 16 Apr 2010 22:10:19 +0300
Message-Id: <1271445019.2532.729.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-04-16 at 11:36 +0800, ZhangJieJing wrote:
> If some read/write error happens(eg.CRC error), ubifs make self a read
> only mode,
> but the vfs infomation still not update.
> This patch add this also make /proc/mounts update.
> 
> Signed-off-by: Zhang Jiejing <kzjeef@gmail.com>
> ---
>  fs/ubifs/io.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
> index 0168271..d33c233 100644
> --- a/fs/ubifs/io.c
> +++ b/fs/ubifs/io.c
> @@ -63,6 +63,7 @@ void ubifs_ro_mode(struct ubifs_info *c, int err)
>        if (!c->ro_media) {
>                c->ro_media = 1;
>                c->no_chk_data_crc = 0;
> +              c->vfs_sb->s_flags |= MS_RDONLY;
>                ubifs_warn("switched to read-only mode, error %d", err);
>                dbg_dump_stack();
>        }

Looks ok for me, thanks, I'll take it to the ubifs-2.6.git tree as soon
as I return to my work office (in 2 weeks).

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
