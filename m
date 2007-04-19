Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HecOq-0003o1-1M
	for linux-mtd@lists.infradead.org; Thu, 19 Apr 2007 15:34:39 -0400
From: "Joakim Tjernlund" <joakim.tjernlund@transmode.se>
To: <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH] Obsolete nodes that are unlinked when possible
Date: Thu, 19 Apr 2007 21:34:06 +0200
Message-ID: <006f01c782b9$b23ecfd0$020120ac@Jocke>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1174059907.26465.228.camel@gentoo-jocke.transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ping.

> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org 
> [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of 
> Joakim Tjernlund
> Sent: den 16 mars 2007 16:45
> To: linux-mtd@lists.infradead.org
> Subject: [PATCH] Obsolete nodes that are unlinked when possible
> 
> >From d3e51689869fae928f6289307452a698359302ff Mon Sep 17 
> 00:00:00 2001
> From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> Date: Fri, 16 Mar 2007 16:15:45 +0100
> Subject: [PATCH] Obsolete nodes that are unlinked when possible.
> 
> 
> Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> ---
>  fs/jffs2/write.c |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
> index 6717679..57a79a6 100644
> --- a/fs/jffs2/write.c
> +++ b/fs/jffs2/write.c
> @@ -507,8 +507,7 @@ int jffs2_do_unlink(struct jffs2_sb_info 
> *c, struct jffs2_inode_info *dir_f,
>  	uint32_t alloclen;
>  	int ret;
>  
> -	if (1 /* alternative branch needs testing */ ||
> -	    !jffs2_can_mark_obsolete(c)) {
> +	if (!jffs2_can_mark_obsolete(c)) {
>  		/* We can't mark stuff obsolete on the medium. 
> We need to write a deletion dirent */
>  
>  		rd = jffs2_alloc_raw_dirent();
> -- 
> 1.4.4.4
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
> 
