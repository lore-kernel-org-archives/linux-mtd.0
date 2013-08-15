Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VA4tf-0001h0-C0
 for linux-mtd@lists.infradead.org; Thu, 15 Aug 2013 21:15:56 +0000
Date: Thu, 15 Aug 2013 18:15:29 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: wang.bo116@zte.com.cn
Subject: Re: [PATCH] UBIFS: remove unnecessary code in ubifs_garbage_collect
Message-ID: <20130815211528.GC2831@localhost>
References: <OF5D2B97A5.BBB53CFB-ON48257BC8.00312DE8-48257BC8.003BEE50@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OF5D2B97A5.BBB53CFB-ON48257BC8.00312DE8-48257BC8.003BEE50@zte.com.cn>
Cc: artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

First of all: thanks for contributing!

On Thu, Aug 15, 2013 at 06:54:26PM +0800, wang.bo116@zte.com.cn wrote:
> 
> Hi,
> 	In ubifs_garbage_collect, "space_before" calculate twice, i think the
> first one is unnecessary.
> 

Mmm... this is not the way patches are contributed, although you were
close.

Please read: Documentation/SubmittingPatches and maybe see this video
as well:

http://www.youtube.com/watch?v=XXix80GCvpo

Thanks!

> 
> Signed-off-by: wang bo <wang.bo116@zte.com.cn>
> diff --git a/fs/ubifs/gc.c b/fs/ubifs/gc.c
> index 76ca53c..38dc67d 100755
> --- a/fs/ubifs/gc.c
> +++ b/fs/ubifs/gc.c
> @@ -668,7 +668,7 @@ int ubifs_garbage_collect(struct ubifs_info *c, int
> anyway)
>  	ubifs_assert(!wbuf->used);
> 
>  	for (i = 0; ; i++) {
> -		int space_before = c->leb_size - wbuf->offs - wbuf->used;
> +		int space_before;
>  		int space_after;
> 
>  		cond_resched();
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
