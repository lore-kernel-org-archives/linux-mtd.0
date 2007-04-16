Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HdQ3A-00011j-JT
	for linux-mtd@lists.infradead.org; Mon, 16 Apr 2007 08:11:17 -0400
Subject: Re: [Resend: [PATCH] Speed up mount for cfi_cmdset_0001 users]
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1175508048.12080.2.camel@gentoo-jocke.transmode.se>
References: <1175508048.12080.2.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Mon, 16 Apr 2007 14:11:11 +0200
Message-Id: <1176725471.12449.2.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-04-02 at 12:00 +0200, Joakim Tjernlund wrote:
> Resending.
> 
>  Jocke 
> -------- Forwarded Message --------
> From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
> Reply-To: joakim.tjernlund@transmode.se
> To: linux-mtd@lists.infradead.org
> Subject: [PATCH] Speed up mount for cfi_cmdset_0001 users
> Date: Tue, 27 Mar 2007 13:44:01 +0200
> 
> This will speed up mount greatly for users of point/unpoint method
> like cfi_cmdset_0001. Please Apply.
> 
>  Jocke
> 
> >From bcd1aa987ab786c526e225269775a557a1bcbe1f Mon Sep 17 00:00:00 2001
> From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> Date: Tue, 27 Mar 2007 13:32:09 +0200
> Subject: [PATCH] Speed up mount for cfi_cmdset_0001 users
> Remove excessive scanning of empty flash after a clean
> marker for users of the point/unpoint method. cfi_cmdset_0001
> uses point/unpoint by default iff flash mapping is linear.
> The speedup is several orders of magnitude if FS is less than
> half full.
> 
> Signed-off-by: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
> ---
>  fs/jffs2/scan.c |   15 +++++++++++----
>  1 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
> index b98661a..4679abe 100644
> --- a/fs/jffs2/scan.c
> +++ b/fs/jffs2/scan.c
> @@ -632,16 +632,17 @@ scan_more:
[SNIP]

hmm, heard nothing useful about this patch since I submitted it.
Just busy or don't like?

 Jocke
