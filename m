Received: from bay17-f29.bay17.hotmail.com ([64.4.43.79] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EIdN2-0002Oz-MH
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 22:33:25 -0400
Message-ID: <BAY17-F2907FD1D0C39129EF734BAE8960@phx.gbl>
In-Reply-To: <433342CF.9000102@inf.u-szeged.hu>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: havasi@inf.u-szeged.hu, joern@wohnheim.fh-wedel.de
Date: Fri, 23 Sep 2005 10:33:02 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
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




>From: Ferenc Havasi <havasi@inf.u-szeged.hu>
>To: Jörn Engel <joern@wohnheim.fh-wedel.de>
>CC: "Artem B. Bityutskiy" <dedekind@infradead.org>,  zhao forrest 
<zhao_fusheng@hotmail.com>,  linux-mtd@lists.infradead.org
>Subject: Re: 1:1 mapping
>Date: Fri, 23 Sep 2005 01:48:31 +0200
>
>Jörn Engel wrote:
>
> >On Thu, 22 September 2005 17:54:58 +0400, Artem B. Bityutskiy wrote:
> >
> >
> >>On Thu, 2005-09-22 at 15:48 +0200, Jörn Engel wrote:
> >>
> >>
> >>>Can you explain "when JFFS2 has detected that the image is an old
> >>>image" in C?
> >>>
> >>>
> >>Well, we may even do better. Scan FS. If we meet any node which crosses
> >>the eraseblock boundary - bye bye. That must be easy to implement as
> >>node headers contain the total node length.
> >>
> >>
> >
> >Sounds fine.  Yes, that appears to be the best solution.
> >
> >
>
>Yes, that is the same I wrote in my letter. As Artem asked me to
>implement it I wrote a patch, you can find it at
>http://www.inf.u-szeged.hu/jffs2/cross-boundary.patch
>
>I have not tested it yet (it will be task of tomorrow) I would just to
>show what is in my mind.
>
>Ferenc
>

Your patch may have problem.
In fact this "reject to mount when cross-boundary" has been in my
patch, it's quite simple. This code segment is extracted from my patch:

@@ -570,10 +584,8 @@ scan_more:
              /* Eep. Node goes over the end of the erase block. */
         printk(KERN_WARNING "Node at 0x%08x with length 0x%08x would
 run over the end of the erase block\n",
                               ofs, je32_to_cpu(node->totlen));
-        printk(KERN_WARNING "Perhaps the file system was created 
           with the wrong erase size?\n");
-                       DIRTY_SPACE(4);
-                       ofs += 4;
-                       continue;
+                       printk(KERN_NOTICE "Perhaps the file system
       was created with the wrong erase size? Reject to mount.\n");
+                       return -EINVAL;
                }

Thanks,
Forrest
