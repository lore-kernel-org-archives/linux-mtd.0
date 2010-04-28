Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O71hU-0005rf-Ol
	for linux-mtd@lists.infradead.org; Wed, 28 Apr 2010 07:28:53 +0000
Subject: Re: [PATCH] ubifs: add update vfs super block infomation when
	remount to  ro mode
From: Artem Bityutskiy <dedekind1@gmail.com>
To: ZhangJieJing <kzjeef@gmail.com>
In-Reply-To: <i2ncf7b913c1004152036t3b23af53h339b16092ecdd812@mail.gmail.com>
References: <i2ncf7b913c1004152036t3b23af53h339b16092ecdd812@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 28 Apr 2010 10:24:13 +0300
Message-ID: <1272439453.7750.20.camel@localhost>
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
> --
> 1.6.3.3

Your patch is not applicable. Try to save your own e-mail and apply the
patch with 'git am'.

Applying: UBIFS: mark VFS SB RO too
fatal: corrupt patch at line 9
Patch failed at 0001 UBIFS: mark VFS SB RO too
When you have resolved this problem run "git am -i --resolved".
If you would prefer to skip this patch, instead run "git am -i --skip".
To restore the original branch and stop patching run "git am -i
--abort".
[dedekind@sauron ubifs-2.6]\$ patch -p1 < .git/rebase-apply/patch 
patching file fs/ubifs/io.c
patch: **** malformed patch at line 9: �� � � if (!c->ro_media) {


But I've fixed this up and applied manually. It is now in the
ubifs-2.6.git tree, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
