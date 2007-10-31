Subject: Re: [PATCH] NULLify ->raw after jffs2_mark_node_obsolete().
From: David Woodhouse <dwmw2@infradead.org>
To: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
In-Reply-To: <1193765964-30069-2-git-send-email-Joakim.Tjernlund@transmode.se>
References: <1193765964-30069-1-git-send-email-Joakim.Tjernlund@transmode.se>
	<1193765964-30069-2-git-send-email-Joakim.Tjernlund@transmode.se>
Content-Type: text/plain
Date: Wed, 31 Oct 2007 10:41:22 -0400
Message-Id: <1193841682.2651.104.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-10-30 at 18:39 +0100, Joakim Tjernlund wrote:
> --- a/fs/jffs2/nodelist.c
> +++ b/fs/jffs2/nodelist.c
> @@ -34,13 +34,19 @@ void jffs2_add_fd_to_list(struct jffs2_sb_info *c, struct jffs2_full_dirent *new
>                         if (new->version < (*prev)->version) {
>                                 dbg_dentlist("Eep! Marking new dirent node is obsolete, old is \"%s\", ino #%u\n",
>                                         (*prev)->name, (*prev)->ino);
> -                               jffs2_mark_node_obsolete(c, new->raw);
> +                               if (new->raw) {
> +                                       jffs2_mark_node_obsolete(c, new->raw);
> +                                       new->raw = NULL;
> +                               }
>                                 jffs2_free_full_dirent(new);
>                         } else {


We're never going to be adding a _new_ node where fd->raw is NULL. This
test is superfluous.

>                                 dbg_dentlist("marking old dirent \"%s\", ino #%u bsolete\n",
>                                         (*prev)->name, (*prev)->ino);
>                                 new->next = (*prev)->next;
> -                               jffs2_mark_node_obsolete(c, ((*prev)->raw));
> +                               if ((*prev)->raw) { /* Can be true during mount if a is unmarked in flash */
> +                                       jffs2_mark_node_obsolete(c, ((*prev)->raw));
> +                                       (*prev)->raw = NULL;
> +                               }
>                                 jffs2_free_full_dirent(*prev);
>                                 *prev = new;
>                         }

This one makes sense though, and is a necessary part of your first
patch. After your first patch, we're going to be leaving full_dirents in
the list which have NULL fd->raw -- and we mustn't crash when we later
obsolete those dirents (by creating a new file with the same name).

> @@ -104,6 +110,7 @@ static void jffs2_obsolete_node_frag(struct jffs2_sb_info *c,
>                         dbg_fragtree2("marking old node @0x%08x (0x%04x-0x%04x) obsolete\n",
>                                 ref_offset(this->node->raw), this->node->ofs, this->node->ofs+this->node->size);
>                         jffs2_mark_node_obsolete(c, this->node->raw);
> +                       this->node->raw = NULL;
>                         jffs2_free_full_dnode(this->node);
>                 } else {

This is just noise. There's no point in setting foo->raw to NULL
immediately before we free foo->raw anyway. Most of the rest of this
patch is of this form, but there are one or two cases which aren't and
perhaps merit closer investigation.

-- 
dwmw2
