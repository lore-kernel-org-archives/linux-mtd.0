Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVsgS-0000cl-39
 for linux-mtd@lists.infradead.org; Sun, 09 Dec 2018 06:35:24 +0000
Subject: Re: [PATCH] jffs2: fix invocations of dbg_xattr() for dead
 jffs2_xattr_ref
From: Hou Tao <houtao1@huawei.com>
To: <linux-mtd@lists.infradead.org>, <dwmw2@infradead.org>
CC: <richard.weinberger@gmail.com>, <boris.brezillon@bootlin.com>,
 <linux-kernel@vger.kernel.org>
References: <20181020110753.98407-1-houtao1@huawei.com>
Message-ID: <bbd62e07-99f7-e198-fc26-8b4a8470b8e9@huawei.com>
Date: Sun, 9 Dec 2018 14:34:59 +0800
MIME-Version: 1.0
In-Reply-To: <20181020110753.98407-1-houtao1@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ping ?

On 2018/10/20 19:07, Hou Tao wrote:
> When jffs2_xattr_ref is dead, xref->ic or xref->xd will be invalid
> because these fields will be reused as xref->ino or xref->xid,
> so access xref->ic->ino or xref->xd->xid will lead to Oops.
> 
> Fix the problem by checking whether or not it is a dead xref.
> 
> Signed-off-by: Hou Tao <houtao1@huawei.com>
> ---
>  fs/jffs2/xattr.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
> index 3d40fe02b003..0c4c7891556d 100644
> --- a/fs/jffs2/xattr.c
> +++ b/fs/jffs2/xattr.c
> @@ -550,7 +550,8 @@ static int save_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_ref *ref)
>  	ref->xseqno = xseqno;
>  	jffs2_add_physical_node_ref(c, phys_ofs | REF_PRISTINE, PAD(sizeof(rr)), (void *)ref);
>  
> -	dbg_xattr("success on saving xref (ino=%u, xid=%u)\n", ref->ic->ino, ref->xd->xid);
> +	dbg_xattr("success on saving xref (ino=%u, xid=%u)\n",
> +			je32_to_cpu(rr.ino), je32_to_cpu(rr.xid));
>  
>  	return 0;
>  }
> @@ -1329,7 +1330,11 @@ int jffs2_garbage_collect_xattr_ref(struct jffs2_sb_info *c, struct jffs2_xattr_
>  	rc = save_xattr_ref(c, ref);
>  	if (!rc)
>  		dbg_xattr("xref (ino=%u, xid=%u) GC'ed from %#08x to %08x\n",
> -			  ref->ic->ino, ref->xd->xid, old_ofs, ref_offset(ref->node));
> +				is_xattr_ref_dead(ref) ?
> +					ref->ino : ref->ic->ino,
> +				is_xattr_ref_dead(ref) ?
> +					ref->xid : ref->xd->xid,
> +				old_ofs, ref_offset(ref->node));
>   out:
>  	if (!rc)
>  		jffs2_mark_node_obsolete(c, raw);
> 
