Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EIich-0007cM-TD
	for linux-mtd@lists.infradead.org; Fri, 23 Sep 2005 04:09:49 -0400
Message-ID: <4333B867.4050801@inf.u-szeged.hu>
Date: Fri, 23 Sep 2005 10:10:15 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: zhao forrest <zhao_fusheng@hotmail.com>
References: <BAY17-F2907FD1D0C39129EF734BAE8960@phx.gbl>
In-Reply-To: <BAY17-F2907FD1D0C39129EF734BAE8960@phx.gbl>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: 1:1 mapping
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

zhao forrest wrote:

> Your patch may have problem.
> In fact this "reject to mount when cross-boundary" has been in my
> patch, it's quite simple. This code segment is extracted from my patch:
>
> @@ -570,10 +584,8 @@ scan_more:
>              /* Eep. Node goes over the end of the erase block. */
>         printk(KERN_WARNING "Node at 0x%08x with length 0x%08x would
> run over the end of the erase block\n",
>                               ofs, je32_to_cpu(node->totlen));
> -        printk(KERN_WARNING "Perhaps the file system was created
>           with the wrong erase size?\n");
> -                       DIRTY_SPACE(4);
> -                       ofs += 4;
> -                       continue;
> +                       printk(KERN_NOTICE "Perhaps the file system
>       was created with the wrong erase size? Reject to mount.\n");
> +                       return -EINVAL;
>                }

My patch has one more part: detecting that case, if the node header is
also cross-boundary. But that case we cannot say: it is absolutely sure
that it is a cross-boundary node, just can say: it is likely.

Forutnatelly the node header is small enough to say that if someone uses
bad (larger) erase block size, there will be a cross-boundary node which
have a correct node header at the end of the erase block, and only the
body is cross-boundary.

So If everyone agrees we can commit this small part of Zhao's patch.

Ferenc
