Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17N9cG-0001oB-00
	for <linux-mtd@lists.infradead.org>; Wed, 26 Jun 2002 11:01:36 +0100
Received: from wohnheim.fh-wedel.de (wohnheim.fh-wedel.de [195.37.86.122])
	by mail.fh-wedel.de (8.9.3/8.9.3) with ESMTP id MAA06055
	for <linux-mtd@lists.infradead.org>; Wed, 26 Jun 2002 12:01:15 +0200
Date: Wed, 26 Jun 2002 12:01:36 +0200
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Subject: Re: 64 bit problem in fs/jffs2/wbuf.c
Message-ID: <20020626120136.A18668@wohnheim.fh-wedel.de>
References: <20020626115501.A25628@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20020626115501.A25628@wohnheim.fh-wedel.de>; from joern@wohnheim.fh-wedel.de on Wed, Jun 26, 2002 at 11:55:01AM +0200
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> Thomas or David, is this a really stupid idea or can I search for
> further bugs elsewhere?
> 
> Joern
> 
> --- wbuf.c	Wed Jun 19 18:56:26 2002
> +++ wbuf.c.new	Wed Jun 26 11:27:27 2002
> @@ -234,7 +234,7 @@
>  		c->wbuf_len = PAGE_MOD(to);			
>  	} 
>  
> -	if (to != PAD(c->wbuf_ofs + c->wbuf_len)) {
> +	if ((unsigned long)to != PAD(c->wbuf_ofs + c->wbuf_len)) {
>  		/* We're not writing immediately after the writebuffer. Bad. */
>  		printk(KERN_CRIT "jffs2_flash_writev(): Non-contiguous write to %08lx\n", (unsigned long)to);
>  		if (c->wbuf_len)

s/unsigned long/uint32_t/

Ok, it was stupid, but is there anything else inherently wrong with
it?

Joern
