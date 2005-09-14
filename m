Received: from [84.204.75.148] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EFWQG-0004Yy-0a
	for linux-mtd@lists.infradead.org; Wed, 14 Sep 2005 08:31:40 -0400
Message-ID: <432817FF.10307@yandex.ru>
Date: Wed, 14 Sep 2005 16:30:55 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Peter Menzebach <pm-mtd@mw-itcon.de>
References: <432812E8.2030807@mw-itcon.de>
In-Reply-To: <432812E8.2030807@mw-itcon.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: data  loss on jffs2 filesystem on dataflash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Peter Menzebach wrote:
> Hi,
> I loose files, which I write on a jffs2 filesystem.
Do you have sumary enabled ? If yes, try to disable it.

> Maybe someone can give me a pointer, what might be wrong.
Frankly, I do not know DataFlash specificity but I have several basic 
questions bellow :)

> mount /conf
> JFFS2 write-buffering enabled (8448)
> [JFFS2 DBG] (109) __jffs2_dbg_dump_block_lists_nolock: dump JFFS2 blocks 
[snip]
> [JFFS2 DBG] (111) jffs2_add_full_dnode_to_inode: adding node 0x00-0x04 
Why I don't see messages from scan.c? Strange.

> [root@armbox /root]$
[snip]
> PM: dataflash_write: 8574720 .. 8583168
[snip]
> PM: dataflash_write: 8574720 .. 8583168
two nodes are written to the same place ? That's odd...

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
