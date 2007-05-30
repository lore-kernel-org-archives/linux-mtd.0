Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HtJhz-00038f-U3
	for linux-mtd@lists.infradead.org; Wed, 30 May 2007 04:39:09 -0400
Date: Wed, 30 May 2007 10:38:57 +0200
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: dedekind@infradead.org
Subject: Re: Some issues with the AT91 dataflash driver...
Message-ID: <20070530103857.629b84ee@dhcp-255-175.norway.atmel.com>
In-Reply-To: <1180509202.3642.131.camel@sauron>
References: <465431DA.5030500@atmel.com>
	<1179992308.13101.16.camel@fuzzie.sanpeople.com>
	<46558893.1020802@comcast.net>
	<1180010988.13101.103.camel@fuzzie.sanpeople.com>
	<012d01c79e06$66823470$3204200a@head.local>
	<20070524164654.3f106ead@newbox> <20070524181437.01550127@newbox>
	<20070527200853.3caf8206@dhcp-255-175.norway.atmel.com>
	<20070527211234.40777726@dhcp-255-175.norway.atmel.com>
	<1180374280.3642.114.camel@sauron> <20070528212513.5086bfac@newbox>
	<1180467763.3642.125.camel@sauron>
	<20070529222744.3e7a1489@dhcp-255-175.norway.atmel.com>
	<1180509202.3642.131.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: david-b@pacbell.net, linux-mtd@lists.infradead.org,
	Michal Piotrowski <michal.k.k.piotrowski@gmail.com>,
	Ivan Kuten <ivan.kuten@promwad.com>,
	Vadim Yatsenko <Vadim.Yatsenko@malva.ua>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 30 May 2007 10:13:22 +0300
Artem Bityutskiy <dedekind@infradead.org> wrote:

> Thanks! Could you please try the below patch - it should help.

It does. No more messages, the GC thread stays alive and I can execute
binaries from the mount. Thanks!

Haavard

> >From f84ae9eae2d0b12cff2e0f5a490a3d732458b381 Mon Sep 17 00:00:00 2001  
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Date: Wed, 30 May 2007 12:08:14 +0300
> Subject: [PATCH] JFFS2: fix readinode()
> 
> If we have already read enough bytes, no need to call read_more().
> 
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> ---
>  fs/jffs2/readinode.c |    9 ++++++---
>  1 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
> index 4884d5e..5663e8c 100644
> --- a/fs/jffs2/readinode.c
> +++ b/fs/jffs2/readinode.c
> @@ -1044,7 +1044,8 @@ static int jffs2_get_inode_nodes(struct jffs2_sb_info *c, struct jffs2_inode_inf
>  
>  		case JFFS2_NODETYPE_DIRENT:
>  
> -			if (JFFS2_MIN_NODE_HEADER < sizeof(struct jffs2_raw_dirent)) {
> +			if (JFFS2_MIN_NODE_HEADER < sizeof(struct jffs2_raw_dirent) &&
> +			    len < sizeof(struct jffs2_raw_dirent)) {
>  				err = read_more(c, ref, sizeof(struct jffs2_raw_dirent), &len, buf);
>  				if (unlikely(err))
>  					goto free_out;
> @@ -1058,7 +1059,8 @@ static int jffs2_get_inode_nodes(struct jffs2_sb_info *c, struct jffs2_inode_inf
>  
>  		case JFFS2_NODETYPE_INODE:
>  
> -			if (JFFS2_MIN_NODE_HEADER < sizeof(struct jffs2_raw_inode)) {
> +			if (JFFS2_MIN_NODE_HEADER < sizeof(struct jffs2_raw_inode) &&
> +			    len < sizeof(struct jffs2_raw_inode)) {
>  				err = read_more(c, ref, sizeof(struct jffs2_raw_inode), &len, buf);
>  				if (unlikely(err))
>  					goto free_out;
> @@ -1071,7 +1073,8 @@ static int jffs2_get_inode_nodes(struct jffs2_sb_info *c, struct jffs2_inode_inf
>  			break;
>  
>  		default:
> -			if (JFFS2_MIN_NODE_HEADER < sizeof(struct jffs2_unknown_node)) {
> +			if (JFFS2_MIN_NODE_HEADER < sizeof(struct jffs2_unknown_node) &&
> +			    len < sizeof(struct jffs2_unknown_node)) {
>  				err = read_more(c, ref, sizeof(struct jffs2_unknown_node), &len, buf);
>  				if (unlikely(err))
>  					goto free_out;
> -- 
> 1.5.0.6
