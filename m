Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NcFKw-0002tu-IK
	for linux-mtd@lists.infradead.org; Tue, 02 Feb 2010 09:46:27 +0000
Received: from sesr04.transmode.se (sesr04.transmode.se [192.168.201.15])
	by gw1.transmode.se (Postfix) with ESMTP id DA59C650002
	for <linux-mtd@lists.infradead.org>;
	Tue,  2 Feb 2010 10:46:15 +0100 (CET)
In-Reply-To: <1265103600-32522-1-git-send-email-Joakim.Tjernlund@transmode.se>
References: <1265103600-32522-1-git-send-email-Joakim.Tjernlund@transmode.se>
Subject: Re: [PATCH] JFFS2: Erase max 3 EB's in jffs2_write_super()
Cc: linux-mtd@lists.infradead.org
Message-ID: <OF04B03B42.0D1C9BA8-ONC12576BE.00355ACE-C12576BE.00357DE9@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Tue, 2 Feb 2010 10:44:16 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joakim Tjernlund <Joakim.Tjernlund@transmode.se> wrote on 2010/02/02 10:40:00:
>
> Deleting big files in a JFFS2 root FS and the rebooting makes
> the system hang until all freed EB's has been erased which
> can take several minutes.
> Fix the hanging by making jffs2_write_super() erase max 3 EB's
> at a time. If there are more EB's to erase afterwards, reset the
> s_dirty flag.
>
> Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> ---
>
>  I hope the list_empty calls doesn't need locking. If
>  so, it can easily be added.
>
>  fs/jffs2/super.c |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
> index 9a80e8e..10393e0 100644
> --- a/fs/jffs2/super.c
> +++ b/fs/jffs2/super.c
> @@ -64,7 +64,10 @@ static void jffs2_write_super(struct super_block *sb)
>     if (!(sb->s_flags & MS_RDONLY)) {

I wonder if not MS_ACTIVE should be included in the above test too?

       Jocke
