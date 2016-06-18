Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEFom-0005fV-Gl
 for linux-mtd@lists.infradead.org; Sat, 18 Jun 2016 12:57:45 +0000
Received: by mail-oi0-x241.google.com with SMTP id d132so18101786oig.3
 for <linux-mtd@lists.infradead.org>; Sat, 18 Jun 2016 05:57:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160618095218.GA2214@makrotopia.org>
References: <20160618095218.GA2214@makrotopia.org>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 18 Jun 2016 14:57:22 +0200
Message-ID: <CAFLxGvziwPhuX9Uh_L52_bb8Q2_mwQbC=NP1fk9=jLxGrNAOnA@mail.gmail.com>
Subject: Re: [PATCH] ubifs: silence error output if MS_SILENT is set
To: Daniel Golle <daniel@makrotopia.org>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jun 18, 2016 at 11:52 AM, Daniel Golle <daniel@makrotopia.org> wrote:
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  fs/ubifs/super.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index 7034995..ae32b3c 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -2108,8 +2108,9 @@ static struct dentry *ubifs_mount(struct file_system_type *fs_type, int flags,
>          */
>         ubi = open_ubi(name, UBI_READONLY);
>         if (IS_ERR(ubi)) {
> -               pr_err("UBIFS error (pid: %d): cannot open \"%s\", error %d",
> -                      current->pid, name, (int)PTR_ERR(ubi));
> +               if (flags & MS_SILENT)
> +                       pr_err("UBIFS error (pid: %d): cannot open \"%s\", error %d",
> +                              current->pid, name, (int)PTR_ERR(ubi));

This needs a more detailed explanation.
Why does UBIFS need this? Only very few filesystems care about MS_SILENT.
What problem are you trying to address?

-- 
Thanks,
//richard
