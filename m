Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Cm8cn-0007jM-Bj
	for linux-mtd@lists.infradead.org; Wed, 05 Jan 2005 05:42:48 -0500
Message-ID: <41DBC47B.4080003@yandex.ru>
Date: Wed, 05 Jan 2005 13:42:03 +0300
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, dwmw2@infradead.org
References: <Pine.LNX.4.58.0501031923110.14981@phoenix.infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501031923110.14981@phoenix.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: [PATCH] JFFS[23] slab corruption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Artem B. Bityuckiy wrote:
> Hi.
> 
> There is slab corruption bug in JFFS2. Patch is attached.
> 
> Problem:
> In jffs2_do_clear_inode() we call the jffs2_kill_fragtree() which kills 
> the fragtree and mark the correspondent nodes obsolete.
> 
> The jffs2_mark_node_obsolete function frees the inode's jffs2_inode_cache 
> object when marks the last node obsolete (nodemngnt.c:594). But the 
> f->inocache still points to this deleted object.
> 
> Later in jffs2_do_clear_inode() we set the f->inocache state thus, 
> corrupting the slab cache object which does not belong us anymore. I have 
> seen several messages about the slab corruption.
> 
> Ok to commit it ?

I'm sorry, I attached wrong file. Here is the patch:

RCS file: /home/cvs/mtd/fs/jffs2/readinode.c,v
retrieving revision 1.117
diff -u -r1.117 readinode.c
--- readinode.c 20 Nov 2004 18:06:54 -0000      1.117
+++ readinode.c 3 Jan 2005 19:24:41 -0000
@@ -688,7 +688,7 @@
                 jffs2_free_full_dirent(fd);
         }

-       if (f->inocache && f->inocache->state != INO_STATE_CHECKING)
+       if (!deleted && f->inocache->state != INO_STATE_CHECKING)
                 jffs2_set_inocache_state(c, f->inocache, 
INO_STATE_CHECKEDABSENT);

         up(&f->sem);


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
