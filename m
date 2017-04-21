Received: from mail-ua0-x244.google.com ([2607:f8b0:400c:c08::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1Rj7-0002cJ-Hh
 for linux-mtd@lists.infradead.org; Fri, 21 Apr 2017 06:07:31 +0000
Received: by mail-ua0-x244.google.com with SMTP id x28so4200409uab.3
 for <linux-mtd@lists.infradead.org>; Thu, 20 Apr 2017 23:07:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1492150566-3158-1-git-send-email-rockdotlee@gmail.com>
References: <1492150566-3158-1-git-send-email-rockdotlee@gmail.com>
From: Rock Lee <rockdotlee@gmail.com>
Date: Fri, 21 Apr 2017 14:07:06 +0800
Message-ID: <CAL-1w2sfbhdqE_1Gw5ZoAgNB7P3n_O2Ghj06Opnp-Oeq6e77pw@mail.gmail.com>
Subject: Re: [PATCH] ubifs: fix a typo in comment of ioctl2ubifs & ubifs2ioctl
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi:
Does UBIFS do not accept typo fix any more, or did I miss something?

On Fri, Apr 14, 2017 at 2:16 PM, Rock Lee <rockdotlee@gmail.com> wrote:
> Change 'convert' to 'converts'
> Change 'UBIFS' to 'UBIFS inode flags'
>
> Signed-off-by: Rock Lee <rockdotlee@gmail.com>
> ---
>  fs/ubifs/ioctl.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
> index da519ba..79ae003 100644
> --- a/fs/ubifs/ioctl.c
> +++ b/fs/ubifs/ioctl.c
> @@ -53,7 +53,7 @@ void ubifs_set_inode_flags(struct inode *inode)
>   * ioctl2ubifs - convert ioctl inode flags to UBIFS inode flags.
>   * @ioctl_flags: flags to convert
>   *
> - * This function convert ioctl flags (@FS_COMPR_FL, etc) to UBIFS inode flags
> + * This function converts ioctl flags (@FS_COMPR_FL, etc) to UBIFS inode flags
>   * (@UBIFS_COMPR_FL, etc).
>   */
>  static int ioctl2ubifs(int ioctl_flags)
> @@ -78,8 +78,8 @@ static int ioctl2ubifs(int ioctl_flags)
>   * ubifs2ioctl - convert UBIFS inode flags to ioctl inode flags.
>   * @ubifs_flags: flags to convert
>   *
> - * This function convert UBIFS (@UBIFS_COMPR_FL, etc) to ioctl flags
> - * (@FS_COMPR_FL, etc).
> + * This function converts UBIFS inode flags (@UBIFS_COMPR_FL, etc) to ioctl
> + * flags (@FS_COMPR_FL, etc).
>   */
>  static int ubifs2ioctl(int ubifs_flags)
>  {
> --
> 1.9.1
>



-- 
Thanks,
Rock
