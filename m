Received: from wall.comdev.cc ([63.150.62.162] helo=cleanup.comdev.cc)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dgX3-0002g9-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Feb 2002 23:52:18 +0000
Message-ID: <3C74383D.EC664E52@comdev.cc>
Date: Wed, 20 Feb 2002 15:58:53 -0800
From: Adam Wozniak <adam.wozniak@comdev.cc>
MIME-Version: 1.0
To: gleixner@autronix.de
CC: David Woodhouse <dwmw2@infradead.org>,
 	linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: JFFS2 list_dirty corruption
References: <02022020414807.18560@thomas> <02022021101508.18560@thomas>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Ok, maybe this is a problem:


Thomas Gleixner wrote:
> 
> On Wednesday, 20. February 2002 20:41, Thomas Gleixner wrote:
> > While hacking on JFFS2 for NAND I found a possibility, where scan_medium
> > corrupts list_dirty.
> This patch resolves the problem:
> 
> --- org/fs/jffs2/scan.c
> +++ work/fs/jffs2/scan.c
> @@ -128,9 +128,15 @@
>                                  (!c->nextblock || c->nextblock->free_size <
> jeb->free_size)) {
>                                  /* Better candidate for the next writes to
> go to */
>                                  if (c->nextblock)

UMMM open { here?

> +                                       /* We must delete, because mark_node_obsolete
> +                                          could have added this block to dirty_list already */
> +                                        list_del(&c->nextblock->list);

and close } here?

>                                          list_add(&c->nextblock->list,
> &c->dirty_list);
>                                  c->nextblock = jeb;
>                          } else {
> +                               /* We must delete, because mark_node_obsolete
> +                                  could have added this block to dirty_list already */
> +                               list_del(&jeb->list);
>                                  list_add(&jeb->list, &c->dirty_list);
>                          }
>                 } else {


-- 
Adam Wozniak (KG6GZR)   COM DEV Wireless - Digital and Software Systems
awozniak@comdev.cc      805 Aerovista Place, San Luis Obispo, CA 93401
                        http://www.comdev.cc
                        Voice: (805) 544-1089       Fax: (805) 544-2055
